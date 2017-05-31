//
//  CloverGoConnectorListener.swift
//  CloverGoConnector
//
//  Created by Veeramani, Rajan (Non-Employee) on 4/17/17.
//  Copyright © 2017 Veeramani, Rajan (Non-Employee). All rights reserved.
//

import Foundation
import clovergoclient

@objc public protocol ICloverGoConnectorListener : ICloverConnectorListener {
    
    
    func onAidMatch(cardApplicationIdentifiers:[CardApplicationIdentifier],delegate:AidSelection) -> Void
    
//    func proceedOnError(event:TransactionEvent,proceedOnErrorDelegate:ProceedOnError)
    
    func onDevicesDiscovered(readers:[ReaderInfo]) ->Void
    
    func onTransactionProgress(event: CardReaderEvent) -> Void
    
}
