import UIKit

class EditBookViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var bookImage: UIImage!
    var bookImageView: UIImageView!
    let imageButton = UIButton()
    let bookNameLabel = UILabel()
    let priceLabel = UILabel()
    let dateLabel = UILabel()
    let bookNameTextField = UITextField()
    let priceTextField = UITextField()
    var datePickerTextField = UITextField()

    var book: Book! {
        didSet {
            bookNameTextField.text = book.name
            priceTextField.text = String(book.price)
            datePickerTextField.text = book.boughtDate
            print(datePickerTextField)
            bookImage = UIImage(named: book.imagePath)!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = NSLocalizedString("editbook", comment: "")
        
        //閉じるボタンの追加
        let closeButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(backBooksView))
        self.navigationItem.setLeftBarButtonItems([closeButton], animated: true)

        //保存ボタンの追加
        let saveButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.save, target: self, action: nil)
        self.navigationItem.setRightBarButtonItems([saveButton], animated: true)

        //書籍画像の設定
        bookImageView = UIImageView(image:bookImage)
        self.view.addSubview(bookImageView)

        //画像添付ボタンの設定
        let addImageTitle = NSLocalizedString("addimage", comment: "")
        imageButton.setTitle(addImageTitle, for:UIControlState.normal)
        imageButton.setTitleColor(UIColor.lightGray, for: .normal)
        imageButton.titleLabel?.font =  UIFont.systemFont(ofSize: 12)
        imageButton.backgroundColor = UIColor.init(red:0.9, green: 0.9, blue: 0.9, alpha: 1)
        imageButton.addTarget(self, action: #selector(choosePicture), for: .touchUpInside)

        self.view.addSubview(imageButton)

        //書籍名ラベルの設定
        bookNameLabel.text = R.string.localizable.booktitle()
        bookNameLabel.sizeToFit()
        self.view.addSubview(bookNameLabel)

        //金額ラベルの設定
        priceLabel.text = R.string.localizable.pricetitle()
        priceLabel.sizeToFit()
        self.view.addSubview(priceLabel)

        //購入日ラベルの設定
        dateLabel.text = R.string.localizable.datetitle()
        dateLabel.sizeToFit()
        self.view.addSubview(dateLabel)

        //書籍名入力欄の設定
        bookNameTextField.delegate = self
        bookNameTextField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        bookNameTextField.leftViewMode = .always//文字の左の余白
        bookNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        bookNameTextField.clearButtonMode = .always
        bookNameTextField.returnKeyType = .done
        self.view.addSubview(bookNameTextField)

        //金額入力欄の設定
        priceTextField.delegate = self
        priceTextField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        priceTextField.leftViewMode = .always//文字の左の余白
        priceTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        priceTextField.clearButtonMode = .always
        priceTextField.returnKeyType = .done
        self.view.addSubview(priceTextField)
        //
        datePickerTextField = Util()
        datePickerTextField.delegate = self
        datePickerTextField.backgroundColor = UIColor(white: 0.9, alpha: 1)
        datePickerTextField.leftViewMode = .always//文字の左の余白
        datePickerTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        datePickerTextField.clearButtonMode = .always
        datePickerTextField.returnKeyType = .done
        self.view.addSubview(datePickerTextField)

        ////全体のレイアウト////
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
        priceLabel.leadingAnchor.constraint(equalTo: bookNameLabel.leadingAnchor).isActive=true

        dateLabel.centerYAnchor.constraint(equalTo: datePickerTextField.centerYAnchor, constant:-30).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: bookNameLabel.leadingAnchor).isActive=true

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //書籍一覧へ戻る処理
    func backBooksView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //ピッカー外タッチで閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    //カメラロールから写真を選択
    func choosePicture() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerView = UIImagePickerController()

            pickerView.delegate = self
            pickerView.sourceType = .photoLibrary

            self.present(pickerView, animated: true, completion: nil)

        }
    }

    //写真を選んだ後の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.bookImageView.image = image
        self.dismiss(animated: true)
    }

}
