//
//  ViewController.swift
//  ExamplePOS
//
//  
//  Copyright © 2017 Clover Network, Inc. All rights reserved.
//

import UIKit
import CloverConnector
import Intents

class ViewController: UIViewController {

    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var endpointTextField: UITextField!
    
    private let WS_ENDPOINT = "WS_ENDPOINT"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedEndpoint = NSUserDefaults.standardUserDefaults().stringForKey(WS_ENDPOINT) {
            endpointTextField.text = savedEndpoint
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func longPressConnect(sender: UIButton) {
        connect(true)
    }
    @IBAction func tapConnect(sender: AnyObject) {
        connect(false)
    }
    
    private func connect(forcePairing:Bool) {
        if let endpoint = endpointTextField.text {
            debugPrint(endpoint)
            NSUserDefaults.standardUserDefaults().setValue(endpoint, forKey: WS_ENDPOINT)
            if forcePairing {
                (UIApplication.sharedApplication().delegate as! AppDelegate).clearConnect(endpoint)
            } else {
                (UIApplication.sharedApplication().delegate as! AppDelegate).connect(endpoint)
            }
        }
    }
    @IBAction func action_CloverGoButton(sender: AnyObject)
    {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        let reader350Action = UIAlertAction(title: "Demo Mode", style: .Default, handler: { (action: UIAlertAction!) in
            self.selectDemoMode()
        })
        let reader450Action = UIAlertAction(title: "OAuth Mode", style: .Default, handler: { (action: UIAlertAction!) in
            self.selectOAuthMode()
        })
        alert.addAction(reader350Action)
        alert.addAction(reader450Action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func selectDemoMode()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("readerSetUpViewControllerID") as! ReaderSetUpViewController
        nextViewController.accessToken = "0a7637b3-66eb-623c-7d9b-2acfb90d8237"
        nextViewController.apiKey = "Lht4CAQq8XxgRikjxwE71JE20by5dzlY"
        nextViewController.secret = "7ebgf6ff8e98d1565ab988f5d770a911e36f0f2347e3ea4eb719478c55e74d9g"
        self.presentViewController(nextViewController, animated:true, completion:nil)
    }
    
    func selectOAuthMode()
    {
        
    }

}

