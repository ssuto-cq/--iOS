import UIKit

class BooksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let statusBarHeight=UIApplication.shared.statusBarFrame.height
    
    var books:[Book] = []
    var selectedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = R.string.localizable.booksview()
        
        books.append(Book(name: "超暇つぶし図鑑", price:1000, boughtDate: "2017/5/10", imagePath: "himatubusi.jpg"))
        books.append(Book(name: "せつない動物図鑑", price: 1100, boughtDate: "2017/7/20", imagePath: "animal.jpg"))
        books.append(Book(name: "浪費図鑑", price: 900, boughtDate: "2017/8/8", imagePath: "waste.jpg"))
        books.append(Book(name: "冒険図鑑", price: 1700, boughtDate: "1985/6/20", imagePath: "adventure.jpg"))
        
        let tableView = UITableView()
        let loadButton = UIButton()

        let addButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(BooksViewController.addButtonTapped))
        self.navigationItem.setRightBarButtonItems([addButton], animated: true)

        //テーブルビューの設定
        tableView.frame = CGRect(x:0, y:statusBarHeight, width:self.view.frame.width, height:self.view.frame.height-statusBarHeight)
        tableView.rowHeight = 90
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BookCell.self, forCellReuseIdentifier: NSStringFromClass(BookCell.self))//
        self.view.addSubview(tableView)

        //読み込みボタンの設定
        let loadTitle = R.string.localizable.load()
        loadButton.setTitle(loadTitle, for:UIControlState.normal)
        loadButton.setTitleColor(UIColor.lightGray, for: .normal)
        loadButton.titleLabel?.font =  UIFont.systemFont(ofSize: 24)
        loadButton.backgroundColor = UIColor.init(red:0.9, green: 0.9, blue: 0.9, alpha: 1)
        loadButton.layer.position = CGPoint(x:self.view.frame.width/2, y:200)
        self.view.addSubview(loadButton)

        loadButton.translatesAutoresizingMaskIntoConstraints = false

        loadButton.bottomAnchor.constraint(equalTo:self.view.bottomAnchor, constant:-50).isActive = true
        loadButton.widthAnchor.constraint(equalTo:self.view.widthAnchor).isActive = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //追加ボタンの処理
    func addButtonTapped() {
        let addBookScene = AddBookViewController()
        let navi = UINavigationController(rootViewController: addBookScene)
        addBookScene.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(navi, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell=tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(BookCell.self), for: indexPath) as! BookCell
        
        cell.bookRegister(book: books[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    //書籍編集画面への遷移処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let editBookScene = EditBookViewController()
        
        editBookScene.book = books[indexPath.row]
        
        self.navigationController?.pushViewController(editBookScene, animated: true)

    }

}
