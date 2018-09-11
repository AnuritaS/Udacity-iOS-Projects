//: Playground - noun: a place where people can play
import Foundation

var components = URLComponents()
components.scheme = "https"
components.host = "api.flickr.com"
components.path = "/services/rest"
components.queryItems = [URLQueryItem]()

var query1 = URLQueryItem(name: "method", value: "flickr.photos.search")
var query2 = URLQueryItem(name: "api_key", value: "404eb6be6d67a0dc0310b188c76db9f")
var query3 = URLQueryItem(name: "text", value: "blue")

components.queryItems!.append(query1)
components.queryItems!.append(query2)
components.queryItems!.append(query3)

 print(components.url!)
