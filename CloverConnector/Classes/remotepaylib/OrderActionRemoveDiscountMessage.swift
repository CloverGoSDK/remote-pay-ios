//
//  OrderActionRemoveDiscountMessage.swift
//  CloverSDKRemotepay
//
//  
//  Copyright © 2017 Clover Network, Inc. All rights reserved.
//

import Foundation
import ObjectMapper

public class OrderActionRemoveDiscountMessage : Message {
    public var removeDiscountAction:RemoveDiscountAction?
    
    public required init?(_ map:Map) {
        super.init(method: .ORDER_ACTION_REMOVE_DISCOUNT)
    }
    
    public override func mapping(map:Map) {
        super.mapping(map)
        removeDiscountAction <- map["removeDiscountAction"]
    }
}
