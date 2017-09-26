import UIKit

class AccountSettingViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = R.string.localizable.accountsetting()

        let addressLabel = UILabel()
        let passwordLabel = UILabel()
        let confirmLabel = UILabel()
        let addressTextField = UITextField()
        let passwordTextField = UITextField()
        let confirmTextField =  UITextField()

        //閉じるボタンの追加
        let closeButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(AddBookViewController.closeModal))
        self.navigationItem.setLeftBarButtonItems([closeButton], animated: true)

        //保存ボタンの追加
        let saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.save, target: self, action: #selector(self.saveButtonTapped(sender:)))
        self.navigationItem.setRightBarButtonItems([saveButton], animated: true)

        //メールアドレスラベルの設定
        addressLabel.text = R.string.localizable.mailaddress()
        addressLabel.sizeToFit()
        self.view.addSubview(addressLabel)

        //パスワードラベルの設定
        passwordLabel.text = R.string.localizable.password()
        passwordLabel.sizeToFit()
        self.view.addSubview(passwordLabel)

        //パスワード確認ラベルの設定
        confirmLabel.text = R.string.localizable.confirmpass()
        confirmLabel.sizeToFit()
        self.view.addSubview(confirmLabel)

        //メールアドレス入力欄の設定
        addressTextField.delegate = self
        addressTextField.placeholder = R.string.localizable.addressInput()
        addressTextField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        addressTextField.leftViewMode = .always//文字の左の余白
        addressTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        addressTextField.clearButtonMode = .always
        addressTextField.returnKeyType = .done
        self.view.addSubview(addressTextField)

        //パスワード入力欄の設定
        passwordTextField.delegate = self
        passwordTextField.placeholder = R.string.localizable.passwordInput()
        passwordTextField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        passwordTextField.leftViewMode = .always
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        passwordTextField.clearButtonMode = .always
        passwordTextField.returnKeyType = .done
        self.view.addSubview(passwordTextField)

        //パスワード確認入力欄の設定
        confirmTextField.delegate = self
        confirmTextField.placeholder = R.string.localizable.confirmpassInput()
        confirmTextField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        confirmTextField.leftViewMode = .always//文字の左の余白
        confirmTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        confirmTextField.clearButtonMode = .always
        confirmTextField.returnKeyType = .done
        self.view.addSubview(confirmTextField)

        //全体のレイアウト
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmLabel.translatesAutoresizingMaskIntoConstraints = false
        addressTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmTextField.translatesAutoresizingMaskIntoConstraints = false

        addressLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:35).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: addressTextField.topAnchor, constant:-10).isActive = true

        passwordLabel.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: addressLabel.topAnchor, constant:100).isActive = true

        confirmLabel.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor).isActive = true
        confirmLabel.topAnchor.constraint(equalTo: addressLabel.topAnchor, constant:200).isActive = true

        addressTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        addressTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant:120).isActive = true
        addressTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:0.8).isActive = true

        passwordTextField.centerXAnchor.constraint(equalTo: addressTextField.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: addressTextField.topAnchor, constant:100).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: addressTextField.widthAnchor).isActive = true

        confirmTextField.centerXAnchor.constraint(equalTo: addressTextField.centerXAnchor).isActive = true
        confirmTextField.topAnchor.constraint(equalTo: addressTextField.topAnchor, constant:200).isActive = true
        confirmTextField.widthAnchor.constraint(equalTo: addressTextField.widthAnchor).isActive = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func closeModal(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    //保存ボタンを押した時の処理
    func saveButtonTapped(sender: UITabBarItem) {
        //self.navigationController?.pushViewController(BooksViewScene(), animated: true)
        print("保存")
    }
}
