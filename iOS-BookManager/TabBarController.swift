import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var navViewControllers: [UIViewController] = []
        
        //書籍一覧画面
        let booksVC = UINavigationController(rootViewController: BooksViewController())
        let booksViewTitle = R.string.localizable.booksview()
        booksVC.tabBarItem = UITabBarItem(title:booksViewTitle, image:nil, tag: 1)
        navViewControllers.append(booksVC)//配列の要素を追加
        
        //設定前画面
        let beforeSettingVC = UINavigationController(rootViewController: BeforeSettingViewController())
        let settingTitle = R.string.localizable.setting()
        beforeSettingVC.tabBarItem = UITabBarItem(title: settingTitle, image:nil, tag: 2)
        navViewControllers.append(beforeSettingVC)//配列の要素を追加
        
        viewControllers = navViewControllers
    }
}
