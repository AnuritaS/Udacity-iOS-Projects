//
//	TopNews.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class TopNews : NSObject, NSCoding, Mappable{

	var articles : [Article]?
	var status : String?
	var totalResults : Int?


	class func newInstance(map: Map) -> Mappable?{
		return TopNews()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		articles <- map["articles"]
		status <- map["status"]
		totalResults <- map["totalResults"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         articles = aDecoder.decodeObject(forKey: "articles") as? [Article]
         status = aDecoder.decodeObject(forKey: "status") as? String
         totalResults = aDecoder.decodeObject(forKey: "totalResults") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if articles != nil{
			aCoder.encode(articles, forKey: "articles")
		}
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}
		if totalResults != nil{
			aCoder.encode(totalResults, forKey: "totalResults")
		}

	}

}