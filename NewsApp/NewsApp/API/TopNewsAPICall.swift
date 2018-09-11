//
//  TopNewsAPICall.swift
//  NewsApp
//
//  Created by Anurita Srivastava on 11/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper


enum resultArray<T> {
    case Success(T)
    case Error(String)
}

class TopNewsAPICall: NSObject{

    func getTopNews(searchText: String, completion: @escaping (resultArray<[Article]>)->Void){
        
        let apiKey = Constant.apiKey
        var url = Constant.url+"q=\(searchText)&apiKey=\(apiKey)"
        Alamofire.request(url).responseJSON(completionHandler: {response in
            print(response.request)
            switch response.result{
            case .success(let json):
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    // original server data as UTF8 string
                    //              print(utf8Text)
                    guard let allNews = TopNews(JSONString: utf8Text)  else{
                        print("error in allNews")
                        return
                    }
                    guard let allArticles = allNews.articles else{
                        print("error in allArticles")
                        return
                    }
                    
                    completion(.Success(allArticles))
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        })
        
    }
    
}
