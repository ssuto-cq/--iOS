import UIKit
import APIKit

class LoginViewController: UIViewController {
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.mailaddress()
        label.sizeToFit()
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.password()
        label.sizeToFit()
        return label
    }()
    
    private lazy var addressTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.string.localizable.addressInput()
        textField.setTextField()
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.string.localizable.passwordInput()
        textField.setTextField()
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setButton()
        button.setTitle(R.string.localizable.login(), for: .normal)
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
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
    
    @objc private func tappedLoginButton() {
        let email = addressTextField.text!
        let password = passwordTextField.text!
        let request = LoginRequest(email: email, password: password)
        
        Session.send(request) {result in
            switch result{
            case.success(let response):
                print(response)
                print("ユーザー認証に成功しました。")
                UserDefaults.standard.set(response.id, forKey: "id")
                UserDefaults.standard.set(response.email, forKey: "email")
                UserDefaults.standard.set(response.token, forKey: "token")
                UIApplication.shared.keyWindow?.rootViewController = TabBarController()
            case.failure(let error):
                print(error)
                AlertController.setAlert(target: self, title: R.string.localizable.alert(), message: R.string.localizable.message())
            }
            
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    private func layout() {
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        addressTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        addressLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:35).isActive = true
        addressLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant:200).isActive = true
        
        passwordLabel.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: addressLabel.topAnchor, constant:100).isActive = true
        
        addressTextField.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor).isActive = true
        addressTextField.topAnchor.constraint(equalTo: addressLabel.topAnchor, constant: 30).isActive = true
        addressTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier:0.8).isActive = true
        
        passwordTextField.leadingAnchor.constraint(equalTo: addressLabel.leadingAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: 30).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: addressTextField.widthAnchor).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: addressLabel.topAnchor, constant: 250).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
