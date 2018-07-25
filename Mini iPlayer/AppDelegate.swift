//
//  AppDelegate.swift
//  Mini iPlayer
//
//  Created by William Robinson on 25/05/2018.
//  Copyright © 2018 William Robinson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let appDependencies = AppDependencies()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        appDependencies.installRootViewControllerIntoWindow(window!)
        return true
    }

}

