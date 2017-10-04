import UIKit

class BooksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var books:[Book] = []
    
    private lazy var bookTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 90
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BookCell.self, forCellReuseIdentifier: NSStringFromClass(BookCell.self))
        return tableView
    }()
    
    private lazy var loadButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.localizable.load(), for: .normal)
        button.setButton()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.string.localizable.booksview()
        
        view.addSubview(bookTableView)
        view.addSubview(loadButton)
        
        fetchData()
        
        //追加ボタンの設定
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        self.navigationItem.setRightBarButtonItems([addButton], animated: true)
        //anchor
        bookTableView.translatesAutoresizingMaskIntoConstraints = false
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        
        bookTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        bookTableView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        
        loadButton.bottomAnchor.constraint(equalTo:self.view.bottomAnchor, constant:-50).isActive = true
        loadButton.widthAnchor.constraint(equalTo:self.view.widthAnchor).isActive = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func fetchData() {
        books.append(Book(name: "超暇つぶし図鑑", price:1000, boughtDate: "2017/5/10", imagePath: "himatubusi.jpg"))
        books.append(Book(name: "せつない動物図鑑", price: 1100, boughtDate: "2017/7/20", imagePath: "animal.jpg"))
        books.append(Book(name: "浪費図鑑", price: 900, boughtDate: "2017/8/8", imagePath: "waste.jpg"))
        books.append(Book(name: "冒険図鑑", price: 1700, boughtDate: "1985/6/20", imagePath: "adventure.jpg"))
    }
    
    //追加ボタンの処理
    func addButtonTapped() {
        let addBookViewController = AddBookViewController()
        let navi = UINavigationController(rootViewController: addBookViewController)
        addBookViewController.modalTransitionStyle = .crossDissolve
        present(navi, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(BookCell.self), for: indexPath) as! BookCell
        cell.bookRegister(book: books[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //書籍編集画面への遷移処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editBookViewController = EditBookViewController()
        editBookViewController.book = books[indexPath.row]
        self.navigationController?.pushViewController(editBookViewController, animated: true)
    }
    
}
