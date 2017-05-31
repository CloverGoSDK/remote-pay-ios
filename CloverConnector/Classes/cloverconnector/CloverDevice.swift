//
//  CloverDevice.swift
//  CloverConnector
//
//  
//  Copyright © 2017 Clover Network, Inc. All rights reserved.
//

import Foundation

protocol ICloverDevice {
}

class CloverDevice {
    var deviceObservers:NSMutableArray = NSMutableArray()
    
    var transport:CloverTransport
    var packageName:String? = nil
    
    init (packageName:String, transport:CloverTransport) {
        self.transport = transport
        self.packageName = packageName
    }
    
    func subscribe(observer:CloverDeviceObserver) {
        deviceObservers.addObject(observer)
    }
    
    func unsubscribe(observer:CloverDeviceObserver) {
        deviceObservers.removeObject(observer)
    }
    
    func doDiscoveryRequest() {}
    
    func doTxStart(payIntent:PayIntent, order:CLVModels.Order.Order?, suppressTipScreen:Bool) {}
    
    func doKeyPress(keyPress:KeyPress) {}
    
    func doVoidPayment(payment:CLVModels.Payments.Payment, reason:String) {}
    
    func doCaptureAuth(paymentID:String, amount:Int, tipAmount:Int) {}
    
    func doOrderUpdate(displayOrder:DisplayOrder, orderOperation operation:DisplayOrderModifiedOperation?) {}
    
    func doSignatureVerified(payment:CLVModels.Payments.Payment, verified:Bool) {}
    
    func doTerminalMessage(text:String) {}
    
    func doPaymentRefund(orderId:String, paymentId:String, amount:Int, fullRefund:Bool) {} // manual refunds are handled via doTxStart
    
    func doTipAdjustAuth(orderId:String, paymentId:String, amount:Int) {}
    
    func doBreak() {}
    
    func doPrintText(textLines:[String]) {}
    
    func doShowWelcomeScreen() {}
    
    func doShowPaymentReceiptScreen(orderId:String, paymentId:String) {}
    
    func doShowThankYouScreen() {}
    
    func doOpenCashDrawer(reason:String) {}
    
    //func doPrintImage(bitmap:UIImage) {}
    func doPrintImage(url:String) {}
    
    func dispose() {}
    
    func doCloseout(allowOpenTabs:Bool, batchId:String?) {}
    
    func doVaultCard(cardEntryMethods:Int) {}
    
    func doAcceptPayment( _ payment:CLVModels.Payments.Payment) {}
    
    func doRejectPayment( _ payment:CLVModels.Payments.Payment, challenge:Challenge) {}
    
    func doRetrievePendingPayments() {}
    
    func doReadCardData(payIntent:PayIntent) {}
    
}
