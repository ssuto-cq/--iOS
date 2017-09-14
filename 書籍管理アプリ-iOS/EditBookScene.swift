//
//  EditBookScene.swift
//  書籍管理アプリ-iOS
//
//  Created by 須藤 翔太 on 2017/09/11.
//  Copyright © 2017年 須藤 翔太. All rights reserved.
//

import UIKit

class EditBookScene: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var bookImage: UIImage!
    var bookImageView: UIImageView!
    let imageButton=UIButton()
    let bookNameLabel=UILabel()
    let priceLabel=UILabel()
    let dateLabel=UILabel()
    let bookNameInput=UITextField()
    let priceInput=UITextField()
    let datePickerInput=UITextField()

    let datePicker=UIDatePicker()
    let dateFormat=DateFormatter()

    //書籍情報の受け取り
    var titles: String = ""
    var price: String = ""
    var date: String = ""
    var image: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title=NSLocalizedString("editbook", comment: "")

        //閉じるボタンの追加
        let closeButton: UIBarButtonItem=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(backBooksView))
        self.navigationItem.setLeftBarButtonItems([closeButton], animated: true)

        //保存ボタンの追加
        let saveButton: UIBarButtonItem=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.save, target: self, action: nil)
        self.navigationItem.setRightBarButtonItems([saveButton], animated: true)

        //書籍画像の設定
        bookImage=UIImage(named:image)
        bookImageView=UIImageView(image:bookImage)
        self.view.addSubview(bookImageView)

        //画像添付ボタンの設定
        let addImageTitle=NSLocalizedString("addimage", comment: "")
        imageButton.setTitle(addImageTitle, for:UIControlState.normal)
        imageButton.setTitleColor(UIColor.lightGray, for: .normal)
        imageButton.titleLabel?.font =  UIFont.systemFont(ofSize: 12)
        imageButton.backgroundColor = UIColor.init(red:0.9, green: 0.9, blue: 0.9, alpha: 1)
        imageButton.addTarget(self, action: #selector(choosePicture), for: .touchUpInside)

        self.view.addSubview(imageButton)

        //書籍名ラベルの設定
        bookNameLabel.text=R.string.localizable.booktitle()
        bookNameLabel.sizeToFit()
        self.view.addSubview(bookNameLabel)

        //金額ラベルの設定
        priceLabel.text=R.string.localizable.pricetitle()
        priceLabel.sizeToFit()
        self.view.addSubview(priceLabel)

        //購入日ラベルの設定
        dateLabel.text=R.string.localizable.datetitle()
        dateLabel.sizeToFit()
        self.view.addSubview(dateLabel)

        //書籍名入力欄の設定
        bookNameInput.delegate = self
        bookNameInput.placeholder = titles
        bookNameInput.backgroundColor = UIColor(white: 0.9, alpha: 1)
        bookNameInput.leftViewMode = .always//文字の左の余白
        bookNameInput.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        bookNameInput.clearButtonMode = .always
        bookNameInput.returnKeyType = .done
        self.view.addSubview(bookNameInput)

        //金額入力欄の設定
        priceInput.delegate = self
        priceInput.placeholder = price
        priceInput.backgroundColor = UIColor(white: 0.9, alpha: 1)
        priceInput.leftViewMode = .always//文字の左の余白
        priceInput.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        priceInput.clearButtonMode = .always
        priceInput.returnKeyType = .done
        self.view.addSubview(priceInput)

        datePickerInput.delegate = self
        datePickerInput.placeholder = date
        datePickerInput.backgroundColor = UIColor(white: 0.9, alpha: 1)
        datePickerInput.leftViewMode = .always//文字の左の余白
        datePickerInput.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        datePickerInput.clearButtonMode = .always
        datePickerInput.returnKeyType = .done
        self.view.addSubview(datePickerInput)

        //デートピッカーの表示
        datePicker.datePickerMode=UIDatePickerMode.date
        datePicker.locale=NSLocale(localeIdentifier:"ja_JP") as Locale
        datePickerInput.inputView=datePicker

        dateFormat.dateFormat="yyyy年MM月dd日"
        self.datePickerInput.delegate=self

        let pickerToolBar = UIToolbar(frame: CGRect(x:0, y:30, width:self.view.frame.size.width, height: 40.0))
        pickerToolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        let spaceBarBtn=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)        
        let finishTitle=NSLocalizedString("finish", comment: "")
        let toolBarBtn=UIBarButtonItem(title: finishTitle, style: .done, target: self, action: #selector(toolBarBtnPush))

        pickerToolBar.items=[spaceBarBtn, toolBarBtn]
        datePickerInput.inputAccessoryView=pickerToolBar

        ////全体のレイアウト////
        bookImageView.translatesAutoresizingMaskIntoConstraints=false
        imageButton.translatesAutoresizingMaskIntoConstraints=false
        bookNameLabel.translatesAutoresizingMaskIntoConstraints=false
        priceLabel.translatesAutoresizingMaskIntoConstraints=false
        dateLabel.translatesAutoresizingMaskIntoConstraints=false
        bookNameInput.translatesAutoresizingMaskIntoConstraints=false
        priceInput.translatesAutoresizingMaskIntoConstraints=false
        datePickerInput.translatesAutoresizingMaskIntoConstraints=false

        //画像のレイアウト
        bookImageView.topAnchor.constraint(equalTo:self.view.topAnchor, constant:80).isActive=true
        bookImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:30).isActive=true
        bookImageView.widthAnchor.constraint(equalToConstant:120).isActive=true
        bookImageView.heightAnchor.constraint(equalToConstant:150).isActive=true

        //画像添付ボタンのレイアウト
        imageButton.centerYAnchor.constraint(equalTo: bookImageView.centerYAnchor).isActive=true
        imageButton.leadingAnchor.constraint(equalTo: bookImageView.leadingAnchor, constant:150).isActive=true

        //ラベルのレイアウト
        bookNameLabel.centerYAnchor.constraint(equalTo: bookNameInput.centerYAnchor, constant:-30).isActive=true
        bookNameLabel.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant:50).isActive=true

        priceLabel.centerYAnchor.constraint(equalTo: priceInput.centerYAnchor, constant:-30).isActive=true
        priceLabel.leadingAnchor.constraint(equalTo: bookNameLabel.leadingAnchor).isActive=true

        dateLabel.centerYAnchor.constraint(equalTo: datePickerInput.centerYAnchor, constant:-30).isActive=true
        dateLabel.leadingAnchor.constraint(equalTo: bookNameLabel.leadingAnchor).isActive=true

        //入力欄のレイアウト
        bookNameInput.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive=true
        bookNameInput.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        bookNameInput.widthAnchor.constraint(equalToConstant: 220).isActive=true
        bookNameInput.heightAnchor.constraint(equalToConstant: 30).isActive=true

        priceInput.centerYAnchor.constraint(equalTo: bookNameInput.centerYAnchor, constant:100).isActive=true
        priceInput.centerXAnchor.constraint(equalTo: bookNameInput.centerXAnchor).isActive=true
        priceInput.widthAnchor.constraint(equalToConstant: 220).isActive=true
        priceInput.heightAnchor.constraint(equalToConstant: 30).isActive=true

        datePickerInput.centerYAnchor.constraint(equalTo: bookNameInput.centerYAnchor, constant:200).isActive=true
        datePickerInput.centerXAnchor.constraint(equalTo: bookNameInput.centerXAnchor).isActive=true
        datePickerInput.widthAnchor.constraint(equalToConstant: 220).isActive=true
        datePickerInput.heightAnchor.constraint(equalToConstant: 30).isActive=true

            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //書籍一覧へ戻る処理
    func backBooksView() {
        self.navigationController?.popViewController(animated: true)
    }

    //デートピッカーを閉じる処理
    func toolBarBtnPush(sender: UIBarButtonItem) {

        let pickerDate = datePicker.date
        print(pickerDate)
        datePickerInput.text = dateFormat.string(from:pickerDate)

        self.view.endEditing(true)
    }

    //カメラロールから写真を選択
    func choosePicture() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerView=UIImagePickerController()

            pickerView.delegate=self
            pickerView.sourceType = UIImagePickerControllerSourceType .photoLibrary

            self.present(pickerView, animated: true, completion: nil)

        }
    }

    //写真を選んだ後の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image=info[UIImagePickerControllerOriginalImage] as! UIImage
        self.bookImageView.image=image
        self.dismiss(animated: true)
    }

}
