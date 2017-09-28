import UIKit

class BookCell: UITableViewCell {
    
    var bookTitleLabel: UILabel!
    var bookImage: UIImage!
    var bookImageView: UIImageView!
    var bookPriceLabel: UILabel!
    var bookDateLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier:reuseIdentifier)
        
        bookTitleLabel = UILabel(frame:CGRect.zero)
        bookTitleLabel.textAlignment = .left
        contentView.addSubview(bookTitleLabel)
        
        bookImage = UIImage(named:"azarasi.jpg")
        bookImageView = UIImageView(image:bookImage)
        contentView.addSubview(bookImageView)
        
        bookPriceLabel = UILabel(frame:CGRect.zero)
        bookPriceLabel.textAlignment = .left
        contentView.addSubview(bookPriceLabel)
        
        bookDateLabel = UILabel(frame:CGRect.zero)
        bookDateLabel.textAlignment = .left
        contentView.addSubview(bookDateLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bookTitleLabel.frame = CGRect(x: 110, y: -20, width: frame.width, height: frame.height)
        bookPriceLabel.frame = CGRect(x: 90, y: 25, width: 120, height: frame.height)
        bookDateLabel.frame = CGRect(x: 170, y: 25, width: 120, height: frame.height)
        bookImageView.frame = CGRect(x: 5, y: 0, width: 70, height: frame.height)
    }
    
    func bookRegister(book:Book){
        
        bookTitleLabel.text = book.name
        bookPriceLabel.text = R.string.localizable.price(book.price) 
        bookDateLabel.text = book.boughtDate
        bookImageView.image = UIImage(named: book.imagePath)
    }
}
