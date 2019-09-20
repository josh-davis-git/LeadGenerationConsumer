//
//  AppDelegate.swift
//  Josh
//
//  Created by Joshua Davis on 11/10/17.
//  Copyright © 2017 Joshua Davis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    var window: UIWindow?
    
    // MARK: - Public API
    func showLogin() {
        let storyboard = UIStoryboard(name: Storyboards.main, bundle: Bundle.main)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: Identifiers.login)
        window?.rootViewController = loginViewController
    }

    // MARK: - UIApplicationDelegate
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if !Helpers.isLoggedIn() {
            //showLogin()
        }
        
        return true
    }

}
