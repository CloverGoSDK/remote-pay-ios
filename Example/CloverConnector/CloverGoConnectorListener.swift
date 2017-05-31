//
//  CloverGoConnectorListener.swift
//  CloverConnector
//
//  Created by Veeramani, Rajan (Non-Employee) on 5/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import CloverConnector
import clovergoclient

class CloverGoConnectorListener : CloverConnectorListener, ICloverGoConnectorListener {
    
    func onAidMatch(cardApplicationIdentifiers:[CardApplicationIdentifier],delegate:AidSelection) -> Void {
        
    }
    
    func onDevicesDiscovered(readers:[ReaderInfo]) ->Void {
        print("Discovered Readers...")
        let choiceAlert = UIAlertController(title: "Choose your reader", message: "Please select one of the reader", preferredStyle: .ActionSheet)
        for reader in readers {
            let action = UIAlertAction(title: reader.bluetoothName, style: .Default, handler: {
                (action:UIAlertAction) in
                (cloverGoConnector450Reader as? CloverGoConnector)?.connectToBluetoothReader(reader)
            })
            choiceAlert.addAction(action)
        }
        choiceAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (action:UIAlertAction) in
            
        }))
        var topController = UIApplication.sharedApplication().keyWindow!.rootViewController! as UIViewController
        while ((topController.presentedViewController) != nil) {
            topController = topController.presentedViewController!
        }
        topController.presentViewController(choiceAlert, animated:true, completion:nil)
        
    }
    
    func onTransactionProgress(event: CardReaderEvent) -> Void {
        print("\(event.toString())")
    }
    
}
