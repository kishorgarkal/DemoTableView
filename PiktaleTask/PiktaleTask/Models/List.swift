//
//  List.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 17, 2021

import Foundation

class List : NSObject, NSCoding{

    var mediaType : String!
    var mediaUrl : String!
    var title : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        mediaType = dictionary["mediaType"] as? String
        mediaUrl = dictionary["mediaUrl"] as? String
        title = dictionary["title"] as? String
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if mediaType != nil{
            dictionary["mediaType"] = mediaType
        }
        if mediaUrl != nil{
            dictionary["mediaUrl"] = mediaUrl
        }
        if title != nil{
            dictionary["title"] = title
        }
        return dictionary
    }

    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        mediaType = aDecoder.decodeObject(forKey: "mediaType") as? String
        mediaUrl = aDecoder.decodeObject(forKey: "mediaUrl") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
    }

    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if mediaType != nil{
            aCoder.encode(mediaType, forKey: "mediaType")
        }
        if mediaUrl != nil{
            aCoder.encode(mediaUrl, forKey: "mediaUrl")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
    }
}
