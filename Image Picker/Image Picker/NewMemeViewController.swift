//
//  NewMemeDelegate.swift
//  Image Picker
//
//  Created by Anurita Srivastava on 10/01/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit
import Foundation

class NewMemeDelegate: UIViewController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add , target: self, action: #selector(newMeme))
        // Do any additional setup after loading the view.
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(controller, animated: true)
        
    }
    func newMeme(){
        let controller = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
}
