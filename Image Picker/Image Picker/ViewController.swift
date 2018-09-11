//
//  ViewController.swift
//  Image Picker
//
//  Created by Anurita Srivastava on 25/12/16.
//  Copyright © 2016 Anurita Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate{

   
    
    @IBOutlet weak var ui: UIImageView!
    
    @IBOutlet weak var top: UITextField!
    
    @IBOutlet weak var bottom: UITextField!
    
    
    @IBOutlet weak var cam: UIBarButtonItem!
    @IBOutlet weak var share: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bottom.delegate = self
        self.top.delegate = self
        attributeChange()
        top.text = "UPPER TEXT"
        bottom.text = "BOTTOM TEXT"
        top.textAlignment = .center
        bottom.textAlignment = .center
        cam.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        share.isEnabled = (ui.image != nil)
        self.navigationController?.toolbar.isHidden = true
    }        // Do any additional setup after loading the view, typically from a nib.
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeToKeyboardNotification()
         share.isEnabled = (ui.image != nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        unsubscribeFromKeyboardNotification()
    }
    
    
    @IBAction func experiment(){
        
    let imagevc = UIImagePickerController()
     imagevc.delegate = self
        imagevc.sourceType = .photoLibrary
        self.present(imagevc, animated: true, completion: nil)
    }
    
    @IBAction func camExperiment(){
        
        let camimage = UIImagePickerController()
        camimage.delegate = self
       camimage.sourceType = .camera
        present(camimage, animated: true, completion: nil)
    
}

    func attributeChange(){
        let memeAttributes:[String:Any]=[
            NSStrokeColorAttributeName : UIColor.black,
            NSForegroundColorAttributeName : UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)!,
        NSStrokeWidthAttributeName : -7.0,
        ]
        top.defaultTextAttributes = memeAttributes
        bottom.defaultTextAttributes = memeAttributes
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
    }
    
    func keyboardHeight(_ notification: NSNotification)-> CGFloat{
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    
    func keyboardWillHide(_ notification:NSNotification){
        self.view.frame.origin.y += keyboardHeight(notification)
    }
    
    func subscribeToKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotification(){
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)    }
    
    func textFieldShouldReturn(_ textfield: UITextField!)-> Bool{
        textfield.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "UPPER TEXT" || textField.text == "BOTTOM TEXT"{
       textField.text = ""
    }
    }
    
    func generateMemedImage()-> UIImage{
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return memedImage
    }
    
    @IBAction func shareImage(_ sender: AnyObject) {
        
     let controller = UIActivityViewController(activityItems: [generateMemedImage()], applicationActivities: nil)
        controller.completionWithItemsHandler = {
            (activityType: UIActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) -> Void in
            if completed == true {
                self.save()
            }
        }
          present(controller, animated: true, completion: nil)
        
    }
        func save(){
        
        let meme = Meme(topText: top.text!, bottomText: bottom.text!, image: ui.image!, memedImage: generateMemedImage())
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.memes.append(meme)
            
    }

    
}
