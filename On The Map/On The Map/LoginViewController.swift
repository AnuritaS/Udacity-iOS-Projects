//
//  LoginViewController.swift
//  On The Map
//
//  Created by Anurita Srivastava on 11/03/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func loginPressed(_ sender: Any) {
        sessionID()
    }
    
    func sessionID(){
        let urlString = "https://www.udacity.com/api/session"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data,response,error)in
        
            func displayError(_ error: String){
                print(error)
            }
            
            guard error == nil else{
                displayError("\(error)")
                return
            }
           
            guard let data = data else{
                displayError("data error")
                return
            }
            
            let parsedResult : [String:AnyObject]
            do{
                parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
            }catch{
                displayError("parsing error")
                return
            }
            
            /*guard let currentTime = parsedResult["current_time"] as? Data else{
                displayError("current_time error")
                return
            }
            
            guard let account = parsedResult["account"] as? [String:AnyObject] else{
                displayError("account error")
                return
            }
            
            guard let registered = account["registered"] as? Bool else{
                displayError("registered error")
                return
            }
            if registered{
                print("user is registered")
            }
            else{
                print("unidentified user")
            }

            guard let key = account["key"] as? String  else{
                displayError("key error")
                return
            }
            
            guard let session = parsedResult["session"] as? [String:AnyObject] else{
                displayError("session error")
                return
            }
            
            guard let id = session["id"] as? String else{
                displayError("id error")
                return
            }
            
            guard let expiration = session["expiration"] as? Date else{
                displayError("expiration error")
                return
            }*/
        })
    task.resume()
            }
    
    
}
