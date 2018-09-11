//
//  AppDelegate.swift
//  LibraryManagementSystem
//
//  Created by Anurita Srivastava on 11/09/18.
//  Copyright © 2018 Anurita Srivastava. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

let dataControl = DataController(modelName: "LibraryManagementSystem")
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupCoreData()
       
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
          self.saveContext()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack
    lazy var applicationDocumentsDirectory: URL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.appcoda.CoreDataDemo" in the application's documents Application Support directory.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1] as URL
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
      try? dataControl.viewContext.save()
    }
    
    func setupCoreData(){
        dataControl.load()
        
        var tabControl = window?.rootViewController as! UITabBarController
        var navControl1 = tabControl.viewControllers![0] as! UINavigationController
        var home1 = navControl1.topViewController as! BooksViewController
        var navControl2 = tabControl.viewControllers![1] as! UINavigationController
        var home2 = navControl2.topViewController as! StudentViewController
        home1.dataControl = dataControl
        home2.dataControl = dataControl
        
        let defaults = UserDefaults.standard
        let preloaded = defaults.bool(forKey: "isPreloaded")
        if !preloaded{
            preloadData()
            defaults.set(true, forKey: "isPreloaded")
        }
    }

}

