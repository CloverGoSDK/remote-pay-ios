//
//  MiscViewController.swift
//  ExamplePOS
//
//  
//  Copyright © 2017 Clover Network, Inc. All rights reserved.
//

import Foundation
import UIKit
import CloverConnector

class MiscViewController : UIViewController {
        
    @IBAction func welcomeClicked(sender: UIButton) {
        (UIApplication.sharedApplication().delegate as! AppDelegate).cloverConnector?.showWelcomeScreen()
    }
    @IBAction func thankYouClicked(sender: UIButton) {
        (UIApplication.sharedApplication().delegate as! AppDelegate).cloverConnector?.showThankYouScreen()
    }
    @IBAction func showMessageClicked(sender: UIButton) {
        (UIApplication.sharedApplication().delegate as! AppDelegate).cloverConnector?.showMessage("Hello iOS!")
    }
    @IBAction func resetClicked(sender: UIButton) {
        (UIApplication.sharedApplication().delegate as! AppDelegate).cloverConnector?.resetDevice()
    }
    @IBAction func readCardData(sender: UIButton) {
        let request:ReadCardDataRequest = ReadCardDataRequest()
        (UIApplication.sharedApplication().delegate as! AppDelegate).cloverConnector?.readCardData(request);
    }
    @IBAction func requestPendingPayments(sender: UIButton) {
        (UIApplication.sharedApplication().delegate as! AppDelegate).cloverConnector?.retrievePendingPayments()
    }
}
