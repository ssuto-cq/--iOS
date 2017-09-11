//
//  EditBookScene.swift
//  書籍管理アプリ-iOS
//
//  Created by 須藤 翔太 on 2017/09/11.
//  Copyright © 2017年 須藤 翔太. All rights reserved.
//

import UIKit

class EditBookScene: AddBookScene{
    
    var addBookScene=AddBookScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="書籍編集"
        
        //タブバーの設定
        let tabBar=UITabBar()
        tabBar.delegate=self as? UITabBarDelegate
        tabBar.barTintColor=UIColor.gray
        let booksTab:UITabBarItem=UITabBarItem(title:"書籍一覧",image: nil, tag: 1)
        let settingTab:UITabBarItem=UITabBarItem(title:"設定",image: nil, tag: 2)
        tabBar.items=[booksTab,settingTab]
        self.view.addSubview(tabBar)
        
        tabBar.translatesAutoresizingMaskIntoConstraints=false
        tabBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive=true
        tabBar.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive=true
        tabBar.heightAnchor.constraint(equalToConstant: 50.0).isActive=true
        
        //UIの追加
        addBookScene.UISetting()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
