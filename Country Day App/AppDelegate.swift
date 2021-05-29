//
//  AppDelegate.swift
//  Country Day App
//
//  Created by Nigel Denny on 1/18/18.
//  Copyright © 2018 Switch Tech. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import GoogleSignIn
import TwitterKit
import OneSignal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    var databaseRef: DatabaseReference!
    var i = 0
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false]
        
        // Replace 'YOUR_APP_ID' with your OneSignal App ID.
        OneSignal.initWithLaunchOptions(launchOptions,
                                        appId: "0d71698d-c160-45d7-9dfc-ca0b4eba2a60",
                                        handleNotificationAction: nil,
                                        settings: onesignalInitSettings)
        
        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;
        
        // Recommend moving the below line to prompt for push after informing the user about
        //   how your app will use them.
        OneSignal.promptForPushNotifications(userResponse: { accepted in
            print("User accepted notifications: \(accepted)")
        })
        
        TWTRTwitter.sharedInstance().start(withConsumerKey:"3hl7beBPdXRCoOVJXXlCfwkuh", consumerSecret:"HcZtFrzfOYcYIma0TS7fYeG8GeDSC73DbG6Q9c3C63DNsA0aiA")
        // Override point for customization after application launch.
        FirebaseApp.configure()
        // Use Firebase library to configure APIs
        UIApplication.shared.statusBarStyle = .lightContent
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url,
                                                 sourceApplication: sourceApplication,
                                                 annotation: annotation)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if error != nil {

            let SplashViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeView2")
            let navController = UINavigationController(rootViewController: SplashViewController)
            self.window?.rootViewController = navController
            i = i + 1
            return
        }
        print("User signed into google")
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // ...
        
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                return
            }
            // User is signed in
            // ...
            print("User Signed into Firebase")
            
            self.databaseRef = Database.database().reference()
            
            self.databaseRef.child("user_profiles").child(user!.uid).observeSingleEvent(of: .value, with: { (snapshot) in
                
                let snapshot = snapshot.value as? NSDictionary
                
                if(snapshot == nil)
                {
                    self.databaseRef.child("user_profiles").child(user!.uid).child("name").setValue(user?.displayName)
                    self.databaseRef.child("user_profiles").child(user!.uid).child("email").setValue(user?.email)
                }
                else if(self.i == 0)
                {
                    let _: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
                
                    self.window?.rootViewController?.performSegue(withIdentifier: "HomeView", sender: nil)
                }
                else if(self.i == 1)
                {
                    let SplashViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeView")
                    let navController = UINavigationController(rootViewController: SplashViewController)
                    self.window?.rootViewController = navController
                }
            })
        }
    }
    
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
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

