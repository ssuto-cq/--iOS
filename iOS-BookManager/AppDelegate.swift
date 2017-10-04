import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame:UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()

        let userDefault = UserDefaults.standard
        let dict = ["firstLaunch": true]

        userDefault.register(defaults: dict)

        if userDefault.bool(forKey: "firstLaunch") {

            userDefault.set(false, forKey: "firstLaunch")
            print("初回起動")
            window?.rootViewController = UINavigationController(rootViewController: AccountSettingViewController())
        } else {
            print("2回目以降")
            window?.rootViewController = TabBarController()
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