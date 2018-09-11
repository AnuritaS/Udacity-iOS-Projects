//
//  ViewController.swift
//  Parse
//
//  Created by Anurita Srivastava on 22/02/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parse()
        self.automaticallyAdjustsScrollViewInsets = false
           }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  struct Users{
        
        let id : Int
        let name: String
        let username: String
        let email: String
        let address: addresses
        let phone: String
        let website: String
        let company: companies
    }
    struct addresses {
        let street: String
        let suite: String
        let city: String
        let zipcode :  String
        let geo: (lat: String,lng: String)
    }
    
    struct companies{
        let name: String
        let catchPhrase: String
        let bs: String
    }
    
    
var allUsers = [Users]()
    
    func parse(){
        let urlName = "http://jsonplaceholder.typicode.com/users"
        let url = URL(string: urlName)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error)in
            
            func displayError(_ error: String){
                print(error)
                print("URL at time of error: \(url)")
            }
            DispatchQueue.main.async(execute: {
                
            guard error == nil else{
                displayError("\(error)")
                return
            }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else{
                displayError("data returned other code")
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
                displayError("parse fail \(data)")
                return
            }
            
            
            for stuff in parsedData  {
                
                guard let id = stuff["id"] as? Int else{
                    displayError("id error")
                    return
                }
                
                guard let name = stuff["name"] as? String else{
                    displayError("name error")
                    return
                }
                
                guard let username = stuff["username"] as? String else{
                    displayError("username error")
                    return
                }
                
                guard let email = stuff["email"] as? String else{
                    displayError("email error")
                    return
                }
                
                guard let address = stuff["address"] as? [String:AnyObject] else{
                    displayError("address error")
                    return
                }
                guard let street = address["street"] as? String else{
                    displayError("street error")
                    return
                }
                guard let suite = address["suite"] as? String else{
                    displayError("suite error")
                    return
                }
                guard let city = address["city"] as? String else{
                    displayError("city error")
                    return
                }
                guard let zipcode = address["zipcode"] as? String else{
                    displayError("zipcode error")
                    return
                }
                guard let geo = address["geo"] as? [String:String] else{
                    displayError("geo error")
                    return
                }
                guard let lat = geo["lat"] else{
                    displayError("lat error")
                    return
                }
                guard let lng = geo["lng"] else{
                    displayError("lng error")
                    return
                }
                
                guard let phone = stuff["phone"] as? String else{
                    displayError("phone error")
                    return
                }
                guard let website = stuff["website"] as? String else{
                    displayError("website error")
                    return
                }
                guard let company = stuff["company"] as? [String :AnyObject] else{
                    displayError("company error")
                    return
                }
                guard let c_name = company["name"] as? String else{
                    displayError("c_name error")
                    return
                }
                guard let phrase = company["catchPhrase"] as? String else{
                    displayError("phrase error")
                    return
                }
                guard let bs = company["bs"] as? String else{
                    displayError("bs error")
                    return
                    
                }
                
                
                let user = Users(id: id, name: name, username: username, email: email, address: addresses(street:street,suite: suite, city:city, zipcode:zipcode, geo:(lat:lat,lng:lng)), phone: phone, website: website, company: companies(name: c_name, catchPhrase: phrase, bs:bs))
                self.allUsers.append(user)
                
            }
            
            self.tableView.reloadData()
        })
       })
        task.resume()
        
    }
}

   





