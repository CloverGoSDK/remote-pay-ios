//
//  ReaderSetUpViewController.swift
//  CloverConnector
//
//  Created by Deshmukh, Harish (Non-Employee) on 5/23/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import CloverConnector
import  clovergoclient

var is350ReaderInitialized = false
var is450ReaderInitialized = false
var isOAuthMode = false
var cloverGoConnector : ICloverGoConnector?
var cloverGoConnector350Reader : ICloverGoConnector?
var cloverGoConnector450Reader : ICloverGoConnector?
var cloverConnectorListener:CloverConnectorListener?

@objc protocol StartTransactionDelegate{
    func proceedAfterReaderReady(merchantInfo: MerchantInfo)
    func readerDisconnected()
}

var delegateStartTransaction:StartTransactionDelegate? = nil

let workingQueue = dispatch_queue_create("my_queue", nil)


class ReaderSetUpViewController: UIViewController, StartTransactionDelegate {
    
    @IBOutlet weak var buttonConnect350: UIButton!
    @IBOutlet weak var buttonConnect450: UIButton!
    @IBOutlet weak var labelConnect350: UILabel!
    @IBOutlet weak var labelConnect450: UILabel!
    
    var accessToken: String?
    var apiKey: String?
    var secret: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkReaderConnectedStatus()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action_connect350Button(sender: AnyObject)
    {
        if(!is350ReaderInitialized)
        {
            if(((accessToken) != nil) && ((apiKey) != nil) && ((secret) != nil))
            {
                if(isOAuthMode)
                {
                    let config350Reader = CloverGoDeviceConfiguration.Builder(apiKey: apiKey!, secret: secret!, env: .test).accessToken(accessToken!).allowAutoConnect(true).allowDuplicateTransaction(true).deviceType(.RP350).build()
                    cloverGoConnector350Reader = CloverGoConnector(config: config350Reader)
                }
                else
                {
                    let config350Reader : CloverGoDeviceConfiguration = CloverGoDeviceConfiguration.Builder(apiKey: apiKey!, secret: secret!, env: .test).accessToken(accessToken!).allowAutoConnect(true).allowDuplicateTransaction(true).deviceType(.RP350).build()
                    cloverGoConnector350Reader = CloverGoConnector(config: config350Reader)
                }
                
                cloverConnectorListener = CloverGoConnectorListener(cloverConnector: cloverGoConnector350Reader!)
                (cloverGoConnector350Reader as? CloverGoConnector)?.addCloverGoConnectorListener((cloverConnectorListener as? ICloverGoConnectorListener)!)
                
                (UIApplication.sharedApplication().delegate as! AppDelegate).cloverConnector = cloverGoConnector350Reader
                
                cloverGoConnector350Reader?.initializeConnection()
            }
            else
            {
                let alert = UIAlertController(title: nil, message: "Missing parameters to initialize the SDK", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        else
        {
            let alert = UIAlertController(title: nil, message: "Reader 350 is already initialized", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        delegateStartTransaction = self
    }
    
    @IBAction func action_connect450Button(sender: AnyObject)
    {
        if(!is450ReaderInitialized)
        {
            if(((accessToken) != nil) && ((apiKey) != nil) && ((secret) != nil))
            {
                if(isOAuthMode)
                {
                    let config450Reader = CloverGoDeviceConfiguration.Builder(apiKey: apiKey!, secret: secret!, env: .test).accessToken(accessToken!).allowAutoConnect(true).allowDuplicateTransaction(true).build()
                    cloverGoConnector450Reader = CloverGoConnector(config: config450Reader)
                }
                else
                {
                    let config450Reader : CloverGoDeviceConfiguration = CloverGoDeviceConfiguration.Builder(apiKey: apiKey!, secret: secret!, env: .test).accessToken(accessToken!).allowAutoConnect(true).allowDuplicateTransaction(true).build()
                    cloverGoConnector450Reader = CloverGoConnector(config: config450Reader)
                }
                
                cloverConnectorListener = CloverGoConnectorListener(cloverConnector: cloverGoConnector450Reader!)
                (cloverGoConnector450Reader as? CloverGoConnector)?.addCloverGoConnectorListener((cloverConnectorListener as? ICloverGoConnectorListener)!)
                
                (UIApplication.sharedApplication().delegate as! AppDelegate).cloverConnector = cloverGoConnector450Reader
                
                cloverGoConnector450Reader?.initializeConnection()
            }
            else
            {
                let alert = UIAlertController(title: nil, message: "Missing parameters to initialize the SDK", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        else
        {
            let alert = UIAlertController(title: nil, message: "Reader 450 is already initialized", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        delegateStartTransaction = self
    }
    
    //MARK: SelectReader
    
    func selectedReader(readerInfo: ReaderInfo)
    {
        dismissViewControllerAnimated(true, completion: nil)
        //        AlertLoading.show("Connecting to \nReader: \(readerInfo.bluetoothName!)")
        cloverGoConnector450Reader?.connectToBluetoothReader(readerInfo)
    }
    
    //MARK: StartTransactionDelegate delegates
    
    func proceedAfterReaderReady(merchantInfo: MerchantInfo)
    {
        if merchantInfo.deviceInfo?.deviceModel == "RP350"
        {
            is350ReaderInitialized = true
            checkReaderConnectedStatus()
        }
        if merchantInfo.deviceInfo?.deviceModel == "RP450"
        {
            is450ReaderInitialized = true
            checkReaderConnectedStatus()
        }
        
        dispatch_async(workingQueue) {
            NSThread.sleepForTimeInterval(3)
            dispatch_async(dispatch_get_main_queue()){
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("tabControllerID") as! TabBarController
                self.presentViewController(nextViewController, animated:true, completion:nil)
            }
        }
    }
    
    func readerDisconnected()
    {
        is350ReaderInitialized = false
        is450ReaderInitialized = false
        checkReaderConnectedStatus()
    }
    
    func checkReaderConnectedStatus()
    {
        if is350ReaderInitialized{
            labelConnect350.text = "Reader 350 connected ✅"
            buttonConnect350.setTitle("Disconnect", forState: .Normal)
        }
        else{
            labelConnect350.text = "No 350 Reader connected"
            buttonConnect350.setTitle("Connect", forState: .Normal)
        }
        if is450ReaderInitialized{
            labelConnect450.text = "Reader 450 connected ✅"
            buttonConnect450.setTitle("Disconnect", forState: .Normal)
        }
        else{
            labelConnect450.text = "No 450 Reader connected"
            buttonConnect450.setTitle("Connect", forState: .Normal)
        }
    }
}
