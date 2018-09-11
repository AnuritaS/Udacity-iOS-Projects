//
//  ViewController.swift
//  Roshambo
//
//  Created by Anurita Srivastava on 25/12/16.
//  Copyright © 2016 Anurita Srivastava. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
   
    @IBAction func Code(_ sender: UIButton) {
       
                let controller: resultViewController
        
        controller = self.storyboard?.instantiateViewController(withIdentifier: "resultViewController") as! resultViewController
       
        controller.user = title(sender)
        
        self.present(controller, animated: true, completion: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "segueResultView"{
        let controller = segue.destination as! resultViewController
            controller.user = title(sender as! UIButton)
            
        }
        
    }
    @IBAction func segueWithCode(_ sender: UIButton) {
        
        performSegue(withIdentifier: "segueResultView", sender: sender)
      
    }
    
    func title(_ sender: UIButton)-> String{
    let title = sender.title(for: UIControlState())!
   return title
    }
    
    
}


