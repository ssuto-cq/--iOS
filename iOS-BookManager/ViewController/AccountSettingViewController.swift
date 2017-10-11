import UIKit
import APIKit
import Himotoki

class AccountSettingViewController: UIViewController {
    
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
    
    private let confirmLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.confirmpass()
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
    
    private lazy var confirmTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.string.localizable.confirmpassInput()
        textField.setTextField()
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.string.localizable.accountsetting()
        
        //閉じるボタンの追加
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeModal))
        navigationItem.setLeftBarButtonItems([closeButton], animated: true)
        
        //保存ボタンの追加
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(tappedSaveButton))
        navigationItem.setRightBarButtonItems([saveButton], animated: true)
        
        view.addSubview(addressLabel)
        view.addSubview(passwordLabel)
        view.addSubview(confirmLabel)
        view.addSubview(addressTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmTextField)
        
        layout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc private func closeModal() {
        dismiss(animated: true, completion: nil)
    }
    //保存ボタンを押した時の処理
    @objc private func tappedSaveButton() {
        let email = addressTextField.text!
        let password = passwordTextField.text!
        let check = confirmTextField.text!
        let request = SignUpRequest(email: email, password: password)
        
        if password == check {
            Session.send(request){result in
                switch result{
                case.success(let response):
                    print(response)
                    UserDefaults.standard.set(response.id, forKey: "id")
                    UserDefaults.standard.set(response.email, forKey: "email")
                    UserDefaults.standard.set(response.token, forKey: "token")
                    self.navigationController?.pushViewController(LoginViewController(), animated: true)
                case.failure(let error):
                    print(error)
                }
            }
        } else {
            AlertController.setAlert(target: self, title: R.string.localizable.alert(), message: R.string.localizable.message())
        }
        
    }
}

extension AccountSettingViewController: UITextFieldDelegate {
    
    private func layout() {
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
}
