/**
 * Autogenerated by Avro
 * 
 * DO NOT EDIT DIRECTLY
 */

import Foundation
import ObjectMapper




/*
The base class for messages being sent to a clover device
 */
public class RemoteMessage:Mappable {

  /*
  * Identifier for the request
   */
  var requestId:String? = nil 
  /*
  * Message package name
   */
  public var packageName:String? = nil
  /*
  * string representation of the message being wrapped by this RemoteMessage
   */
  public var id:String? = nil
  public var payload:String? = nil
  public var type:RemoteMessageType? = nil
  public var method:Method? = nil
  public var version:Int = 1
  public var remoteSourceSDK = ""
  public var remoteApplicationID = ""

  public required init() {

  }

  required public init?(map: Map) {
    payload = map["payload"].currentValue as? String
    method = map["method"].currentValue as? Method
  }

  public func mapping(map:Map) {
    /*
    let transform = TransformOf<Mappable, String>(fromJSON: { (value: String?) -> Mappable? in
        // transform value from String? to Int?
        if let pi = Mapper<Mappable>().map(value!) {
            return pi
        }
        return nil
        }, toJSON: { (value: Mappable?) -> String? in
            // transform value from Int? to String?
            if let value = Mapper().toJSONString(value!, prettyPrint:true) {
                return String(value)
            }
            return nil
    })*/
  remoteSourceSDK <- map["remoteSourceSDK"]

  remoteApplicationID <- map["remoteApplicationID"]

  version <- map["version"]
    
  method <- (map["method"], Message.methodTransform)
    
  requestId <- map["requestId"]

  packageName <- map["packageName"]

  payload <- map["payload"]

  type <- map["type"]

    id <- map["id"]
  }

/*
  public required init(jsonObj:NSDictionary){
    super.init()

  requestId = jsonObj.valueForKey("requestId") as! String?

  packageName = jsonObj.valueForKey("packageName") as! String?

  payload = jsonObj.valueForKey("payload") as! String?

  type = RemoteMessageType(rawValue: jsonObj.valueForKey("type") as! String)
  }
*/

}

