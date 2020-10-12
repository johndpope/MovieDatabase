//
//  AppDelegate.swift
//  MovieDatabase
//
//  Created by ilkay sever on 10.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit
import IQKeyboardManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    static let shared = UIApplication.shared.delegate as! AppDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared().isEnabled = true
        return true
    }

    func setNewMovies() {
      UIView.transition(with: window!, duration: 0.5, options: .transitionCrossDissolve, animations: {
        UIView.performWithoutAnimation {
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let rootController = storyboard.instantiateViewController(withIdentifier: "MainTabbar") as! UITabBarController
          if let window = self.window{
            window.rootViewController = rootController
          }
        }
      }, completion: nil)
    }
}

