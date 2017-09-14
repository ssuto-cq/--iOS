//
//  AppDelegate.swift
//  書籍管理アプリ-iOS
//
//  Created by 須藤 翔太 on 2017/09/07.
//  Copyright © 2017年 須藤 翔太. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window=UIWindow(frame:UIScreen.main.bounds)
        window?.backgroundColor=UIColor.white
        window?.makeKeyAndVisible()

        let userDefault = UserDefaults.standard
        let dict = ["firstLaunch": true]

        userDefault.register(defaults: dict)

        if userDefault.bool(forKey: "firstLaunch") {

            userDefault.set(false, forKey: "firstLaunch")
            print("初回起動")
            self.window?.rootViewController = UINavigationController(rootViewController: AccountSettingScene())
        } else {
            print("2回目以降")
            self.window?.rootViewController=TabBarSetting()
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

}
