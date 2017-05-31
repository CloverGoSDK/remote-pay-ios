//
//  CloverDeviceObserver.swift
//  CloverConnector
//
//  
//  Copyright © 2017 Clover Network, Inc. All rights reserved.
//

import Foundation
//import CloverSDK


protocol CloverDeviceObserver:AnyObject {
    
    //    func onTxState(TxState txState)
    
    func onUiState(uiState:UiState, uiText:String, uiDirection:UiState.UiDirection, inputOptions:[InputOption]?)
    
    func onTipAddedResponse(tipAmount:Int)
    
    func onAuthTipAdjustedResponse(paymentId:String, amount:Int, success:Bool)
    
    func onCashbackSelectedResponse(cashbackAmount:Int)
    
    func onPartialAuthResponse(partialAuthAmount:Int)
    
    func onFinishOk(payment:CLVModels.Payments.Payment, signature:Signature?)
    
    func onFinishOk(credit:CLVModels.Payments.Credit)
    
    func onFinishOk(redund:CLVModels.Payments.Refund)
    
    func onFinishCancel()
    
    func onVerifySignature(payment:CLVModels.Payments.Payment, signature:Signature?)
    
    func onPaymentVoidedResponse(payment:CLVModels.Payments.Payment, voidReason:VoidReason)
    
    func onKeyPressed(keyPress:KeyPress)
    
    func onPaymentRefundResponse(orderId:String?, String paymentId:String?, refund:CLVModels.Payments.Refund?, code:TxState)
    
    func onVaultCardResponse( _ vaultedCard:CLVModels.Payments.VaultedCard?, code:ResultStatus?, reason:String?)
    
    func onCapturePreAuthResponse( _ status:ResultStatus, reason:String, paymentId:String?, amount:Int?, tipAmount:Int?)
    
    func onCloseoutResponse( _ status:ResultStatus, reason:String, batch:CLVModels.Payments.Batch)
    
    //func onModifyOrder(AddDiscountAction addDiscountAction)
    //func onModifyOrder(RemoveDiscountAction removeDiscountAction)
    //func onModifyOrder(AddLineItemAction addLineItemAction)
    //func onModifyOrder(RemoveLineItemAction removeLineItemAction)
    
    func onPrintRefundPayment(refund:CLVModels.Payments.Refund?, payment:CLVModels.Payments.Payment?, order:CLVModels.Order.Order?)
    func onPrintMerchantReceipt(payment:CLVModels.Payments.Payment?)
    func onPrintPaymentDecline(reason:String, payment:CLVModels.Payments.Payment?)
    func onPrintPayment(order:CLVModels.Order.Order?, payment:CLVModels.Payments.Payment?)
    func onPrintCredit(credit:CLVModels.Payments.Credit)
    func onPrintCreditDecline(reason:String, credit:CLVModels.Payments.Credit?)
    
    func onTxStartResponse(result:TxStartResponseResult, externalId:String)
    
    func onDeviceDisconnected( _ device:CloverDevice)
    func onDeviceConnected(device:CloverDevice)
    func onDeviceReady(device:CloverDevice, discoveryResponseMessage:DiscoveryResponseMessage)
    
    func onMessageAck(sourceMessageId:String)
    
    func onPendingPaymentsResponse(success:Bool, payments:[PendingPaymentEntry]?)
    
    func onReadCardResponse( _ status:ResultStatus, reason:String, cardData:CardData?)
    func onConfirmPayment(payment:CLVModels.Payments.Payment?, challenges: [Challenge]?)
}

public class DefaultCloverDeviceObserver : CloverDeviceObserver {
    func onUiState(uiState:UiState, uiText:String, uiDirection:UiState.UiDirection, inputOptions:[InputOption]?){}
    
    func onTipAddedResponse(tipAmount:Int){}
    
    func onAuthTipAdjustedResponse(paymentId:String, amount:Int, success:Bool){}
    
    func onCashbackSelectedResponse(cashbackAmount:Int){}
    
    func onPartialAuthResponse(partialAuthAmount:Int){}
    
    func onFinishOk(payment:CLVModels.Payments.Payment, signature:Signature?){}
    
    func onFinishOk(credit:CLVModels.Payments.Credit){}
    
    func onFinishOk(redund:CLVModels.Payments.Refund){}
    
    func onFinishCancel(){}
    
    func onVerifySignature(payment:CLVModels.Payments.Payment, signature:Signature?){}
    
    func onPaymentVoidedResponse(payment:CLVModels.Payments.Payment, voidReason:VoidReason){}
    
    func onKeyPressed(keyPress:KeyPress){}
    
    func onPaymentRefundResponse(orderId:String?, String paymentId:String?, refund:CLVModels.Payments.Refund?, code:TxState){}
    
    func onVaultCardResponse( _ vaultedCard:CLVModels.Payments.VaultedCard?, code:ResultStatus?, reason:String?){}
    
    func onCapturePreAuthResponse( _ status:ResultStatus, reason:String, paymentId:String?, amount:Int?, tipAmount:Int?){}
    
    func onCloseoutResponse( _ status:ResultStatus, reason:String, batch:CLVModels.Payments.Batch){}
    
    //func onModifyOrder(AddDiscountAction addDiscountAction)
    //func onModifyOrder(RemoveDiscountAction removeDiscountAction)
    //func onModifyOrder(AddLineItemAction addLineItemAction)
    //func onModifyOrder(RemoveLineItemAction removeLineItemAction)
    
    func onPrintRefundPayment(refund:CLVModels.Payments.Refund?, payment:CLVModels.Payments.Payment?, order:CLVModels.Order.Order?){}
    func onPrintMerchantReceipt(payment:CLVModels.Payments.Payment?){}
    func onPrintPaymentDecline(reason:String, payment:CLVModels.Payments.Payment?){}
    func onPrintPayment(order:CLVModels.Order.Order?, payment:CLVModels.Payments.Payment?){}
    func onPrintCredit(credit:CLVModels.Payments.Credit){}
    func onPrintCreditDecline(reason:String, credit:CLVModels.Payments.Credit?){}
    
    func onTxStartResponse(result:TxStartResponseResult, externalId:String){}
    
    func onDeviceDisconnected( _ device:CloverDevice){}
    func onDeviceConnected(device:CloverDevice){}
    func onDeviceReady(device:CloverDevice, discoveryResponseMessage:DiscoveryResponseMessage){}
    
    func onMessageAck(sourceMessageId:String){}
    
    func onPendingPaymentsResponse(success:Bool, payments:[PendingPaymentEntry]?){}
    
    func onReadCardResponse( _ status:ResultStatus, reason:String, cardData:CardData?){}
    func onConfirmPayment(payment:CLVModels.Payments.Payment?, challenges: [Challenge]?){}
    
}
