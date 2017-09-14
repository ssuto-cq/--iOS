//
//  ViewController.swift
//  書籍管理アプリ-iOS
//
//  Created by 須藤 翔太 on 2017/09/07.
//  Copyright © 2017年 須藤 翔太. All rights reserved.
//

import UIKit

class LoginScene: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title="書籍一覧"

        let addressLabel=UILabel()
        let passwordLabel=UILabel()
        let addressInput=UITextField()
        let passwordInput=UITextField()
        let loginButton=UIButton()

        //メールアドレスラベルの設定
        addressLabel.text="メールアドレス"
        addressLabel.sizeToFit()
        self.view.addSubview(addressLabel)

        //パスワードラベルの設定
        passwordLabel.text="パスワード"
        passwordLabel.sizeToFit()
        self.view.addSubview(passwordLabel)

        //メールアドレス入力欄の設定
        addressInput.delegate = self
        addressInput.placeholder = "メールアドレスを入力"
        addressInput.backgroundColor = UIColor(white: 0.9, alpha: 1)
        addressInput.leftViewMode = .always//文字の左の余白
        addressInput.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        addressInput.clearButtonMode = .always
        addressInput.returnKeyType = .done
        self.view.addSubview(addressInput)

        //パスワード入力欄の設定
        passwordInput.delegate = self
        passwordInput.placeholder = "パスワードを入力"
        passwordInput.backgroundColor = UIColor(white: 0.9, alpha: 1)
        passwordInput.leftViewMode = .always
        passwordInput.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        passwordInput.clearButtonMode = .always
        passwordInput.returnKeyType = .done
        self.view.addSubview(passwordInput)

        //ログインボタンの設定
        loginButton.setTitle("ログイン", for:UIControlState.normal)
        loginButton.setTitleColor(UIColor.lightGray, for: .normal)
        loginButton.titleLabel?.font =  UIFont.systemFont(ofSize: 24)
        loginButton.backgroundColor = UIColor.init(red:0.9, green: 0.9, blue: 0.9, alpha: 1)
        loginButton.layer.position=CGPoint(x:self.view.frame.width/2, y:200)
        loginButton.addTarget(self, action: #selector(LoginScene.loginTapped(sender:)), for: .touchUpInside)
        self.view.addSubview(loginButton)

        //画面のレイアウト
        addressLabel.translatesAutoresizingMaskIntoConstraints=false
        passwordLabel.translatesAutoresizingMaskIntoConstraints=false
        addressInput.translatesAutoresizingMaskIntoConstraints=false
        passwordInput.translatesAutoresizingMaskIntoConstraints=false
        loginButton.translatesAutoresizingMaskIntoConstraints=false

        addressLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:35).isActive=true
        addressLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant:250).isActive=true

        passwordLabel.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor).isActive=true
        passwordLabel.topAnchor.constraint(equalTo: addressLabel.topAnchor, constant:100).isActive=true

        addressInput.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        addressInput.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive=true
        addressInput.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:0.8).isActive=true

        passwordInput.centerXAnchor.constraint(equalTo: addressInput.centerXAnchor).isActive=true
        passwordInput.topAnchor.constraint(equalTo: addressInput.topAnchor, constant:100.0).isActive=true
        passwordInput.widthAnchor.constraint(equalTo: addressInput.widthAnchor).isActive=true

        loginButton.centerXAnchor.constraint(equalTo: addressInput.centerXAnchor).isActive=true
        loginButton.topAnchor.constraint(equalTo: addressInput.topAnchor, constant:150.0).isActive=true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    internal func loginTapped(sender: UIButton) {
        let booksViewScene: BooksViewScene = BooksViewScene()
        self.navigationController?.pushViewController(booksViewScene, animated: true)
        }

}
