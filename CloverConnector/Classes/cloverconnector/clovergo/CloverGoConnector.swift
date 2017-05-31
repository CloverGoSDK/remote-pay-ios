//
//  CloverGoConnector.swift
//  CloverGoConnector
//
//  Created by Veeramani, Rajan (Non-Employee) on 4/17/17.
//  Copyright © 2017 Veeramani, Rajan (Non-Employee). All rights reserved.
//

import Foundation
import clovergoclient

public class CloverGoConnector : NSObject, ICloverGoConnector, CardReaderDelegate {
    
    var config:CloverGoDeviceConfiguration
    
    let cloverGo = CloverGo.sharedInstance
    
    weak var connectorListener :ICloverGoConnectorListener?
    
    var authTransactionDelegate :TransactionDelegate?
    var preAuthTransactionDelegate :TransactionDelegate?
    var saleTransactionDelegate :TransactionDelegate?
    
    var merchantInfo:MerchantInfo?
    
    var deviceReady = false
    
    var lastTransactionRequest : TransactionRequest?
    
    var lastChallengeType : ChallengeType?
    
    public init(config:CloverGoDeviceConfiguration) {
        
        self.config = config
        
        var env : Env
        switch config.env {
        case .demo:
            env = Env.demo
        case .live:
            env = Env.live
        case .test:
            env = Env.test
        }
        cloverGo.initializeWithAccessToken(config.accessToken, apiKey: config.apiKey, secret: config.secret, env: env)
        cloverGo.allowAutoConnect = config.allowAutoConnect
        cloverGo.overrideDuplicateTransaction = config.allowDuplicateTransaction

    }
    
    public func initializeConnection() {
        let readerInfo = ReaderInfo(readerType: config.deviceType, serialNumber: nil)
        cloverGo.useReader(readerInfo, delegate: self)
    }
    
    public func scanForBluetoothReaders() {
        cloverGo.scanForBluetoothReaders()
    }
    
    public func connectToBluetoothReader(readerInfo:ReaderInfo) {
        cloverGo.connectToBTReader(readerInfo)
    }
    
    public func disconnectReader() {
        let readerInfo = ReaderInfo(readerType: config.deviceType, serialNumber: nil)
        cloverGo.releaseReader(readerInfo)
    }
    
    public func resetDevice() {
        cloverGo.resetReader(ReaderInfo(readerType: config.deviceType, serialNumber: nil))
    }
    
    public func cancel() {
        cloverGo.cancelCardReaderTransaction(ReaderInfo(readerType: config.deviceType, serialNumber: nil))
    }
    
    public func addCloverConnectorListener(_ cloverConnectorListener:ICloverConnectorListener) -> Void {
        //Not to be implemented
    }
    
    public func removeCloverConnectorListener(_ cloverConnectorListener:ICloverConnectorListener) -> Void {
        //Not to be implemented
    }
    
    public func addCloverGoConnectorListener(cloverConnectorListener: ICloverGoConnectorListener) {
        connectorListener = cloverConnectorListener
    }
    
    public func sale(saleRequest: SaleRequest) {
        if deviceReady {
            if merchantInfo?.supportsSales != nil && !(merchantInfo?.supportsSales)! {
                
                connectorListener?.onSaleResponse(SaleResponse(success: false, result: ResultCode.UNSUPPORTED))
                
            } else {
                let order = Order()
                order.addCustomItem(CustomItem(name: "Item 1", price: saleRequest.amount, quantity: 1))
                order.tax = saleRequest.taxAmount ?? 0
                order.tip = saleRequest.tipAmount ?? 0
                order.transactionType = .purchase
                order.externalPaymentId = saleRequest.externalId
                saleTransactionDelegate = TransactionDelegateImpl(config: self.config, connectorListener: self.connectorListener, transactionType: .purchase)
                
                lastTransactionRequest = saleRequest
                
                cloverGo.doCardReaderTransaction(ReaderInfo(readerType: config.deviceType, serialNumber: nil), order: order, delegate: saleTransactionDelegate!)
            }
        } else {
            let errResponse = SaleResponse(success: false, result: ResultCode.ERROR)
            errResponse.message = "Device Not Ready"
            connectorListener?.onSaleResponse(errResponse)
        }
    }
    

