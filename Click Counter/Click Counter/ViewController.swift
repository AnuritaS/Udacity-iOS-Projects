//
//  ViewController.swift
//  Click Counter
//
//  Created by Anurita Srivastava on 22/12/16.
//  Copyright © 2016 Anurita Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var count = 0
    var label:UILabel!
     var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // counter label
        let label = UILabel()
        label.frame = CGRect.init(x: 120, y: 100, width: 60, height: 60)
        label.text = "0"
        self.view.addSubview(label)
        self.label = label
        
        //additional label
        let label1 = UILabel()
        label1.frame = CGRect.init(x: 120, y: 140, width: 60, height: 60)
        label1.text = "0"
        self.view.addSubview(label1)
        self.label1 = label1
        
        
        //increment button
         let button = UIButton()
        button.frame = CGRect.init(x: 50, y: 160, width: 200, height: 100)
        button.setTitle("Click to increment", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(ViewController.increment), for: UIControlEvents.touchUpInside)
        
               //decrement button
        let dec_button = UIButton()
        dec_button.frame = CGRect.init(x: 50, y: 220, width: 200, height: 100)
        dec_button.setTitle("Click to decrement" , for: .normal)
        dec_button.setTitleColor(UIColor.red , for: .normal)
        self.view.addSubview(dec_button)
        
        dec_button.addTarget(self, action: #selector(ViewController.decrement), for: UIControlEvents.touchUpInside)
        
        //color button
        let cobutton = UIButton()
        cobutton.frame = CGRect.init(x: 30, y: 280, width: 300, height: 100)
        cobutton.setTitle("Change background color", for: .normal)
        cobutton.setTitleColor(UIColor.green, for: .normal)
        self.view.addSubview(cobutton)
        
        cobutton.addTarget(self, action: #selector(ViewController.color), for: UIControlEvents.touchUpInside)

            }

    func increment(){
    self.count += 1
    self.label.text = "\(self.count)"
        self.label1.text = "\(self.count)"
    }

    func decrement(){
        self.count -= 1
        self.label.text = "\(self.count)"
    }
    
    func color(){
        let r = CGFloat(arc4random()%9)
        let g = CGFloat(arc4random()%9)
        let b = CGFloat(arc4random()%9)
        
        let brightRed = UIColor(displayP3Red: r , green: g, blue: b, alpha: 1.0)
        self.view.backgroundColor = brightRed
}
}
