//
//  ViewController.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITextFieldDelegate

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var on: UISwitch!
    
    // MARK: Text Field Delegate objects
    var zipcode = zipcodeDelegate()
    var dollar = dollarDelegate()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField1.delegate = zipcode
        self.textField2.delegate = dollar
        self.textField3.delegate = self
        
    }
   
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.on.isOn
    }


    // MARK: Text Field Delegate Methods

    @IBAction func switchOn(_ sender: UISwitch) {
        
                if sender.isOn == false{
                self.textField3.resignFirstResponder()
            }

        }
    
    }

