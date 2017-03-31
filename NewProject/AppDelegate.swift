//
//  AppDelegate.swift
//  NewProject
//
//  Created by Puja Kumari on 3/21/17.
//  Copyright © 2017 nineleaps. All rights reserved.
//

import UIKit
import Mixpanel
import Fabric
import Crashlytics
import ObjectMapper

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
        var window: UIWindow?
        var activityStreamViewController: UIViewController!
        var storyViewController: UIViewController!
        var fluidCardController: UIViewController!
        
        var storyAccountType: String = ""
        
        func application(application: UIApplication, didFinishLaunchingWithOptions
            launchOptions: [NSObject: AnyObject]?) -> Bool {
            
            // Intialize all sdk's
            initializeSdks()
            return true
        }
        
        func applicationWillResignActive(application: UIApplication) {
           
           
        }
        
        func applicationDidEnterBackground(application: UIApplication) {
        }
        
        func applicationWillEnterForeground(application: UIApplication) {
        }
        
        func applicationDidBecomeActive(application: UIApplication) {
        }
        
        func applicationWillTerminate(application: UIApplication) {
        }
        
        func initializeSdks() {
            // Mixpanel Integration
            Mixpanel.initialize(token: kMixpanelToken)
            
      

}

}
