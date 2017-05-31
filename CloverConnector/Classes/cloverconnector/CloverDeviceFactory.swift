//
//  CloverDeviceFactory.swift
//  CloverConnector
//
//  
//  Copyright © 2017 Clover Network, Inc. All rights reserved.
//

import Foundation

class CloverDeviceFactory {
    class func get(config:CloverDeviceConfiguration) -> CloverDevice?{
        return DefaultCloverDevice(config: config);
    }
}
