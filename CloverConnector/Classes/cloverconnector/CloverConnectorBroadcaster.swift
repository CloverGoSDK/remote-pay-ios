//
//  CloverConnectorBroadcaster.swift
//  CloverConnector
//
//  
//  Copyright © 2017 Clover Network, Inc. All rights reserved.
//

import Foundation
//import CloverSDKRemotepay


public class CloverConnectorBroadcaster {
    var listeners = NSMutableArray()
    
    public func addObject(listener:ICloverConnectorListener) {
        if listeners.indexOfObject(listener) != -1 {
            listeners.addObject(listener)
        }
    }
    
    public func removeObject(listener:ICloverConnectorListener) {
        listeners.removeObject(listener)
    }
    
    public func notifyOnTipAdded(tip:Int) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                //listener.onTipAdded(TipAddedMessage(tip))
            }
        }
    }
    
    
    
    public func notifyOnPaymentRefundResponse(refundPaymentResponse:RefundPaymentResponse) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onRefundPaymentResponse(refundPaymentResponse)
            }
        }
    }
    
    public func notifyOnCloseoutResponse(closeoutResponse:CloseoutResponse) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onCloseoutResponse(closeoutResponse)
            }
        }
    }
    
    public func notifyOnDeviceActivityStart(deviceEvent:CloverDeviceEvent) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onDeviceActivityStart(deviceEvent)
            }
        }
    }
    
    public func notifyOnDeviceActivityEnd(deviceEvent:CloverDeviceEvent) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onDeviceActivityEnd(deviceEvent)
            }
        }
        
    }
    
    public func notifyOnDeviceError(deviceError:CloverDeviceErrorEvent) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onDeviceError(deviceError);
            }
        }
    }
    
    public func notifyOnSaleResponse(response:SaleResponse) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener
            {
                listener.onSaleResponse(response)
            }
        }
    }
    
    public func notifyOnAuthResponse(response:AuthResponse) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onAuthResponse(response)
            }
        }
    }
    
    public func notifyOnManualRefundResponse(response:ManualRefundResponse) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onManualRefundResponse(response)
            }
        }
    }
    
    public func notifyOnVerifySignatureRequest(request:VerifySignatureRequest) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onVerifySignatureRequest(request)
            }
        }
    }
    
    public func notifyOnConfirmPayment(request:ConfirmPaymentRequest) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onConfirmPaymentRequest(request)
            }
        }
    }
    
    public func notifyOnVoidPaymentResponse(response:VoidPaymentResponse) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onVoidPaymentResponse(response)
            }
        }
    }
    
    public func notifyOnConnect() {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onDeviceConnected()
            }
        }
    }
    
    public func notifyOnDisconnect() {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onDeviceDisconnected()
            }
        }
    }
    
    public func notifyOnReady(merchantInfo:MerchantInfo) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onDeviceReady(merchantInfo)
            }
        }
    }
    
    public func notifyOnTipAdjustAuthResponse(response:TipAdjustAuthResponse) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onTipAdjustAuthResponse(response);
            }
        }
    }
    
//    public func notifyOnTxState(txState:TxState) {
    public func notifyOnTxState(txState:Any) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
//                listener.onTransactionState(txState)
            }
        }
    }
    
    public func notifyOnVaultCardRespose(ccr:VaultCardResponse) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onVaultCardResponse(ccr)
            }
        }
    }
    
    public func notifyOnPreAuthResponse(response:PreAuthResponse) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onPreAuthResponse(response)
            }
        }
    }
    

    
//    public func notifyOnCapturePreAuth(response:CaptureAuthResponse) {
    public func notifyOnCapturePreAuth(response:CapturePreAuthResponse) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onCapturePreAuthResponse(response)

            }
        }
    }
    
    public func notifyOnPendingPaymentsResponse(response:RetrievePendingPaymentsResponse) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onRetrievePendingPaymentsResponse(response)
                
            }
        }
    }
    
    public func notifyPrintCredit(response:PrintManualRefundReceiptMessage) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onPrintManualRefundReceipt(response)
            }
        }
    }
    
    public func notifyPrintCreditDecline(response:PrintManualRefundDeclineReceiptMessage) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onPrintManualRefundDeclineReceipt(response)
            }
        }
    }
    
    
    public func notifyOnPrintMerchantReceipt(response: PrintPaymentMerchantCopyReceiptMessage) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onPrintPaymentMerchantCopyReceipt(response)
            }
        }
    }
    
    public func notifyOnPrintPaymentReceipt(response: PrintPaymentReceiptMessage) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onPrintPaymentReceipt(response)
            }
        }
    }
    
    public func notifyOnPrintPaymentDeclineReceipt(response: PrintPaymentDeclineReceiptMessage) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onPrintPaymentDeclineReceipt(response)
            }
        }
    }
    
    public func notifyOnPrintPaymentRefund(response: PrintRefundPaymentReceiptMessage) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onPrintRefundPaymentReceipt(response)
            }
        }
    }
    
    public func notifyOnReadCardResponse(response: ReadCardDataResponse) {
        for listener in listeners {
            if let listener = listener as? ICloverConnectorListener {
                listener.onReadCardDataResponse(response)
            }
        }
    }
}