    public func auth(authRequest: AuthRequest) {
        if deviceReady {
            if merchantInfo?.supportsAuths != nil && !(merchantInfo?.supportsAuths)! {
                
                connectorListener?.onAuthResponse(AuthResponse(success: false, result: ResultCode.UNSUPPORTED))
                
            } else {
            
                let order = Order()
                order.addCustomItem(CustomItem(name: "Item 1", price: authRequest.amount, quantity: 1))
                order.tax = authRequest.taxAmount ?? -1
                order.tip = -1
                order.transactionType = .auth
                order.externalPaymentId = authRequest.externalId
                authTransactionDelegate = TransactionDelegateImpl(config: self.config, connectorListener: self.connectorListener, transactionType: .auth)
                
                lastTransactionRequest = authRequest
                
                cloverGo.doCardReaderTransaction(ReaderInfo(readerType: config.deviceType, serialNumber: nil), order: order, delegate: authTransactionDelegate!)
            }
        } else {
            let errResponse = AuthResponse(success: false, result: ResultCode.ERROR)
            errResponse.message = "Device Not Ready"
            connectorListener?.onAuthResponse(errResponse)
        }
    }
    
    public func preAuth(preAuthRequest: PreAuthRequest) {
        if deviceReady {
            if merchantInfo?.supportsPreAuths != nil && !(merchantInfo?.supportsPreAuths)! {
                
                connectorListener?.onPreAuthResponse(PreAuthResponse(success: false, result: ResultCode.UNSUPPORTED))
                
            } else {
                let order = Order()
                order.addCustomItem(CustomItem(name: "Item 1", price: preAuthRequest.amount, quantity: 1))
                order.tip = -1
                order.transactionType = .preauth
                order.externalPaymentId = preAuthRequest.externalId
                preAuthTransactionDelegate = TransactionDelegateImpl(config: self.config, connectorListener: self.connectorListener, transactionType: .preauth)
                
                lastTransactionRequest = preAuthRequest
                
                cloverGo.doCardReaderTransaction(ReaderInfo(readerType: config.deviceType, serialNumber: nil), order: order, delegate: preAuthTransactionDelegate!)
            }
        } else {
            let errResponse = PreAuthResponse(success: false, result: ResultCode.ERROR)
            errResponse.message = "Device Not Ready"
            connectorListener?.onPreAuthResponse(errResponse)
        }
    }
    
    public func tipAdjustAuth(authTipAdjustRequest: TipAdjustAuthRequest) {
        
        if merchantInfo?.supportsTipAdjust != nil && !(merchantInfo?.supportsTipAdjust)! {
            
            connectorListener?.onTipAdjustAuthResponse(TipAdjustAuthResponse(success: false, result: ResultCode.UNSUPPORTED,paymentId: authTipAdjustRequest.paymentId, tipAmount: authTipAdjustRequest.tipAmount))
            
        } else {
            cloverGo.doAddTipTransaction(authTipAdjustRequest.paymentId, amount: authTipAdjustRequest.tipAmount, success: { (result) in
                self.connectorListener?.onTipAdjustAuthResponse(TipAdjustAuthResponse(success: true, result: ResultCode.SUCCESS,paymentId: authTipAdjustRequest.paymentId, tipAmount: authTipAdjustRequest.tipAmount))
            }) { (error) in
                let tipAdjustResponse = TipAdjustAuthResponse(success: false, result: ResultCode.FAIL,paymentId: authTipAdjustRequest.paymentId, tipAmount: authTipAdjustRequest.tipAmount)
                tipAdjustResponse.reason = error.code
                tipAdjustResponse.message = error.message
                self.connectorListener?.onTipAdjustAuthResponse(tipAdjustResponse)
            }
        }
    }


