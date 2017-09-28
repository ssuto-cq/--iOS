import UIKit

class BookCell: UITableViewCell {
    
    var booksTitles: UILabel!
    var booksImages: UIImage!
    var myImageView: UIImageView!
    var booksPrice: UILabel!
    var booksDate: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier:reuseIdentifier)
        
        booksTitles = UILabel(frame:CGRect.zero)
        booksTitles.textAlignment = .left
        contentView.addSubview(booksTitles)
        
        booksImages = UIImage(named:"azarasi.jpg")
        myImageView = UIImageView(image:booksImages)
        contentView.addSubview(myImageView)
        
        booksPrice = UILabel(frame:CGRect.zero)
        booksPrice.textAlignment = .left
        contentView.addSubview(booksPrice)
        
        booksDate = UILabel(frame:CGRect.zero)
        booksDate.textAlignment = .left
        contentView.addSubview(booksDate)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        booksTitles.frame = CGRect(x: 110, y: -20, width: frame.width, height: frame.height)
        booksPrice.frame = CGRect(x: 90, y: 25, width: 120, height: frame.height)
        booksDate.frame = CGRect(x: 170, y: 25, width: 120, height: frame.height)
        myImageView.frame = CGRect(x: 5, y: 0, width: 70, height: frame.height)
    }
    
    func bookRegister(book:Book){
        
        booksTitles.text = book.name
        booksPrice.text = R.string.localizable.price(book.price) 
        booksDate.text = book.boughtDate
        myImageView.image = UIImage(named: book.imagePath)
    }
}
