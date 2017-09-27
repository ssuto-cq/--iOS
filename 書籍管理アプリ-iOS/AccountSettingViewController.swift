import UIKit

class AccountSettingViewController: UIViewController {
    
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
    
    fileprivate let confirmLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.confirmpass()
        label.sizeToFit()
        return label
    }()

    fileprivate let addressTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self as? UITextFieldDelegate
        textField.placeholder = R.string.localizable.addressInput()
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textField.leftViewMode = .always//文字の左の余白
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        return textField
    }()
    
    fileprivate let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self as? UITextFieldDelegate
        textField.placeholder = R.string.localizable.passwordInput()
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        return textField
    }()
    
    fileprivate let confirmTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self as? UITextFieldDelegate
        textField.placeholder = R.string.localizable.confirmpassInput()
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textField.leftViewMode = .always//文字の左の余白
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = R.string.localizable.accountsetting()

        //閉じるボタンの追加
        let closeButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(AddBookViewController.closeModal))
        self.navigationItem.setLeftBarButtonItems([closeButton], animated: true)

        //保存ボタンの追加
        let saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.save, target: self, action: #selector(self.saveButtonTapped(sender:)))
        self.navigationItem.setRightBarButtonItems([saveButton], animated: true)

        self.view.addSubview(addressLabel)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(confirmLabel)
        self.view.addSubview(addressTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(confirmTextField)

        layout()
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

extension AccountSettingViewController: UITextFieldDelegate {
    
    func layout() {
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
