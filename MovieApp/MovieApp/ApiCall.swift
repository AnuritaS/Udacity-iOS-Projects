//
//  ApiCall.swift
//  MovieApp
//
//  Created by Anurita Srivastava on 31/08/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit
import Alamofire
import  CoreData


enum resultArray<T> {
    case Success(T)
    case Error(String)
}


class ApiCall: NSObject{
   let dataControl = (UIApplication.shared.delegate as! AppDelegate).dataControl
    
    func getMovies(completion: @escaping (resultArray<[Result]>) -> Void){
        let apiKey = "eeb6331de176dbf5d916f0a3691b0851"
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
        
        Alamofire.request(url).responseJSON(completionHandler: {response in
            print(response.request)
            switch response.result{
            case .success(let json):
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    // original server data as UTF8 string
//              print(utf8Text)
                    guard let allMovies = movie(JSONString: utf8Text) else{
                        print("error in allmovies")
                        return
                    }
                    guard let allresult = allMovies.results else{
                        print("error in allresults")
                        return
                    }
                    
                  completion(.Success(allresult))
            }
               
                
            case .failure(let error):
                print(error.localizedDescription)
            
        }
        })
        
    }
    
    
    func createMovieEntityFrom(array: [Result], completion: @escaping (Bool) -> Void) {
   
        let managedObjectContext = dataControl.viewContext
       
            for movie in array{
                let movieEnt = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: managedObjectContext) as? Movie
                    
                movieEnt?.title = movie.title
                movieEnt?.date = movie.releaseDate
                movieEnt?.rating = movie.voteAverage ?? 0
                  
                    do {
                        try dataControl.viewContext.save()
                       completion(true)
                    } catch let error {
                        print(error)
                        completion(false)
                    }
                
        }
    }
    
     func clearData() {
        let managedObjectContext = dataControl.viewContext
        let fetchRequest = NSFetchRequest<Movie>(entityName: "Movie")
            
        do{
            let objects = try managedObjectContext.fetch(fetchRequest) as? [Movie]
             _ = objects.map{$0.map{managedObjectContext.delete($0)}}
        }catch(let error){
            print("cant delete", error.localizedDescription)
            }
        
        }
}
