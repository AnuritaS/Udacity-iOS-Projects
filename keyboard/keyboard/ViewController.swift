//
//  ViewController.swift
//  keyboard
//
//  Created by Anurita Srivastava on 05/01/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate{
    
    @IBOutlet weak var ui: UIImageView!
    
    @IBOutlet weak var top: UITextField!
    @IBOutlet weak var bottomText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bottomText.delegate = self
        self.top.delegate = self
         print(self.view.frame.origin.y)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotification()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        unsubscribeFromKeyboardNotification()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        ui.image = image
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func keyboardWillShow(_ notification: NSNotification){
        
        self.view.frame.origin.y -=  keyboardHeight(notification)
        print(self.view.frame.origin.y)
    }
    
    func keyboardHeight(_ notification: NSNotification)-> CGFloat{
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    
    func keyboardWillHide(_ notification:NSNotification){
        
        self.view.frame.origin.y += keyboardHeight(notification)
         print(self.view.frame.origin.y)
        
    }
    
    func subscribeToKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotification(){
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
       NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)    }
    
    func textFieldShouldReturn(_ textfield: UITextField!){
       textfield.resignFirstResponder()
        
    }
}

