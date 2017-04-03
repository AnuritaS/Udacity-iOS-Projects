//
//  zipcodeDelegate.swift
//  TextFields
//
//  Created by Anurita Srivastava on 27/12/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import Foundation
import UIKit

class zipcodeDelegate: NSObject,UITextFieldDelegate {

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        if newText.length > 5{
            return false
        }else{
         return true
        }
    }
    
}
