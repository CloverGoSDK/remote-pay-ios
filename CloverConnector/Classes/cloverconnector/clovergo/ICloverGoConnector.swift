//
//  ICloverGoConnector.swift
//  Pods
//
//  Created by Veeramani, Rajan (Non-Employee) on 5/2/17.
//
//

import Foundation
import clovergoclient


public protocol ICloverGoConnector : ICloverConnector {
    
    func scanForBluetoothReaders() -> Void
    
    func connectToBluetoothReader(readerInfo:ReaderInfo) -> Void
    
    func disconnectReader() -> Void
    
    func addCloverGoConnectorListener(cloverConnectorListener: ICloverGoConnectorListener) -> Void
    
}
