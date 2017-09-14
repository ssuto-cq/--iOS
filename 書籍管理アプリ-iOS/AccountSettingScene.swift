//
//  AccountSettingScene.swift
//  書籍管理アプリ-iOS
//
//  Created by 須藤 翔太 on 2017/09/12.
//  Copyright © 2017年 須藤 翔太. All rights reserved.
//

import UIKit

class AccountSettingScene: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title=NSLocalizedString("accountsetting", comment: "")

        let addressLabel=UILabel()
        let passwordLabel=UILabel()
        let confirmLabel=UILabel()
        let addressInput=UITextField()
        let passwordInput=UITextField()
        let confirmInput=UITextField()

        //閉じるボタンの追加
        let closeButton: UIBarButtonItem=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(AddBookScene.closeModalDialog))
        self.navigationItem.setLeftBarButtonItems([closeButton], animated: true)

        //保存ボタンの追加
        let saveButton: UIBarButtonItem=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.save, target: self, action: #selector(self.saveButtonTapped(sender:)))
        self.navigationItem.setRightBarButtonItems([saveButton], animated: true)

        //メールアドレスラベルの設定
        addressLabel.text=NSLocalizedString("mailaddress", comment: "")
        addressLabel.sizeToFit()
        self.view.addSubview(addressLabel)

        //パスワードラベルの設定
        passwordLabel.text=NSLocalizedString("password", comment: "")
        passwordLabel.sizeToFit()
        self.view.addSubview(passwordLabel)

        //パスワード確認ラベルの設定
        confirmLabel.text=NSLocalizedString("confirmpass", comment: "")
        confirmLabel.sizeToFit()
        self.view.addSubview(confirmLabel)

        //メールアドレス入力欄の設定
        addressInput.delegate = self
        addressInput.placeholder = NSLocalizedString("addressInput", comment: "")
        addressInput.backgroundColor = UIColor(white: 0.9, alpha: 1)
        addressInput.leftViewMode = .always//文字の左の余白
        addressInput.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        addressInput.clearButtonMode = .always
        addressInput.returnKeyType = .done
        self.view.addSubview(addressInput)

        //パスワード入力欄の設定
        passwordInput.delegate = self
        passwordInput.placeholder = NSLocalizedString("passwordInput", comment: "")
        passwordInput.backgroundColor = UIColor(white: 0.9, alpha: 1)
        passwordInput.leftViewMode = .always
        passwordInput.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        passwordInput.clearButtonMode = .always
        passwordInput.returnKeyType = .done
        self.view.addSubview(passwordInput)

        //パスワード確認入力欄の設定
        confirmInput.delegate = self
        confirmInput.placeholder = NSLocalizedString("confirmpassInput", comment: "")
        confirmInput.backgroundColor = UIColor(white: 0.9, alpha: 1)
        confirmInput.leftViewMode = .always//文字の左の余白
        confirmInput.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        confirmInput.clearButtonMode = .always
        confirmInput.returnKeyType = .done
        self.view.addSubview(confirmInput)

        //全体のレイアウト
        addressLabel.translatesAutoresizingMaskIntoConstraints=false
        passwordLabel.translatesAutoresizingMaskIntoConstraints=false
        confirmLabel.translatesAutoresizingMaskIntoConstraints=false
        addressInput.translatesAutoresizingMaskIntoConstraints=false
        passwordInput.translatesAutoresizingMaskIntoConstraints=false
        confirmInput.translatesAutoresizingMaskIntoConstraints=false

        addressLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:35).isActive=true
        addressLabel.bottomAnchor.constraint(equalTo: addressInput.topAnchor, constant:-10).isActive=true

        passwordLabel.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor).isActive=true
        passwordLabel.topAnchor.constraint(equalTo: addressLabel.topAnchor, constant:100).isActive=true

        confirmLabel.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor).isActive=true
        confirmLabel.topAnchor.constraint(equalTo: addressLabel.topAnchor, constant:200).isActive=true

        addressInput.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        addressInput.topAnchor.constraint(equalTo: self.view.topAnchor, constant:120).isActive=true
        addressInput.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:0.8).isActive=true

        passwordInput.centerXAnchor.constraint(equalTo: addressInput.centerXAnchor).isActive=true
        passwordInput.topAnchor.constraint(equalTo: addressInput.topAnchor, constant:100).isActive=true
        passwordInput.widthAnchor.constraint(equalTo: addressInput.widthAnchor).isActive=true

        confirmInput.centerXAnchor.constraint(equalTo: addressInput.centerXAnchor).isActive=true
        confirmInput.topAnchor.constraint(equalTo: addressInput.topAnchor, constant:200).isActive=true
        confirmInput.widthAnchor.constraint(equalTo: addressInput.widthAnchor).isActive=true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func closeModalDialog(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    //保存ボタンを押した時の処理
    func saveButtonTapped(sender: UITabBarItem) {
        self.navigationController?.pushViewController(BooksViewScene(), animated: true)
    }
}
