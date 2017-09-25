import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = R.string.localizable.booksview()

        let addressLabel = UILabel()
        let passwordLabel = UILabel()
        let addressTextField = UITextField()
        let passwordTextField = UITextField()
        let loginButton = UIButton()

        //メールアドレスラベルの設定
        addressLabel.text = R.string.localizable.mailaddress()
        addressLabel.sizeToFit()
        self.view.addSubview(addressLabel)

        //パスワードラベルの設定
        passwordLabel.text = R.string.localizable.password()
        passwordLabel.sizeToFit()
        self.view.addSubview(passwordLabel)

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

        //ログインボタンの設定
        let loginTitle = R.string.localizable.login()
        loginButton.setTitle(loginTitle, for:UIControlState.normal)
        loginButton.setTitleColor(UIColor.lightGray, for: .normal)
        loginButton.titleLabel?.font =  UIFont.systemFont(ofSize: 24)
        loginButton.backgroundColor = UIColor.init(red:0.9, green: 0.9, blue: 0.9, alpha: 1)
        loginButton.layer.position = CGPoint(x:self.view.frame.width/2, y:200)
        loginButton.addTarget(self, action: #selector(LoginViewController.loginTapped(sender:)), for: .touchUpInside)
        self.view.addSubview(loginButton)

        //画面のレイアウト
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        addressTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        addressLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:35).isActive = true
        addressLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant:250).isActive = true

        passwordLabel.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: addressLabel.topAnchor, constant:100).isActive = true

        addressTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        addressTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        addressTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:0.8).isActive = true

        passwordTextField.centerXAnchor.constraint(equalTo: addressTextField.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: addressTextField.topAnchor, constant:100.0).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: addressTextField.widthAnchor).isActive = true

        loginButton.centerXAnchor.constraint(equalTo: addressTextField.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: addressTextField.topAnchor, constant:150.0).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    internal func loginTapped(sender: UIButton) {
        let booksViewScene: BooksViewController = BooksViewController()
        self.navigationController?.pushViewController(booksViewScene, animated: true)
        }

}
