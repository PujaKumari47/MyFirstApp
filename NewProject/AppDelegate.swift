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
            
            // setup logging framework
            log.setup(
                .Verbose,
                showThreadName: true,
                showLogLevel: true,
                showFileNames: true,
                showLineNumbers: true,
                writeToFile: nil,
                fileLogLevel: .Verbose)
            
            // Intialize Crashlytics
            Fabric.with([Crashlytics.self])
            
            // Google analytics configuration
            // Configure tracker from GoogleService-Info.plist.
            var configureError: NSError?
            GGLContext.sharedInstance().configureWithError(&configureError)
            assert(configureError == nil, "Error configuring Google services: \(configureError)")
            
            // Optional: configure GAI options.
            let gai = GAI.sharedInstance()
            gai.trackUncaughtExceptions = true  // report uncaught exceptions
            gai.logger.logLevel = GAILogLevel.Warning  // remove before app release
        }



}

