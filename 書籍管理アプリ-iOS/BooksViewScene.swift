//
//  File.swift
//  書籍管理アプリ-iOS
//
//  Created by 須藤 翔太 on 2017/09/08.
//  Copyright © 2017年 須藤 翔太. All rights reserved.
//

import UIKit

class BooksViewScene: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let statusBarHeight=UIApplication.shared.statusBarFrame.height
    
    //本のタイトル、画像名、価格、日付
    let booksTitles:[String]=["超暇つぶし図鑑","せつない動物図鑑","浪費図鑑","冒険図鑑"]
    
    let booksImages:[String]=["himatubusi.jpg","animal.jpg","waste.jpg","adventure.jpg"]
    
    let booksPrice:[String]=["1000円","1100円","900円","1700円"]
    
    let booksDate:[String]=["2017/5/10","2017/7/20","2017/8/8","1985/6/20"]
    
    var selectedImage:UIImage?//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tableView=UITableView()
        let loadButton=UIButton()
        let tabBar=UITabBar()
        
        let addButton:UIBarButtonItem=UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(BooksViewScene.addButtonTapped))
        self.navigationItem.setRightBarButtonItems([addButton], animated: true)
        
        
        //テーブルビューの設定
        tableView.frame=CGRect(x:0,y:statusBarHeight,width:self.view.frame.width,height:self.view.frame.height-statusBarHeight)
        tableView.rowHeight=90
        tableView.delegate=self
        tableView.dataSource=self
        tableView.register(MyCell.self, forCellReuseIdentifier: NSStringFromClass(MyCell.self))//
        self.view.addSubview(tableView)
        
        //読み込みボタンの設定
        loadButton.setTitle("もっと読み込む,,,,,", for:UIControlState.normal)
        loadButton.setTitleColor(UIColor.lightGray, for: .normal)
        loadButton.titleLabel?.font =  UIFont.systemFont(ofSize: 24)
        loadButton.backgroundColor = UIColor.init(red:0.9, green: 0.9, blue: 0.9, alpha: 1)
        loadButton.layer.position=CGPoint(x:self.view.frame.width/2,y:200)
        self.view.addSubview(loadButton)
        
        //タブバーの設定
        tabBar.delegate=self as? UITabBarDelegate
        tabBar.barTintColor=UIColor.gray
        let booksTab:UITabBarItem=UITabBarItem(title:"書籍一覧",image: nil, tag: 1)
        let settingTab:UITabBarItem=UITabBarItem(title:"設定",image: nil, tag: 2)
        tabBar.items=[booksTab,settingTab]
        self.view.addSubview(tabBar)
        
        //画面のレイアウト
        tabBar.translatesAutoresizingMaskIntoConstraints=false
        loadButton.translatesAutoresizingMaskIntoConstraints=false
        
        loadButton.bottomAnchor.constraint(equalTo: tabBar.topAnchor).isActive=true
        loadButton.widthAnchor.constraint(equalTo: tabBar.widthAnchor ).isActive=true
        
        tabBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive=true
        tabBar.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive=true
        tabBar.heightAnchor.constraint(equalToConstant: 50.0).isActive=true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //追加ボタンの処理
    func addButtonTapped(){
        print("追加完了")
        let addBookScene=AddBookScene()
        let navi=UINavigationController(rootViewController: addBookScene)
        addBookScene.modalTransitionStyle=UIModalTransitionStyle.crossDissolve
        present(navi,animated: true,completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MyCell.self),for: indexPath) as! MyCell
        
        cell.booksTitlesUI.text=booksTitles[indexPath.row]
        cell.booksPriceUI.text=booksPrice[indexPath.row]
        cell.booksDateUI.text=booksDate[indexPath.row]
        cell.myImageView.image=UIImage(named: booksImages[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
    func tableView(_ tableView:UITableView,numberOfRowsInSection section:Int)->Int{
        return 4
    }
    
    //書籍編集画面への遷移処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let editBookScene=EditBookScene()
        let editBookScene=UINavigationController(rootViewController: EditBookScene())
        tableView.deselectRow(at: indexPath, animated: true)
        self.present(editBookScene, animated: true, completion: nil)
        
    }
        

}

//セルのカスタム
class MyCell:UITableViewCell{
    
    var booksTitlesUI:UILabel!
    var booksImagesUI:UIImage!
    var myImageView:UIImageView!
    var booksPriceUI:UILabel!
    var booksDateUI:UILabel!
    
    
    override init(style:UITableViewCellStyle,reuseIdentifier:String?){
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        
        booksTitlesUI=UILabel(frame:CGRect.zero)
        booksTitlesUI.textAlignment = .left
        contentView.addSubview(booksTitlesUI)
        
        booksImagesUI=UIImage(named:"azarasi.jpg")
        myImageView=UIImageView(image:booksImagesUI)
        contentView.addSubview(myImageView)
        
        booksPriceUI=UILabel(frame:CGRect.zero)
        booksPriceUI.textAlignment = .left
        contentView.addSubview(booksPriceUI)
        
        booksDateUI=UILabel(frame:CGRect.zero)
        booksDateUI.textAlignment = .left
        contentView.addSubview(booksDateUI)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        booksTitlesUI.frame=CGRect(x: 110, y: -20, width: frame.width, height: frame.height)
        booksPriceUI.frame=CGRect(x: 90, y: 25, width: 120, height: frame.height)
        booksDateUI.frame=CGRect(x: 170, y: 25, width: 120, height: frame.height)
        myImageView.frame=CGRect(x: 5, y: 0, width: 70, height: frame.height)
    }
}