    public func capturePreAuth(capturePreAuthRequest: CapturePreAuthRequest) {
        cloverGo.doCapturePreAuthTransaction(capturePreAuthRequest.paymentId, amount: capturePreAuthRequest.amount, tipAmount: capturePreAuthRequest.tipAmount, success: { (result) in
            self.connectorListener?.onCapturePreAuthResponse(CapturePreAuthResponse(success: true, result: ResultCode.SUCCESS, paymentId: capturePreAuthRequest.paymentId, amount: capturePreAuthRequest.amount, tipAmount: capturePreAuthRequest.tipAmount))
        }) { (error) in
            let capturePreAuthResponse = CapturePreAuthResponse(success: false, result: ResultCode.FAIL, paymentId: capturePreAuthRequest.paymentId, amount: capturePreAuthRequest.amount, tipAmount: capturePreAuthRequest.tipAmount)
            capturePreAuthResponse.reason = error.code
            capturePreAuthResponse.message = error.message
            self.connectorListener?.onCapturePreAuthResponse(capturePreAuthResponse)
        }
    }
    
    public func voidPayment(voidPaymentRequest: VoidPaymentRequest) {
        if merchantInfo?.supportsTipAdjust != nil && !(merchantInfo?.supportsTipAdjust)! {
            connectorListener?.onVoidPaymentResponse(VoidPaymentResponse(success: false, result: ResultCode.UNSUPPORTED, paymentId: voidPaymentRequest.paymentId, transactionNumber: nil))
        } else {
            guard voidPaymentRequest.paymentId != nil && voidPaymentRequest.orderId != nil else {
                let voidErrorResponse = VoidPaymentResponse(success: false, result: ResultCode.FAIL, paymentId: voidPaymentRequest.paymentId, transactionNumber: nil)
                voidErrorResponse.reason = "invalid_request"
                voidErrorResponse.message = "Order Id and Payment Id in the request cannot be nil"
                connectorListener?.onVoidPaymentResponse(voidErrorResponse)
                return
            }
            var response : VoidPaymentResponse
            cloverGo.doVoidTransaction(voidPaymentRequest.paymentId!, orderId: voidPaymentRequest.orderId!, voidReason: EnumerationUtil.VoidReason_toString(voidPaymentRequest.voidReason),success: { (result) in
                self.connectorListener?.onVoidPaymentResponse(VoidPaymentResponse(success: true, result: ResultCode.SUCCESS, paymentId: voidPaymentRequest.paymentId, transactionNumber: nil))
            }) { (error) in
                let voidResponse = VoidPaymentResponse(success: false, result: ResultCode.FAIL, paymentId: voidPaymentRequest.paymentId, transactionNumber: nil)
                voidResponse.reason = error.code
                voidResponse.message = error.message
                self.connectorListener?.onVoidPaymentResponse(voidResponse)
            }
        }
        
    }
    
    public func refundPayment(refundPaymentRequest: RefundPaymentRequest) {
        cloverGo.doRefundTransaction(refundPaymentRequest.paymentId, amount: refundPaymentRequest.amount, success: { (response) in
            var refund = CLVModels.Payments.Refund()
            refund.id = response.id
            refund.amount = response.amount
            refund.payment = CLVModels.Payments.Payment()
            refund.payment?.id = response.paymentId
            self.connectorListener?.onRefundPaymentResponse(RefundPaymentResponse(success: true, result: ResultCode.SUCCESS, orderId: refundPaymentRequest.orderId, paymentId: refundPaymentRequest.paymentId, refund: refund))
        }) { (error) in
            let refundResponse = RefundPaymentResponse(success: false, result: ResultCode.FAIL)
            refundResponse.reason = error.code
            refundResponse.message = error.message
            self.connectorListener?.onRefundPaymentResponse(refundResponse)
        }
    }
    
    public func closeout(closeoutRequest: CloseoutRequest) {
        cloverGo.doCloseOutTransaction({ (status) in
            self.connectorListener?.onCloseoutResponse(CloseoutResponse(batch: nil, success: true, result: ResultCode.SUCCESS))
        }) { (error) in
            let closeOutResponse = CloseoutResponse(batch: nil, success: false, result: ResultCode.FAIL)
            closeOutResponse.reason = error.code
            closeOutResponse.message = error.message
            self.connectorListener?.onCloseoutResponse(closeOutResponse)
        }
    }
    
