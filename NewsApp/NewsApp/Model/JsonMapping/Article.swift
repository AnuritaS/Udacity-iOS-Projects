//
//	Article.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Article : NSObject, NSCoding, Mappable{

	var author : String?
	var descriptionField : String?
	var publishedAt : String?
	var source : Source?
	var title : String?
	var url : String?
	var urlToImage : String?


	class func newInstance(map: Map) -> Mappable?{
		return Article()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		author <- map["author"]
		descriptionField <- map["description"]
		publishedAt <- map["publishedAt"]
		source <- map["source"]
		title <- map["title"]
		url <- map["url"]
		urlToImage <- map["urlToImage"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         author = aDecoder.decodeObject(forKey: "author") as? String
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         publishedAt = aDecoder.decodeObject(forKey: "publishedAt") as? String
         source = aDecoder.decodeObject(forKey: "source") as? Source
         title = aDecoder.decodeObject(forKey: "title") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String
         urlToImage = aDecoder.decodeObject(forKey: "urlToImage") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if author != nil{
			aCoder.encode(author, forKey: "author")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if publishedAt != nil{
			aCoder.encode(publishedAt, forKey: "publishedAt")
		}
		if source != nil{
			aCoder.encode(source, forKey: "source")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}
		if urlToImage != nil{
			aCoder.encode(urlToImage, forKey: "urlToImage")
		}

	}

}