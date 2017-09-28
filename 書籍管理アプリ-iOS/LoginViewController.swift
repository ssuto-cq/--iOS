import UIKit

class LoginViewController: UIViewController {
    
    fileprivate let addressLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.mailaddress()
        label.sizeToFit()
        return label
    }()
    
    fileprivate let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.password()
        label.sizeToFit()
        return label
    }()
    
    fileprivate lazy var addressTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = R.string.localizable.addressInput()
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textField.leftViewMode = .always//文字の左の余白
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        return textField
    }()
    
    fileprivate lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = R.string.localizable.passwordInput()
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        return textField
    }()
    
    fileprivate lazy var loginButton: UIButton = {
        let button = UIButton()
        let loginTitle = R.string.localizable.login()
        button.setTitle(loginTitle, for:UIControlState.normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 24)
        button.backgroundColor = UIColor.init(red:0.9, green: 0.9, blue: 0.9, alpha: 1)
        button.layer.position = CGPoint(x:self.view.frame.width/2, y:200)
        button.addTarget(self, action: #selector(LoginViewController.loginTapped(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = R.string.localizable.booksview()
        
        view.addSubview(addressLabel)
        view.addSubview(passwordLabel)
        view.addSubview(addressTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        layout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loginTapped(sender: UIButton) {
        let booksViewController: BooksViewController = BooksViewController()
        navigationController?.pushViewController(booksViewController, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func layout() {
        
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
}
