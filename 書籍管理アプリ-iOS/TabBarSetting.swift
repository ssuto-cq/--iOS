
import UIKit

class TabBarSetting: UITabBarController, UITabBarControllerDelegate {

        override func viewDidLoad() {
        super.viewDidLoad()

        var navigationController: [UIViewController] = []

        //書籍一覧画面
        let booksViewScene = UINavigationController(rootViewController: BooksViewScene())
        let booksViewTitle = R.string.localizable.booksview()
        booksViewScene.tabBarItem = UITabBarItem(title:booksViewTitle, image:nil, tag: 1)
        navigationController.append(booksViewScene)//配列の要素を追加

        //設定前画面
        let beforeSettingScene = UINavigationController(rootViewController: BeforeSettingScene())
        let settingTitle = R.string.localizable.setting()
        beforeSettingScene.tabBarItem = UITabBarItem(title: settingTitle, image:nil, tag: 2)
        navigationController.append(beforeSettingScene)//配列の要素を追加

        self.delegate = self
        self.viewControllers = navigationController

    }

}
