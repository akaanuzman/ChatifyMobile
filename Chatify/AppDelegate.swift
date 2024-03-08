//
//  AppDelegate.swift
//  Chatify
//
//  Created by Kaan Uzman on 29/2/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        #warning("TODO: UIScreen.main is deprecated you should look this later")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let loginVC = LoginVC()
        let navigationController = UINavigationController(rootViewController: loginVC)
        window?.rootViewController = navigationController

        window?.backgroundColor = .systemBackground

        return true
    }
}
