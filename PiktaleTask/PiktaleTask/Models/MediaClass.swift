//
//  RootClass.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 17, 2021

import Foundation

class MediaClass : NSObject, NSCoding{

    var errorMsg : String!
    var list : [List]!
    var statusCode : Int!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    
    init(fromDictionary dictionary: [String:Any]){
        errorMsg = dictionary["errorMsg"] as? String
        statusCode = dictionary["statusCode"] as? Int
        list = [List]()
        if let listArray = dictionary["list"] as? [[String:Any]]{
            for dic in listArray{
                let value = List(fromDictionary: dic)
                list.append(value)
            }
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if errorMsg != nil{
            dictionary["errorMsg"] = errorMsg
        }
        if statusCode != nil{
            dictionary["statusCode"] = statusCode
        }
        if list != nil{
            var dictionaryElements = [[String:Any]]()
            for listElement in list {
                dictionaryElements.append(listElement.toDictionary())
            }
            dictionary["list"] = dictionaryElements
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        errorMsg = aDecoder.decodeObject(forKey: "errorMsg") as? String
        list = aDecoder.decodeObject(forKey: "list") as? [List]
        statusCode = aDecoder.decodeObject(forKey: "statusCode") as? Int
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if errorMsg != nil{
            aCoder.encode(errorMsg, forKey: "errorMsg")
        }
        if list != nil{
            aCoder.encode(list, forKey: "list")
        }
        if statusCode != nil{
            aCoder.encode(statusCode, forKey: "statusCode")
        }
    }
}
