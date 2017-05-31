//
//  EnumerationUtil.swift
//  CloverGoConnector
//
//  Created by Veeramani, Rajan (Non-Employee) on 4/25/17.
//  Copyright © 2017 Veeramani, Rajan (Non-Employee). All rights reserved.
//

import Foundation

class EnumerationUtil {
    
    class func CardTransactionType_toEnum(type:String) -> CLVModels.Payments.CardTransactionType? {
        switch type {
        case "AUTH":
            return .AUTH
        case "PREAUTH":
            return .PREAUTH
        case "PREAUTHCAPTURE":
            return .PREAUTHCAPTURE
        case "ADJUST":
            return .ADJUST
        case "VOID":
            return .VOID
        case "VOIDRETURN":
            return .VOIDRETURN
        case "RETURN":
            return .RETURN
        case "REFUND":
            return .REFUND
        case "NAKEDREFUND":
            return .NAKEDREFUND
        case "GETBALANCE":
            return .GETBALANCE
        case "BATCHCLOSE":
            return .BATCHCLOSE
        case "ACTIVATE":
            return .ACTIVATE
        case "BALANCE_LOCK":
            return .BALANCE_LOCK
        case "LOAD":
            return .LOAD
        case "CASHOUT":
            return .CASHOUT
        case "CASHOUT_ACTIVE_STATUS":
            return .CASHOUT_ACTIVE_STATUS
        case "REDEMPTION":
            return .REDEMPTION
        case "REDEMPTION_UNLOCK":
            return .REDEMPTION_UNLOCK
        case "RELOAD":
            return .RELOAD
        default:
            return nil
        }
    }
    
    class func CardType_toEnum(type:String) -> CLVModels.Payments.CardType {
        switch type {
        case "VISA":
            return .VISA
        case "MC":
            return .MC
        case "AMEX":
            return .AMEX
        case "DISCOVER":
            return .DISCOVER
        case "DINERS_CLUB":
            return .DINERS_CLUB
        case "JCB":
            return .JCB
        case "MAESTRO":
            return .MAESTRO
        case "SOLO":
            return .SOLO
        case "LASER":
            return .LASER
        case "CHINA_UNION_PAY":
            return .CHINA_UNION_PAY
        case "CARTE_BLANCHE":
            return .CARTE_BLANCHE
        case "GIFT_CARD":
            return .GIFT_CARD
        case "EBT":
            return .EBT
        default:
            return .UNKNOWN
        }
    }
    
    class func CardEntryType_toEnum(type:String) -> CLVModels.Payments.CardEntryType? {
        switch type {
        case "SWIPED":
            return .SWIPED
        case "KEYED":
            return .KEYED
        case "VOICE":
            return .VOICE
        case "VAULTED":
            return .VAULTED
        case "OFFLINE_SWIPED":
            return .OFFLINE_SWIPED
        case "OFFLINE_KEYED":
            return .OFFLINE_KEYED
        case "EMV_CONTACT":
            return .EMV_CONTACT
        case "EMV_CONTACTLESS":
            return .EMV_CONTACTLESS
        case "MSD_CONTACTLESS":
            return .MSD_CONTACTLESS
        case "PINPAD_MANUAL_ENTRY":
            return .PINPAD_MANUAL_ENTRY
        default:
            return nil
        }
    }
    
    class func CvmResult_toEnum(type:String) -> CLVModels.Payments.CvmResult? {
        switch type {
        case "NO_CVM_REQUIRED":
            return .NO_CVM_REQUIRED
        case "SIGNATURE":
            return .SIGNATURE
        case "PIN":
            return .PIN
        case "ONLINE_PIN":
            return .ONLINE_PIN
        case "SIGNATURE_AND_PIN":
            return .SIGNATURE_AND_PIN
        case "CVM_FAILED":
            return .CVM_FAILED
        case "DEVICE":
            return .DEVICE
        default:
            return nil
        }
    }
    
    class func VoidReason_toString(type:VoidReason) -> String? {
        switch type {
        case .AUTH_CLOSED_NEW_CARD:
            return "AUTH_CLOSED_NEW_CARD"
        case .DEVELOPER_PAY_PARTIAL_AUTH:
            return "DEVELOPER_PAY_PARTIAL_AUTH"
        case .FAILED:
            return "FAILED"
        case .NOT_APPROVED:
            return "NOT_APPROVED"
        case .REJECT_DUPLICATE:
            return "REJECT_DUPLICATE"
        case .REJECT_PARTIAL_AUTH:
            return "REJECT_PARTIAL_AUTH"
        case .REJECT_SIGNATURE:
            return "REJECT_SIGNATURE"
        case .TRANSPORT_ERROR:
            return "TRANSPORT_ERROR"
        case .USER_CANCEL:
            return "USER_CANCEL"
        default:
            return nil
        }
    }
    
}
