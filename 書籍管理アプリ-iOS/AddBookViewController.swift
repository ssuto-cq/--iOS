import UIKit

class AddBookViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    fileprivate var bookImageView: UIImageView! = {
        let image = UIImage(named: "noimage.png")
        let imageView = UIImageView(image:image)
        return imageView
    }()
    
    fileprivate let imageButton: UIButton = {
        let button = UIButton()
        let addImageTitle = R.string.localizable.addimage()
        button.setTitle(addImageTitle, for:UIControlState.normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font =  UIFont.systemFont(ofSize: 12)
        button.backgroundColor = UIColor.init(red:0.9, green: 0.9, blue: 0.9, alpha: 1)
        button.addTarget(self, action: #selector(choosePicture), for: .touchUpInside)
        return button
    }()
    
    fileprivate let bookNameLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.booktitle()
        label.sizeToFit()
        return label
    }()
    
    fileprivate let priceLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.pricetitle()
        label.sizeToFit()
        return label
    }()
    
    fileprivate let dateLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.datetitle()
        label.sizeToFit()
        return label
    }()
    
    fileprivate lazy var bookNameTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = ""
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textField.leftViewMode = .always//文字の左の余白
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        return textField
    }()
    
    fileprivate lazy var priceTextField: UITextField = {
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = ""
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textField.leftViewMode = .always//文字の左の余白
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        return textField
    }()
    
    fileprivate lazy var datePickerTextField: UITextField = {
        var textField = UITextField()
        textField = UISetting()
        textField.delegate = self
        textField.placeholder = ""
        textField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        textField.leftViewMode = .always//文字の左の余白
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.string.localizable.addbook()
        
        //UISetting()
        //閉じるボタンの追加
        let closeButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(self.closeModal))
        navigationItem.setLeftBarButtonItems([closeButton], animated: true)
        //保存ボタンの追加
        let saveButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.save, target: self, action: nil)
        navigationItem.setRightBarButtonItems([saveButton], animated: true)
        
        view.addSubview(bookImageView)
        view.addSubview(imageButton)
        view.addSubview(bookNameLabel)
        view.addSubview(priceLabel)
        view.addSubview(dateLabel)
        view.addSubview(bookNameTextField)
        view.addSubview(priceTextField)
        view.addSubview(datePickerTextField)
        
        layout()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //モーダル画面を閉じる処理
    func closeModal(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //ピッカー外タッチで閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //カメラロールから写真を選択
    func choosePicture() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerView = UIImagePickerController()
            
            pickerView.delegate = self
            pickerView.sourceType = .photoLibrary
            
            present(pickerView, animated: true, completion: nil)
            
        }
    }
    
    //写真を選んだ後の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        bookImageView.image = image
        dismiss(animated: true)
    }
    
}

extension AddBookViewController:UITextFieldDelegate {
    
    func layout() {
        
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        bookNameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        bookNameTextField.translatesAutoresizingMaskIntoConstraints = false
        priceTextField.translatesAutoresizingMaskIntoConstraints = false
        datePickerTextField.translatesAutoresizingMaskIntoConstraints = false
        
        //画像のレイアウト
        bookImageView.topAnchor.constraint(equalTo:self.view.topAnchor, constant:80).isActive = true
        bookImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:30).isActive = true
        bookImageView.widthAnchor.constraint(equalToConstant:120).isActive = true
        bookImageView.heightAnchor.constraint(equalToConstant:150).isActive = true
        
        //画像添付ボタンのレイアウト
        imageButton.centerYAnchor.constraint(equalTo: bookImageView.centerYAnchor).isActive = true
        imageButton.leadingAnchor.constraint(equalTo: bookImageView.leadingAnchor, constant:150).isActive = true
        
        //ラベルのレイアウト
        bookNameLabel.centerYAnchor.constraint(equalTo: bookNameTextField.centerYAnchor, constant:-30).isActive = true
        bookNameLabel.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant:50).isActive = true
        
        priceLabel.centerYAnchor.constraint(equalTo: priceTextField.centerYAnchor, constant:-30).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: bookNameLabel.leadingAnchor).isActive = true
        
        dateLabel.centerYAnchor.constraint(equalTo: datePickerTextField.centerYAnchor, constant:-30).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: bookNameLabel.leadingAnchor).isActive = true
        
        //入力欄のレイアウト
        bookNameTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        bookNameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        bookNameTextField.widthAnchor.constraint(equalToConstant: 220).isActive = true
        bookNameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        priceTextField.centerYAnchor.constraint(equalTo: bookNameTextField.centerYAnchor, constant:100).isActive = true
        priceTextField.centerXAnchor.constraint(equalTo: bookNameTextField.centerXAnchor).isActive = true
        priceTextField.widthAnchor.constraint(equalToConstant: 220).isActive = true
        priceTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        datePickerTextField.centerYAnchor.constraint(equalTo: bookNameTextField.centerYAnchor, constant:200).isActive = true
        datePickerTextField.centerXAnchor.constraint(equalTo: bookNameTextField.centerXAnchor).isActive = true
        datePickerTextField.widthAnchor.constraint(equalToConstant: 220).isActive = true
        datePickerTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
