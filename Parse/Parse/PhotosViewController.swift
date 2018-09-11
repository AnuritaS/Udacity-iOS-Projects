//
//  PhotosViewController.swift
//  Parse
//
//  Created by Anurita Srivastava on 24/02/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
photosParse()
        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    struct Photos{
        
        let albumId: Int
        let id: Int
        let title: String
        let url: String
        let thumbnailUrl: String
    }
    
    var photosArray = [Photos]()
    
    func photosParse(){
        let urlName = "http://jsonplaceholder.typicode.com/photos"
        let url = URL(string: urlName)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request, completionHandler:{(data,response,error) in
            func displayError(_ error:String){
                print(error)
                print("url at time of error \(url)")
            }
            
            DispatchQueue.main.async(execute: {
                guard error == nil else{
                    displayError("\(error)")
                    return
                }
                
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else{
                    displayError("status code other than 2xx")
                    return
                }
                
                guard let data = data else{
                    displayError("data error")
                    return
                }
                
                let parsedData : [[String:AnyObject]]!
                do{
                    parsedData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:AnyObject]]
                }catch{
                    displayError("parsing erorr")
                    return
                }
                
                for stuff in parsedData{
                    guard let albumId = stuff["albumId"] as? Int else{
                        displayError("albumId error")
                        return
                    }
                    
                    guard let id = stuff["id"] as? Int else{
                        displayError("id error")
                        return
                    }
                    
                    guard let title = stuff["title"] as? String else{
                        displayError("title error")
                        return
                    }
                    
                    guard let url = stuff["url"] as? String else{
                        displayError("url error")
                        return
                    }
                    
                    guard let thumbnail = stuff["thumbnailUrl"] as? String else{
                        displayError("thumbnail error")
                        return
                    }
                    
                    
                    let photo = Photos(albumId: albumId, id: id, title: title, url: url, thumbnailUrl: thumbnail)
                    
                    self.photosArray.append(photo)
                }
                self.collectionView.reloadData()
            })
        })
    
        task.resume()
        
    }
}
