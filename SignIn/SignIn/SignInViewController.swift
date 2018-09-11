//
//  SignInViewController.swift
//  SignIn
//
//  Created by Anurita Srivastava on 31/01/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit
import Firebase
import  GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var signIn: GIDSignInButton!
 
    @IBOutlet weak var signOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
       // GIDSignIn.sharedInstance().signInSilently()
        
        signIn.style = .wide
        toggle()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //srivastava.anurita@gmail.com

    func toggle(){
    if GIDSignIn.sharedInstance().currentUser?.authentication == nil {
    // not signed in
        self.signIn.isHidden = false
        self.signOut.isHidden = true
    } else {
    //  Signed in
        self.signIn.isHidden = true
        self.signOut.isHidden = false
    }
    }

    
    @IBAction func didTapSignOut(sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
    }

    
   }