    public func onCardReaderDiscovered(readers: [ReaderInfo]) {
        connectorListener?.onDevicesDiscovered(readers)
    }
    
    public func onConnected(cardReaderInfo: ReaderInfo) {
        connectorListener?.onDeviceConnected()
    }
    
    public func onDisconnected(cardReaderInfo: ReaderInfo) {
        connectorListener?.onDeviceDisconnected()
    }
    
    public func onError(event: CardReaderErrorEvent) {
        print("Error Occured while connecting to Reader")
        connectorListener?.onDeviceError(CloverDeviceErrorEvent(errorType: .EXCEPTION, code: 500, message: event.toString()))
    }
    
    public func onReaderResetProgress(event: CardReaderEvent) {
        print("Reader reset is in progress - \(event.toString())")
    }
    
    public func onReady(cardReaderInfo: ReaderInfo) {
        print("Reader is Ready!")
        deviceReady = true
        cloverGo.getMerchantInfo({ (merchant) in
            let merchantInfo = MerchantInfo(id: merchant.id, mid: nil, name: merchant.name, deviceName: cardReaderInfo.bluetoothName, deviceSerialNumber: cardReaderInfo.serialNumber, deviceModel: cardReaderInfo.readerType.toString())
            merchantInfo.supportsAuths = merchant.properties?[MerchantPropertyType.supportsAuths.toString()] ?? false
            merchantInfo.supportsVaultCards = merchant.properties?[MerchantPropertyType.supportsVaultCards.toString()] ?? false
            merchantInfo.supportsManualRefunds = merchant.properties?[MerchantPropertyType.supportsManualRefunds.toString()] ?? false
            merchantInfo.supportsTipAdjust = merchant.properties?[MerchantPropertyType.supportsTipAdjust.toString()] ?? false
            merchantInfo.supportsPreAuths = merchant.properties?[MerchantPropertyType.supportsPreAuths.toString()] ?? false
            merchantInfo.supportsVoids = merchant.properties?[MerchantPropertyType.supportsVoids.toString()] ?? false
            merchantInfo.supportsSales = merchant.properties?[MerchantPropertyType.supportsSales.toString()] ?? false
            self.connectorListener?.onDeviceReady(merchantInfo)
        }) { (error) in
            //Not expecting an error for now
        }
    }
    
    /*
     * Request receipt options be displayed for a payment.
     */
    public func displayPaymentReceiptOptions( _ orderId:String, paymentId: String) -> Void {
        debugPrint("Not supported with CloverGo Connector")
    }
    
    
    /*
     * Accept a signature verification request.
     */
    public func  acceptSignature ( _ signatureVerifyRequest:VerifySignatureRequest ) -> Void {
        debugPrint("Not supported with CloverGo Connector")
    }
    
    
    /*
     * Reject a signature verification request.
     */
    public func  rejectSignature ( _ signatureVerifyRequest:VerifySignatureRequest ) -> Void {
        debugPrint("Not supported with CloverGo Connector")
    }
    
    
    /*
     * Request to vault a card.
     */
    public func  vaultCard ( _ vaultCardRequest:VaultCardRequest ) -> Void {
        debugPrint("Not supported with CloverGo Connector")
        connectorListener?.onVaultCardResponse(VaultCardResponse(success: false, result: ResultCode.UNSUPPORTED))
    }
    
    
    /*
     * Request to print some text on the default printer.
     */
    public func  printText ( _ lines:[String] ) -> Void {
        debugPrint("Not supported with CloverGo Connector")
    }
    
