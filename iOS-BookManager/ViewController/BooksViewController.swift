import UIKit
import APIKit
import Himotoki

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
        books.append(Book(name: "超暇つぶし図鑑", imagePath: "himatubusi.jpg", price:1000, purchaseDate: "2017/5/10" ))
        books.append(Book(name: "せつない動物図鑑", imagePath: "animal.jpg", price: 1100, purchaseDate: "2017/7/20" ))
        books.append(Book(name: "浪費図鑑", imagePath: "waste.jpg", price: 900, purchaseDate: "2017/8/8" ))
        books.append(Book(name: "冒険図鑑", imagePath: "adventure.jpg", price: 1700, purchaseDate: "1985/6/20"))
        
        let request = BookRequest(limit: 20, page: 1)
        Session.send(request) { result in
            switch result {
            case.success(let response):
                print(response)
            case.failure(let error):
                print(error)
            }
        }
    }
    
    //追加ボタンの処理
    @objc func addButtonTapped() {
        let vc = AddBookViewController()
        let navi = UINavigationController(rootViewController: vc)
        vc.modalTransitionStyle = .crossDissolve
        present(navi, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(BookCell.self), for: indexPath) as! BookCell
        cell.bookRegister(book: books[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    //書籍編集画面への遷移処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = EditBookViewController()
        vc.book = books[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
