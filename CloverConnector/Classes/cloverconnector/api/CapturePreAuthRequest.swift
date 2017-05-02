/**
 * Autogenerated by Avro
 *
 * DO NOT EDIT DIRECTLY
 */

import ObjectMapper

@objc
public class CapturePreAuthRequest : NSObject, Mappable {

  /*
  * Total amount paid
   */
  public var amount:Int
  /*
  * Amount paid in tips
   */
  public var tipAmount:Int? = nil
  /*
  * Unique identifier
   */
  public var paymentId:String

    public required init(amount:Int, paymentId:String) {
        self.amount = amount
        self.paymentId = paymentId

  }

    public required init?(_ map: Map) {
        amount = 0
        paymentId = ""
        super.init()
    }

    public func mapping(map: Map) {
        amount <- map["amount"]
        tipAmount <- map["tipAmount"]
        paymentId <- map["paymentId"]
    }

}