    public func printImageFromURL(_ url:String) -> Void {
        debugPrint("Not supported with CloverGo Connector")
    }
    
    
    /*
     * Request that the cash drawer connected to the device be opened.
     */
    public func  openCashDrawer (_ reason: String) -> Void {
        debugPrint("Not supported with CloverGo Connector")
    }
    
    
    /*
     * Request to place a message on the device screen.
     */
    public func  showMessage ( _ message:String ) -> Void {
        debugPrint("Not supported with CloverGo Connector")
    }
    
    
    /*
     * Request to display the default welcome screen on the device.
     */
    public func  showWelcomeScreen () -> Void {
        debugPrint("Not supported with CloverGo Connector")
    }
    
    
    /*
     * Request to display the default thank you screen on the device.
     */
    public func  showThankYouScreen () -> Void {
        debugPrint("Not supported with CloverGo Connector")
    }
    
    
    /*
     * Request to display an order on the device.
     */
    public func  showDisplayOrder ( _ order:DisplayOrder ) -> Void {
        debugPrint("Not supported with CloverGo Connector")
    }
    
    
    /*
     * Request to display an order on the device.
     */
    public func  removeDisplayOrder ( _ order:DisplayOrder ) -> Void {
        debugPrint("Not supported with CloverGo Connector")
    }
    
    public func invokeInputOption( _ inputOption:InputOption ) -> Void {
        debugPrint("Not supported with CloverGo Connector")
    }
    
    public func readCardData( _ request:ReadCardDataRequest ) -> Void {
        debugPrint("Not supported with CloverGo Connector")
        connectorListener?.onReadCardDataResponse(ReadCardDataResponse(success: false, result: ResultCode.UNSUPPORTED))
    }
    
    public func acceptPayment( _ payment:CLVModels.Payments.Payment ) -> Void {
        if lastChallengeType == ChallengeType.DUPLICATE_CHALLENGE {
            cloverGo.overrideDuplicateTransaction = true
            if let saleRequest = lastTransactionRequest as? SaleRequest {
                self.sale(saleRequest)
            } else if let authRequest = lastTransactionRequest as? AuthRequest {
                self.auth(authRequest)
            } else if let preAuthRequest = lastTransactionRequest as? PreAuthRequest {
                self.preAuth(preAuthRequest)
            }
        }
    }
    
    public func rejectPayment( _ payment:CLVModels.Payments.Payment, challenge:Challenge ) -> Void {
        //Dont have to do anything for rejecting a payment, since for duplicate transaction the payment was not processed
    }
    
    public func retrievePendingPayments() -> Void {
        debugPrint("Not supported with CloverGo Connector")
        let response = RetrievePendingPaymentsResponse(code: .UNSUPPORTED, message: "Not Supported", payments: nil)
        response.success = false
        connectorListener?.onRetrievePendingPaymentsResponse(response)
    }
    
    public func dispose() -> Void {
        debugPrint("Not supported with CloverGo Connector")
    }
    
    /*
     * Request an amount be refunded.
     */
    public func  manualRefund ( _ manualRefundRequest:ManualRefundRequest ) -> Void{
        debugPrint("Not supported with CloverGo Connector")
        connectorListener?.onManualRefundResponse(ManualRefundResponse(success: false, result: ResultCode.UNSUPPORTED))
    }
    
}

class TransactionDelegateImpl : NSObject, TransactionDelegate {
    
    weak var connectorListener : ICloverGoConnectorListener?
    
    let transactionType : CLVGoTransactionType
    
    let deviceConfig : CloverGoDeviceConfiguration
    
    init(config:CloverGoDeviceConfiguration, connectorListener: ICloverGoConnectorListener?, transactionType:CLVGoTransactionType) {
        self.connectorListener = connectorListener
        self.transactionType = transactionType
        self.deviceConfig = config
    }
    
    func onProgress(event: CardReaderEvent) {
        self.connectorListener?.onTransactionProgress(event)
    }
    
    func onError(error: CloverGoError) {
        if transactionType == CLVGoTransactionType.purchase {
            let saleResponse = SaleResponse(success: false, result: ResultCode.FAIL)
            saleResponse.reason = error.code
            saleResponse.message = error.message
            connectorListener?.onSaleResponse(saleResponse)
        } else if transactionType == CLVGoTransactionType.auth {
            let authResponse = AuthResponse(success: false, result: ResultCode.FAIL)
            authResponse.reason = error.code
            authResponse.message = error.message
            connectorListener?.onAuthResponse(authResponse)
        } else if transactionType == CLVGoTransactionType.preauth {
            let preAuthResponse = PreAuthResponse(success: false, result: ResultCode.FAIL)
            preAuthResponse.reason = error.code
            preAuthResponse.message = error.message
            connectorListener?.onPreAuthResponse(preAuthResponse)
        }
    }
    
