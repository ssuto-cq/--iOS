import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var navViewControllers: [UIViewController] = []
        
        //書籍一覧画面
        let booksViewController = UINavigationController(rootViewController: BooksViewController())
        let booksViewTitle = R.string.localizable.booksview()
        booksViewController.tabBarItem = UITabBarItem(title:booksViewTitle, image:nil, tag: 1)
        navViewControllers.append(booksViewController)//配列の要素を追加
        
        //設定前画面
        let beforeSettingViewController = UINavigationController(rootViewController: BeforeSettingViewController())
        let settingTitle = R.string.localizable.setting()
        beforeSettingViewController.tabBarItem = UITabBarItem(title: settingTitle, image:nil, tag: 2)
        navViewControllers.append(beforeSettingViewController)//配列の要素を追加
        
        delegate = self
        viewControllers = navViewControllers
        
    }
    
}
