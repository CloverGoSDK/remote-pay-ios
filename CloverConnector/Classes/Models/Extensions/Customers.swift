
/**
 * Autogenerated by Avro
 *
 * DO NOT EDIT DIRECTLY
 */

import ObjectMapper

extension CLVModels {
  public class Customers {
    
    
    public class Address: NSObject, NSCoding, Mappable {
      public var id: String?
      public var address1: String?
      public var address2: String?
      public var address3: String?
      public var city: String?
      public var country: String?
      public var state: String?
      public var zip: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(address1, forKey: "address1")
        aCoder.encodeObject(address2, forKey: "address2")
        aCoder.encodeObject(address3, forKey: "address3")
        aCoder.encodeObject(city, forKey: "city")
        aCoder.encodeObject(country, forKey: "country")
        aCoder.encodeObject(state, forKey: "state")
        aCoder.encodeObject(zip, forKey: "zip")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        address1 = aDecoder.decodeObjectForKey("address1") as? String
        address2 = aDecoder.decodeObjectForKey("address2") as? String
        address3 = aDecoder.decodeObjectForKey("address3") as? String
        city = aDecoder.decodeObjectForKey("city") as? String
        country = aDecoder.decodeObjectForKey("country") as? String
        state = aDecoder.decodeObjectForKey("state") as? String
        zip = aDecoder.decodeObjectForKey("zip") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        id <- map["id"]
        address1 <- map["address1"]
        address2 <- map["address2"]
        address3 <- map["address3"]
        city <- map["city"]
        country <- map["country"]
        state <- map["state"]
        zip <- map["zip"]
      }
    }
    
    
    
    public class Card: NSObject, NSCoding, Mappable {
      public var id: String?
      public var first6: String?
      public var last4: String?
      public var firstName: String?
      public var lastName: String?
      public var expirationDate: String?
      public var cardType: String?
      public var token: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(first6, forKey: "first6")
        aCoder.encodeObject(last4, forKey: "last4")
        aCoder.encodeObject(firstName, forKey: "firstName")
        aCoder.encodeObject(lastName, forKey: "lastName")
        aCoder.encodeObject(expirationDate, forKey: "expirationDate")
        aCoder.encodeObject(cardType, forKey: "cardType")
        aCoder.encodeObject(token, forKey: "token")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        first6 = aDecoder.decodeObjectForKey("first6") as? String
        last4 = aDecoder.decodeObjectForKey("last4") as? String
        firstName = aDecoder.decodeObjectForKey("firstName") as? String
        lastName = aDecoder.decodeObjectForKey("lastName") as? String
        expirationDate = aDecoder.decodeObjectForKey("expirationDate") as? String
        cardType = aDecoder.decodeObjectForKey("cardType") as? String
        token = aDecoder.decodeObjectForKey("token") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        id <- map["id"]
        first6 <- map["first6"]
        last4 <- map["last4"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        expirationDate <- map["expirationDate"]
        cardType <- map["cardType"]
        token <- map["token"]
      }
    }
    
    
    
    public class Customer: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// The order with which the customer is associated
      public var orderRef: CLVModels.Order.Order?
      /// First/given name of the customer
      public var firstName: String?
      /// Last name/surname of the customer
      public var lastName: String?
      public var marketingAllowed: Bool?
      public var customerSince: Int?
      public var orders: [CLVModels.Order.Order]?
      public var addresses: [CLVModels.Customers.Address]?
      public var emailAddresses: [CLVModels.Customers.EmailAddress]?
      public var phoneNumbers: [CLVModels.Customers.PhoneNumber]?
      public var cards: [CLVModels.Customers.Card]?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(orderRef, forKey: "orderRef")
        aCoder.encodeObject(firstName, forKey: "firstName")
        aCoder.encodeObject(lastName, forKey: "lastName")
        aCoder.encodeObject(marketingAllowed, forKey: "marketingAllowed")
        aCoder.encodeObject(customerSince, forKey: "customerSince")
        aCoder.encodeObject(orders, forKey: "orders")
        aCoder.encodeObject(addresses, forKey: "addresses")
        aCoder.encodeObject(emailAddresses, forKey: "emailAddresses")
        aCoder.encodeObject(phoneNumbers, forKey: "phoneNumbers")
        aCoder.encodeObject(cards, forKey: "cards")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        orderRef = aDecoder.decodeObjectForKey("orderRef") as? CLVModels.Order.Order
        firstName = aDecoder.decodeObjectForKey("firstName") as? String
        lastName = aDecoder.decodeObjectForKey("lastName") as? String
        marketingAllowed = aDecoder.decodeObjectForKey("marketingAllowed") as? Bool
        customerSince = aDecoder.decodeObjectForKey("customerSince") as? Int
        orders = aDecoder.decodeObjectForKey("orders") as? [CLVModels.Order.Order]
        addresses = aDecoder.decodeObjectForKey("addresses") as? [CLVModels.Customers.Address]
        emailAddresses = aDecoder.decodeObjectForKey("emailAddresses") as? [CLVModels.Customers.EmailAddress]
        phoneNumbers = aDecoder.decodeObjectForKey("phoneNumbers") as? [CLVModels.Customers.PhoneNumber]
        cards = aDecoder.decodeObjectForKey("cards") as? [CLVModels.Customers.Card]
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        id <- map["id"]
        orderRef <- map["orderRef"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        marketingAllowed <- map["marketingAllowed"]
        customerSince <- map["customerSince"]
        orders <- map["orders.elements"]
        addresses <- map["addresses.elements"]
        emailAddresses <- map["emailAddresses.elements"]
        phoneNumbers <- map["phoneNumbers.elements"]
        cards <- map["cards.elements"]
      }
    }
    
    
    
    public class EmailAddress: NSObject, NSCoding, Mappable {
      public var id: String?
      public var emailAddress: String?
      public var verifiedTime: NSDate?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(emailAddress, forKey: "emailAddress")
        aCoder.encodeObject(verifiedTime, forKey: "verifiedTime")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        emailAddress = aDecoder.decodeObjectForKey("emailAddress") as? String
        verifiedTime = aDecoder.decodeObjectForKey("verifiedTime") as? NSDate
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        id <- map["id"]
        emailAddress <- map["emailAddress"]
        verifiedTime <- (map["verifiedTime"], CLVDateTransform())
      }
    }
    
    
    
    public class PhoneNumber: NSObject, NSCoding, Mappable {
      public var id: String?
      public var phoneNumber: String?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(phoneNumber, forKey: "phoneNumber")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        phoneNumber = aDecoder.decodeObjectForKey("phoneNumber") as? String
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        id <- map["id"]
        phoneNumber <- map["phoneNumber"]
      }
    }
    
  }
}