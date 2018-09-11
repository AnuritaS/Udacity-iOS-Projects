//
//  AppDelegate.swift
//  SignIn
//
//  Created by Anurita Srivastava on 31/01/17.
//  Copyright © 2017 Anurita Srivastava. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FIRApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
            
        return true
    }
    
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
        -> Bool {
            return GIDSignIn.sharedInstance().handle(url,
                                                        sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                        annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }

    func showprofileviewcontroller(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let controller = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        window!.rootViewController = UINavigationController(rootViewController: controller)
        
        
    }

    
func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?){
    // ...
    if (error == nil) {
        // Perform any operations on signed in user here.
        let userId = user.userID                  // For client-side use only!
        let idToken = user.authentication.idToken // Safe to send to the server
        let fullName = user.profile.name
        let givenName = user.profile.givenName
        let familyName = user.profile.familyName
        let email = user.profile.email
        // ...
        print(fullName)
        print(email)
        print(familyName)
        print(givenName)
    } else {
        print(error?.localizedDescription)
    }
    guard let authentication = user.authentication else { return }
    let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                      accessToken: authentication.accessToken)
    

    FIRAuth.auth()?.signIn(with: credential) { (user, error) in
    // ...
    if let error = error {
    print(error.localizedDescription)
    return
        
    }
        self.showprofileviewcontroller()
        

    }
    /*let firebaseAuth = FIRAuth.auth()
    do {
        try firebaseAuth?.signOut()
    } catch let signOutError as NSError {
        print ("Error signing out: %@", signOutError)
    }*/
    
       }
    
    
    
      

    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