    func onTransactionResponse(transactionResponse: TransactionResult) {
        
        if !self.deviceConfig.allowDuplicateTransaction {
            CloverGo.sharedInstance.overrideDuplicateTransaction = false
        }
        
        let payment = CLVModels.Payments.Payment()
        payment.id = transactionResponse.transactionId
        payment.amount = transactionResponse.amountCharged
        payment.taxAmount = transactionResponse.taxAmount
        payment.tipAmount = transactionResponse.tipAmount
        payment.externalPaymentId = transactionResponse.externalPaymentId
    
        payment.order = CLVModels.Base.Reference()
        payment.order?.id = transactionResponse.orderId
        
        payment.cardTransaction = CLVModels.Payments.CardTransaction()
        payment.cardTransaction?.authCode = transactionResponse.authCode
        payment.cardTransaction?.type_ = EnumerationUtil.CardTransactionType_toEnum(transactionResponse.transactionType ?? "")
        payment.cardTransaction?.cardType = EnumerationUtil.CardType_toEnum(transactionResponse.cardType ?? "")
        payment.cardTransaction?.entryType = EnumerationUtil.CardEntryType_toEnum(transactionResponse.mode ?? "")
        if transactionResponse.maskedCardNo != nil {
            payment.cardTransaction?.first6 = transactionResponse.maskedCardNo?.substringToIndex(transactionResponse.maskedCardNo!.startIndex.advancedBy(6))
            payment.cardTransaction?.last4 = transactionResponse.maskedCardNo?.substringFromIndex(transactionResponse.maskedCardNo!.endIndex.advancedBy(-4))
        }
        payment.cardTransaction?.cardholderName = transactionResponse.cardHolderName
//        payment.cardTransaction?.cvmResult = EnumerationUtil.CvmResult_toEnum(transactionResponse.cvmResult ?? "")
        
        if transactionType == CLVGoTransactionType.purchase {
            let response = SaleResponse(success: true, result: ResultCode.SUCCESS)
            response.payment = payment
            connectorListener?.onSaleResponse(response)
        } else if transactionType == CLVGoTransactionType.auth {
            let response = AuthResponse(success: true, result: ResultCode.SUCCESS)
            payment.result = CLVModels.Payments.Result.AUTH
            response.payment = payment
            connectorListener?.onAuthResponse(response)
        } else if transactionType == CLVGoTransactionType.preauth {
            let response = PreAuthResponse(success: true, result: ResultCode.SUCCESS)
            response.payment = payment
            connectorListener?.onPreAuthResponse(response)
        }
        
    }
    
    func proceedOnError(event: TransactionEvent, proceedOnErrorDelegate: ProceedOnError) {
//        connectorListener?.proceedOnError(event, proceedOnErrorDelegate: proceedOnErrorDelegate)
        
        var challenges : [Challenge] = []
        switch event {
        case .duplicate_transaction:
            let challenge = Challenge()
            challenge.message = "Duplicate Transaction"
            challenge.type = ChallengeType.DUPLICATE_CHALLENGE
            challenges.append(challenge)
        default:()
        }
        let confirmPaymentRequest = ConfirmPaymentRequest()
        confirmPaymentRequest.challenges = challenges
        
        let payment = CLVModels.Payments.Payment()
        payment.id = "Pending"
        
        confirmPaymentRequest.payment = payment
        connectorListener?.onConfirmPaymentRequest(confirmPaymentRequest)
        
    }
    
    func onAidMatch(cardApplicationIdentifiers: [CardApplicationIdentifier], delegate: AidSelection) {
        connectorListener?.onAidMatch(cardApplicationIdentifiers, delegate: delegate)
    }
    
}
