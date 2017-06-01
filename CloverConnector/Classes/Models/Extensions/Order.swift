
/**
 * Autogenerated by Avro
 *
 * DO NOT EDIT DIRECTLY
 */

import ObjectMapper

extension CLVModels {
  public class Order {
    
    
    public enum CustomerIdMethod: String {
      case NAME
      case TABLE
      case NAME_TABLE
    }
    
    
    
    public class Discount: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// The order with which the discount is associated
      public var orderRef: CLVModels.Order.Order?
      /// The lineItem with which the discount is associated
      public var lineItemRef: CLVModels.Order.LineItem?
      /// If this item is based on a standard discount, this will point to the appropriate inventory.Discount
      public var discount: CLVModels.Inventory.Discount?
      /// Name of the discount
      public var name: String?
      /// Discount amount in fraction of currency unit (e.g. cents) based on currency fraction digits supported
      public var amount: Int?
      /// Discount amount in percent
      public var percentage: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(orderRef, forKey: "orderRef")
        aCoder.encodeObject(lineItemRef, forKey: "lineItemRef")
        aCoder.encodeObject(discount, forKey: "discount")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(percentage, forKey: "percentage")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        orderRef = aDecoder.decodeObjectForKey("orderRef") as? CLVModels.Order.Order
        lineItemRef = aDecoder.decodeObjectForKey("lineItemRef") as? CLVModels.Order.LineItem
        discount = aDecoder.decodeObjectForKey("discount") as? CLVModels.Inventory.Discount
        name = aDecoder.decodeObjectForKey("name") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        percentage = aDecoder.decodeObjectForKey("percentage") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        id <- map["id"]
        orderRef <- map["orderRef"]
        lineItemRef <- map["lineItemRef"]
        discount <- map["discount"]
        name <- map["name"]
        amount <- map["amount"]
        percentage <- map["percentage"]
      }
    }
    
    
    
    public class FireOrder: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// The id of the order to fire.
      public var orderId: String?
      /// How long in seconds to wait before calling fire.
      public var delay: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(orderId, forKey: "orderId")
        aCoder.encodeObject(delay, forKey: "delay")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        orderId = aDecoder.decodeObjectForKey("orderId") as? String
        delay = aDecoder.decodeObjectForKey("delay") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        id <- map["id"]
        orderId <- map["orderId"]
        delay <- map["delay"]
      }
    }
    
    
    
    public enum HoursAvailable: String {
      case ALL
      case BUSINESS
      case CUSTOM
    }
    
    
    
    public class LineItem: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// The order with which the line item is associated
      public var orderRef: CLVModels.Order.Order?
      /// Inventory item used to create this line item
      public var item: CLVModels.Inventory.Item?
      /// Line item name
      public var name: String?
      /// Alternate name of the line item
      public var alternateName: String?
      /// Price of the item, typically in cents; use priceType and merchant currency to determine actual item price
      public var price: Int?
      /// Unit quantity
      public var unitQty: Int?
      /// Unit name (e.g. oz, lb, etc.)
      public var unitName: String?
      public var itemCode: String?
      public var note: String?
      public var printed: Bool?
      public var exchangedLineItem: CLVModels.Order.LineItem?
      public var binName: String?
      public var userData: String?
      public var createdTime: NSDate?
      public var orderClientCreatedTime: NSDate?
      public var discounts: [CLVModels.Order.Discount]?
      /// does the calculated flag actually do anything?
      public var discountAmount: Int?
      public var exchanged: Bool?
      public var modifications: [CLVModels.Order.Modification]?
      public var refunded: Bool?
      /// True if this item should be counted as revenue, for example gift cards and donations would not
      public var isRevenue: Bool?
      public var taxRates: [CLVModels.Inventory.TaxRate]?
      /// Payments that were made for this line item
      public var payments: [CLVModels.Payments.LineItemPayment]?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(orderRef, forKey: "orderRef")
        aCoder.encodeObject(item, forKey: "item")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(alternateName, forKey: "alternateName")
        aCoder.encodeObject(price, forKey: "price")
        aCoder.encodeObject(unitQty, forKey: "unitQty")
        aCoder.encodeObject(unitName, forKey: "unitName")
        aCoder.encodeObject(itemCode, forKey: "itemCode")
        aCoder.encodeObject(note, forKey: "note")
        aCoder.encodeObject(printed, forKey: "printed")
        aCoder.encodeObject(exchangedLineItem, forKey: "exchangedLineItem")
        aCoder.encodeObject(binName, forKey: "binName")
        aCoder.encodeObject(userData, forKey: "userData")
        aCoder.encodeObject(createdTime, forKey: "createdTime")
        aCoder.encodeObject(orderClientCreatedTime, forKey: "orderClientCreatedTime")
        aCoder.encodeObject(discounts, forKey: "discounts")
        aCoder.encodeObject(discountAmount, forKey: "discountAmount")
        aCoder.encodeObject(exchanged, forKey: "exchanged")
        aCoder.encodeObject(modifications, forKey: "modifications")
        aCoder.encodeObject(refunded, forKey: "refunded")
        aCoder.encodeObject(isRevenue, forKey: "isRevenue")
        aCoder.encodeObject(taxRates, forKey: "taxRates")
        aCoder.encodeObject(payments, forKey: "payments")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        orderRef = aDecoder.decodeObjectForKey("orderRef") as? CLVModels.Order.Order
        item = aDecoder.decodeObjectForKey("item") as? CLVModels.Inventory.Item
        name = aDecoder.decodeObjectForKey("name") as? String
        alternateName = aDecoder.decodeObjectForKey("alternateName") as? String
        price = aDecoder.decodeObjectForKey("price") as? Int
        unitQty = aDecoder.decodeObjectForKey("unitQty") as? Int
        unitName = aDecoder.decodeObjectForKey("unitName") as? String
        itemCode = aDecoder.decodeObjectForKey("itemCode") as? String
        note = aDecoder.decodeObjectForKey("note") as? String
        printed = aDecoder.decodeObjectForKey("printed") as? Bool
        exchangedLineItem = aDecoder.decodeObjectForKey("exchangedLineItem") as? CLVModels.Order.LineItem
        binName = aDecoder.decodeObjectForKey("binName") as? String
        userData = aDecoder.decodeObjectForKey("userData") as? String
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        orderClientCreatedTime = aDecoder.decodeObjectForKey("orderClientCreatedTime") as? NSDate
        discounts = aDecoder.decodeObjectForKey("discounts") as? [CLVModels.Order.Discount]
        discountAmount = aDecoder.decodeObjectForKey("discountAmount") as? Int
        exchanged = aDecoder.decodeObjectForKey("exchanged") as? Bool
        modifications = aDecoder.decodeObjectForKey("modifications") as? [CLVModels.Order.Modification]
        refunded = aDecoder.decodeObjectForKey("refunded") as? Bool
        isRevenue = aDecoder.decodeObjectForKey("isRevenue") as? Bool
        taxRates = aDecoder.decodeObjectForKey("taxRates") as? [CLVModels.Inventory.TaxRate]
        payments = aDecoder.decodeObjectForKey("payments") as? [CLVModels.Payments.LineItemPayment]
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        id <- map["id"]
        orderRef <- map["orderRef"]
        item <- map["item"]
        name <- map["name"]
        alternateName <- map["alternateName"]
        price <- map["price"]
        unitQty <- map["unitQty"]
        unitName <- map["unitName"]
        itemCode <- map["itemCode"]
        note <- map["note"]
        printed <- map["printed"]
        exchangedLineItem <- map["exchangedLineItem"]
        binName <- map["binName"]
        userData <- map["userData"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        orderClientCreatedTime <- (map["orderClientCreatedTime"], CLVDateTransform())
        discounts <- map["discounts.elements"]
        discountAmount <- map["discountAmount"]
        exchanged <- map["exchanged"]
        modifications <- map["modifications.elements"]
        refunded <- map["refunded"]
        isRevenue <- map["isRevenue"]
        taxRates <- map["taxRates.elements"]
        payments <- map["payments.elements"]
      }
    }
    
    
    
    /// Snapshot of a line item modifier at the time that the order was placed.
    public class Modification: NSObject, NSCoding, Mappable {
      public var id: String?
      /// The line item with which the modification is associated
      public var lineItemRef: CLVModels.Order.LineItem?
      public var name: String?
      public var alternateName: String?
      public var amount: Int?
      /// The modifier object.  Values from the Modifier are copied to the Modification at the time that the order is placed.  Modifier values may change after the order is placed.
      public var modifier: CLVModels.Inventory.Modifier?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(lineItemRef, forKey: "lineItemRef")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(alternateName, forKey: "alternateName")
        aCoder.encodeObject(amount, forKey: "amount")
        aCoder.encodeObject(modifier, forKey: "modifier")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        lineItemRef = aDecoder.decodeObjectForKey("lineItemRef") as? CLVModels.Order.LineItem
        name = aDecoder.decodeObjectForKey("name") as? String
        alternateName = aDecoder.decodeObjectForKey("alternateName") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
        modifier = aDecoder.decodeObjectForKey("modifier") as? CLVModels.Inventory.Modifier
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        id <- map["id"]
        lineItemRef <- map["lineItemRef"]
        name <- map["name"]
        alternateName <- map["alternateName"]
        amount <- map["amount"]
        modifier <- map["modifier"]
      }
    }
    
    
    
    public class Order: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// Currency of this order
      public var currency: String?
      public var customers: [CLVModels.Customers.Customer]?
      /// The employee who took this order
      public var employee: CLVModels.Employees.Employee?
      /// Total price of the order
      public var total: Int?
      public var title: String?
      public var note: String?
      public var orderType: CLVModels.Order.OrderType?
      public var taxRemoved: Bool?
      public var isVat: Bool?
      public var state: String?
      public var manualTransaction: Bool?
      public var groupLineItems: Bool?
      public var testMode: Bool?
      public var payType: CLVModels.Order.PayType?
      /// Creation timestamp
      public var createdTime: NSDate?
      public var clientCreatedTime: NSDate?
      /// Last modified time of the order
      public var modifiedTime: NSDate?
      public var deletedTimestamp: NSDate?
      /// Optional service charge (gratuity) applied to this order
      public var serviceCharge: CLVModels.Base.ServiceCharge?
      public var discounts: [CLVModels.Order.Discount]?
      public var lineItems: [CLVModels.Order.LineItem]?
      public var taxRates: [CLVModels.Order.OrderTaxRate]?
      /// Payments that were made for this order
      public var payments: [CLVModels.Payments.Payment]?
      /// Refunds that were made for this order
      public var refunds: [CLVModels.Payments.Refund]?
      public var credits: [CLVModels.Payments.Credit]?
      /// Voided payments associated with this order
      public var voids: [CLVModels.Payments.Payment]?
      /// Device which created the order
      public var device: CLVModels.Device.Device?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(currency, forKey: "currency")
        aCoder.encodeObject(customers, forKey: "customers")
        aCoder.encodeObject(employee, forKey: "employee")
        aCoder.encodeObject(total, forKey: "total")
        aCoder.encodeObject(title, forKey: "title")
        aCoder.encodeObject(note, forKey: "note")
        aCoder.encodeObject(orderType, forKey: "orderType")
        aCoder.encodeObject(taxRemoved, forKey: "taxRemoved")
        aCoder.encodeObject(isVat, forKey: "isVat")
        aCoder.encodeObject(state, forKey: "state")
        aCoder.encodeObject(manualTransaction, forKey: "manualTransaction")
        aCoder.encodeObject(groupLineItems, forKey: "groupLineItems")
        aCoder.encodeObject(testMode, forKey: "testMode")
        aCoder.encodeObject(payType?.rawValue, forKey: "payType")
        aCoder.encodeObject(createdTime, forKey: "createdTime")
        aCoder.encodeObject(clientCreatedTime, forKey: "clientCreatedTime")
        aCoder.encodeObject(modifiedTime, forKey: "modifiedTime")
        aCoder.encodeObject(deletedTimestamp, forKey: "deletedTimestamp")
        aCoder.encodeObject(serviceCharge, forKey: "serviceCharge")
        aCoder.encodeObject(discounts, forKey: "discounts")
        aCoder.encodeObject(lineItems, forKey: "lineItems")
        aCoder.encodeObject(taxRates, forKey: "taxRates")
        aCoder.encodeObject(payments, forKey: "payments")
        aCoder.encodeObject(refunds, forKey: "refunds")
        aCoder.encodeObject(credits, forKey: "credits")
        aCoder.encodeObject(voids, forKey: "voids")
        aCoder.encodeObject(device, forKey: "device")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        currency = aDecoder.decodeObjectForKey("currency") as? String
        customers = aDecoder.decodeObjectForKey("customers") as? [CLVModels.Customers.Customer]
        employee = aDecoder.decodeObjectForKey("employee") as? CLVModels.Employees.Employee
        total = aDecoder.decodeObjectForKey("total") as? Int
        title = aDecoder.decodeObjectForKey("title") as? String
        note = aDecoder.decodeObjectForKey("note") as? String
        orderType = aDecoder.decodeObjectForKey("orderType") as? CLVModels.Order.OrderType
        taxRemoved = aDecoder.decodeObjectForKey("taxRemoved") as? Bool
        isVat = aDecoder.decodeObjectForKey("isVat") as? Bool
        state = aDecoder.decodeObjectForKey("state") as? String
        manualTransaction = aDecoder.decodeObjectForKey("manualTransaction") as? Bool
        groupLineItems = aDecoder.decodeObjectForKey("groupLineItems") as? Bool
        testMode = aDecoder.decodeObjectForKey("testMode") as? Bool
        payType = (aDecoder.decodeObjectForKey("payType") as? String) != nil ?
          CLVModels.Order.PayType(rawValue: (aDecoder.decodeObjectForKey("payType") as! String)) : nil
        createdTime = aDecoder.decodeObjectForKey("createdTime") as? NSDate
        clientCreatedTime = aDecoder.decodeObjectForKey("clientCreatedTime") as? NSDate
        modifiedTime = aDecoder.decodeObjectForKey("modifiedTime") as? NSDate
        deletedTimestamp = aDecoder.decodeObjectForKey("deletedTimestamp") as? NSDate
        serviceCharge = aDecoder.decodeObjectForKey("serviceCharge") as? CLVModels.Base.ServiceCharge
        discounts = aDecoder.decodeObjectForKey("discounts") as? [CLVModels.Order.Discount]
        lineItems = aDecoder.decodeObjectForKey("lineItems") as? [CLVModels.Order.LineItem]
        taxRates = aDecoder.decodeObjectForKey("taxRates") as? [CLVModels.Order.OrderTaxRate]
        payments = aDecoder.decodeObjectForKey("payments") as? [CLVModels.Payments.Payment]
        refunds = aDecoder.decodeObjectForKey("refunds") as? [CLVModels.Payments.Refund]
        credits = aDecoder.decodeObjectForKey("credits") as? [CLVModels.Payments.Credit]
        voids = aDecoder.decodeObjectForKey("voids") as? [CLVModels.Payments.Payment]
        device = aDecoder.decodeObjectForKey("device") as? CLVModels.Device.Device
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        id <- map["id"]
        currency <- map["currency"]
        customers <- map["customers.elements"]
        employee <- map["employee"]
        total <- map["total"]
        title <- map["title"]
        note <- map["note"]
        orderType <- map["orderType"]
        taxRemoved <- map["taxRemoved"]
        isVat <- map["isVat"]
        state <- map["state"]
        manualTransaction <- map["manualTransaction"]
        groupLineItems <- map["groupLineItems"]
        testMode <- map["testMode"]
        payType <- map["payType"]
        createdTime <- (map["createdTime"], CLVDateTransform())
        clientCreatedTime <- (map["clientCreatedTime"], CLVDateTransform())
        modifiedTime <- (map["modifiedTime"], CLVDateTransform())
        deletedTimestamp <- (map["deletedTimestamp"], CLVDateTransform())
        serviceCharge <- map["serviceCharge"]
        discounts <- map["discounts.elements"]
        lineItems <- map["lineItems.elements"]
        taxRates <- map["taxRates.elements"]
        payments <- map["payments.elements"]
        refunds <- map["refunds.elements"]
        credits <- map["credits.elements"]
        voids <- map["voids.elements"]
        device <- map["device"]
      }
    }
    
    
    
    public class OrderTaxRate: NSObject, NSCoding, Mappable {
      public var id: String?
      public var name: String?
      public var amount: Int?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(amount, forKey: "amount")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        name = aDecoder.decodeObjectForKey("name") as? String
        amount = aDecoder.decodeObjectForKey("amount") as? Int
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        id <- map["id"]
        name <- map["name"]
        amount <- map["amount"]
      }
    }
    
    
    
    public class OrderType: NSObject, NSCoding, Mappable {
      /// Unique identifier
      public var id: String?
      /// Label Key
      public var labelKey: String?
      /// Label Key
      public var label: String?
      /// If this order type is taxable
      public var taxable: Bool?
      /// If this order type is the default
      public var isDefault: Bool?
      /// If set to false, then this order type includes all of the merchant's categories. Otherwise, it only contains the categories defined in the "categories" field on this object.
      public var filterCategories: Bool?
      /// If this order type is hidden on the register
      public var isHidden: Bool?
      /// The price of a fee added to this order type
      public var fee: Int?
      /// The minimum amount required for an order to be placed
      public var minOrderAmount: Int?
      /// The maximum amount for an order allowed
      public var maxOrderAmount: Int?
      /// The maximum radius allowed for an order (i.e. delivery)
      public var maxRadius: Int?
      /// The average time it takes to complete the order
      public var avgOrderTime: Int?
      public var hoursAvailable: CLVModels.Order.HoursAvailable?
      public var customerIdMethod: CLVModels.Order.CustomerIdMethod?
      /// If this order type is deleted
      public var isDeleted: Bool?
      /// Optional system order type that this order type is associated with.
      public var systemOrderTypeId: String?
      /// The hours this order type is available (if they differ from normal merchant hours)
      public var hours: CLVModels.Hours.HoursSet?
      /// The categories of items that can be assigned to this order type
      public var categories: [CLVModels.Inventory.Category]?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(labelKey, forKey: "labelKey")
        aCoder.encodeObject(label, forKey: "label")
        aCoder.encodeObject(taxable, forKey: "taxable")
        aCoder.encodeObject(isDefault, forKey: "isDefault")
        aCoder.encodeObject(filterCategories, forKey: "filterCategories")
        aCoder.encodeObject(isHidden, forKey: "isHidden")
        aCoder.encodeObject(fee, forKey: "fee")
        aCoder.encodeObject(minOrderAmount, forKey: "minOrderAmount")
        aCoder.encodeObject(maxOrderAmount, forKey: "maxOrderAmount")
        aCoder.encodeObject(maxRadius, forKey: "maxRadius")
        aCoder.encodeObject(avgOrderTime, forKey: "avgOrderTime")
        aCoder.encodeObject(hoursAvailable?.rawValue, forKey: "hoursAvailable")
        aCoder.encodeObject(customerIdMethod?.rawValue, forKey: "customerIdMethod")
        aCoder.encodeObject(isDeleted, forKey: "isDeleted")
        aCoder.encodeObject(systemOrderTypeId, forKey: "systemOrderTypeId")
        aCoder.encodeObject(hours, forKey: "hours")
        aCoder.encodeObject(categories, forKey: "categories")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        labelKey = aDecoder.decodeObjectForKey("labelKey") as? String
        label = aDecoder.decodeObjectForKey("label") as? String
        taxable = aDecoder.decodeObjectForKey("taxable") as? Bool
        isDefault = aDecoder.decodeObjectForKey("isDefault") as? Bool
        filterCategories = aDecoder.decodeObjectForKey("filterCategories") as? Bool
        isHidden = aDecoder.decodeObjectForKey("isHidden") as? Bool
        fee = aDecoder.decodeObjectForKey("fee") as? Int
        minOrderAmount = aDecoder.decodeObjectForKey("minOrderAmount") as? Int
        maxOrderAmount = aDecoder.decodeObjectForKey("maxOrderAmount") as? Int
        maxRadius = aDecoder.decodeObjectForKey("maxRadius") as? Int
        avgOrderTime = aDecoder.decodeObjectForKey("avgOrderTime") as? Int
        hoursAvailable = (aDecoder.decodeObjectForKey("hoursAvailable") as? String) != nil ?
          CLVModels.Order.HoursAvailable(rawValue: (aDecoder.decodeObjectForKey("hoursAvailable") as! String)) : nil
        customerIdMethod = (aDecoder.decodeObjectForKey("customerIdMethod") as? String) != nil ?
          CLVModels.Order.CustomerIdMethod(rawValue: (aDecoder.decodeObjectForKey("customerIdMethod") as! String)) : nil
        isDeleted = aDecoder.decodeObjectForKey("isDeleted") as? Bool
        systemOrderTypeId = aDecoder.decodeObjectForKey("systemOrderTypeId") as? String
        hours = aDecoder.decodeObjectForKey("hours") as? CLVModels.Hours.HoursSet
        categories = aDecoder.decodeObjectForKey("categories") as? [CLVModels.Inventory.Category]
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        id <- map["id"]
        labelKey <- map["labelKey"]
        label <- map["label"]
        taxable <- map["taxable"]
        isDefault <- map["isDefault"]
        filterCategories <- map["filterCategories"]
        isHidden <- map["isHidden"]
        fee <- map["fee"]
        minOrderAmount <- map["minOrderAmount"]
        maxOrderAmount <- map["maxOrderAmount"]
        maxRadius <- map["maxRadius"]
        avgOrderTime <- map["avgOrderTime"]
        hoursAvailable <- map["hoursAvailable"]
        customerIdMethod <- map["customerIdMethod"]
        isDeleted <- map["isDeleted"]
        systemOrderTypeId <- map["systemOrderTypeId"]
        hours <- map["hours"]
        categories <- map["categories.elements"]
      }
    }
    
    
    
    public class OrderTypeCategory: NSObject, NSCoding, Mappable {
      public var orderType: CLVModels.Order.OrderType?
      public var category: CLVModels.Inventory.Category?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(orderType, forKey: "orderType")
        aCoder.encodeObject(category, forKey: "category")
      }
      
      required public init(coder aDecoder: NSCoder) {
        orderType = aDecoder.decodeObjectForKey("orderType") as? CLVModels.Order.OrderType
        category = aDecoder.decodeObjectForKey("category") as? CLVModels.Inventory.Category
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        orderType <- map["orderType"]
        category <- map["category"]
      }
    }
    
    
    
    public enum PayType: String {
      case SPLIT_GUEST
      case SPLIT_ITEM
      case SPLIT_CUSTOM
      case FULL
    }
    
    
    
    public class SystemOrderType: NSObject, NSCoding, Mappable {
      /// Unqiue identifier
      public var id: String?
      /// Label Key
      public var labelKey: String?
      /// Is for quick service restraunts?
      public var isQsr: Bool?
      /// Is for full service restraunts?
      public var isFsr: Bool?
      /// Is for retail stores?
      public var isRetail: Bool?
      
      public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(labelKey, forKey: "labelKey")
        aCoder.encodeObject(isQsr, forKey: "isQsr")
        aCoder.encodeObject(isFsr, forKey: "isFsr")
        aCoder.encodeObject(isRetail, forKey: "isRetail")
      }
      
      required public init(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObjectForKey("id") as? String
        labelKey = aDecoder.decodeObjectForKey("labelKey") as? String
        isQsr = aDecoder.decodeObjectForKey("isQsr") as? Bool
        isFsr = aDecoder.decodeObjectForKey("isFsr") as? Bool
        isRetail = aDecoder.decodeObjectForKey("isRetail") as? Bool
      }
      
      override public init() {}
      
      // Mappable
      
      required public init?(_ map:Map) {}
      
      public func mapping(map:Map) {
        id <- map["id"]
        labelKey <- map["labelKey"]
        isQsr <- map["isQsr"]
        isFsr <- map["isFsr"]
        isRetail <- map["isRetail"]
      }
    }
    
    
    
    /// Symbols beginning with USER_ or REJECT_ are user-initiated.  Others are client- or server-initiated.
    public enum VoidReason: String {
      case USER_CANCEL
      case TRANSPORT_ERROR
      case REJECT_SIGNATURE
      case REJECT_PARTIAL_AUTH
      case NOT_APPROVED
      case FAILED
      case AUTH_CLOSED_NEW_CARD
      case DEVELOPER_PAY_PARTIAL_AUTH
      case REJECT_DUPLICATE
    }
    
  }
}
