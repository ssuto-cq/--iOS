//
//  TabBarSetting.swift
//  書籍管理アプリ-iOS
//
//  Created by 須藤 翔太 on 2017/09/12.
//  Copyright © 2017年 須藤 翔太. All rights reserved.
//

import UIKit

class TabBarSetting: UITabBarController, UITabBarControllerDelegate {

        override func viewDidLoad() {
        super.viewDidLoad()

        var navigationController: [UIViewController]=[]

        //書籍一覧画面
        let booksViewScene=UINavigationController(rootViewController: BooksViewScene())
        let booksViewTitle=NSLocalizedString("booksview", comment: "")
        booksViewScene.tabBarItem=UITabBarItem(title:booksViewTitle, image:nil, tag: 1)
        navigationController.append(booksViewScene)//配列の要素を追加

        //設定前画面
        let beforeSettingScene=UINavigationController(rootViewController: BeforeSettingScene())
        let settingTitle=NSLocalizedString("setting", comment: "")
        beforeSettingScene.tabBarItem=UITabBarItem(title: settingTitle, image:nil, tag: 2)
        navigationController.append(beforeSettingScene)//配列の要素を追加

        self.delegate=self
        self.viewControllers=navigationController

    }

}
