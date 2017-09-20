import UIKit

class BookCell: UITableViewCell {
    
    var booksTitlesUI: UILabel!
    var booksImagesUI: UIImage!
    var myImageView: UIImageView!
    var booksPriceUI: UILabel!
    var booksDateUI: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier:reuseIdentifier)
        
        booksTitlesUI = UILabel(frame:CGRect.zero)
        booksTitlesUI.textAlignment = .left
        contentView.addSubview(booksTitlesUI)
        
        booksImagesUI = UIImage(named:"azarasi.jpg")
        myImageView = UIImageView(image:booksImagesUI)
        contentView.addSubview(myImageView)
        
        booksPriceUI = UILabel(frame:CGRect.zero)
        booksPriceUI.textAlignment = .left
        contentView.addSubview(booksPriceUI)
        
        booksDateUI = UILabel(frame:CGRect.zero)
        booksDateUI.textAlignment = .left
        contentView.addSubview(booksDateUI)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        booksTitlesUI.frame = CGRect(x: 110, y: -20, width: frame.width, height: frame.height)
        booksPriceUI.frame = CGRect(x: 90, y: 25, width: 120, height: frame.height)
        booksDateUI.frame = CGRect(x: 170, y: 25, width: 120, height: frame.height)
        myImageView.frame = CGRect(x: 5, y: 0, width: 70, height: frame.height)
    }
    
    func bookRegister(book:Book){
        
        booksTitlesUI.text = book.name
        booksPriceUI.text = String(describing:book.price)
        booksDateUI.text = book.boughtDate
        myImageView.image = UIImage(named: book.imagePath)
    }
}
