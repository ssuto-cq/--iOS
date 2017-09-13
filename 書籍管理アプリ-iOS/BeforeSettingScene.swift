//
//  AccountSettingScene.swift
//  書籍管理アプリ-iOS
//
//  Created by 須藤 翔太 on 2017/09/11.
//  Copyright © 2017年 須藤 翔太. All rights reserved.
//

import UIKit

class BeforeSettingScene: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title="設定"

        let settingButton=UIButton()

        settingButton.setTitle("アカウント設定", for:UIControlState.normal)
        settingButton.setTitleColor(UIColor.lightGray, for: .normal)
        settingButton.titleLabel?.font =  UIFont.systemFont(ofSize: 24)
        settingButton.backgroundColor = UIColor.init(red:0.9, green: 0.9, blue: 0.9, alpha: 1)
        settingButton.layer.position=CGPoint(x:self.view.frame.width/2, y:200)
        settingButton.addTarget(self, action: #selector(settingButtonTapped(sender:)), for: .touchUpInside)
        self.view.addSubview(settingButton)

        settingButton.translatesAutoresizingMaskIntoConstraints=false

        settingButton.topAnchor.constraint(equalTo:self.view.topAnchor, constant:120).isActive=true
        settingButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func settingButtonTapped(sender: UIButton) {
        let accountSettingScene=AccountSettingScene()
        let navi=UINavigationController(rootViewController: accountSettingScene)
        accountSettingScene.modalTransitionStyle=UIModalTransitionStyle.crossDissolve
        present(navi, animated: true, completion: nil)
    }
}
