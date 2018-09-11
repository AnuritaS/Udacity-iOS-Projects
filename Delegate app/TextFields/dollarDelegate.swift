//
//  dollarDelegate.swift
//  TextFields
//
//  Created by Anurita Srivastava on 28/12/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation
import UIKit

class dollarDelegate: NSObject, UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var oldText = textField.text! as NSString
        var newText = oldText.replacingCharacters(in: range, with: string)
        var newTextString = String(newText)
        
        let digits = CharacterSet.decimalDigits
        var digitText = ""
        for c in (newTextString?.unicodeScalars)!{
            if digits.contains(UnicodeScalar(c.value)!){
            digitText.append("\(c)")
        }
        }
        
        if let pennies = Int(digitText){
            newText = "$"+dollarToString(pennies)+"."+centToString(pennies)
        }
        else{
            newText="$0.00"
        }
        
        textField.text = newText
        
        return false
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       if textField.text!.isEmpty{
            textField.text = "$0.00"
        
        }
    }
    
    func dollarToString(_ money:Int)->String{
        return String(money/100)
    }
    
    func centToString(_ money:Int)->String{
        let cent = money%100
        var centString = String(cent)
        if cent < 10{
            centString = "0"+centString
        }
        return centString
        }
    
}
    
    
    

