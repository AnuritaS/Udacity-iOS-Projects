//
//  ViewController.swift
//  Color Changer
//
//  Created by Anurita Srivastava on 23/12/16.
//  Copyright © 2016 Anurita Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var Red: UISlider!
    @IBOutlet weak var Green: UISlider!
    @IBOutlet weak var Blue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ColorChange(_ sender: AnyObject) {
        self.Red.isContinuous = false
        self.Green.isContinuous = false
        self.Blue.isContinuous = false
        
        if Red == nil{
            return
        }
        let r = CGFloat(Red.value)
        let g = CGFloat(Green.value)
        let b = CGFloat(Blue.value)
        
        colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha:1)
    }

}

