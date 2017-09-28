import UIKit

class BookCell: UITableViewCell {
    
    fileprivate var bookImageView: UIImageView! = {
        let image = R.image.noimage()
        let imageView = UIImageView(image:image)
        return imageView
    }()
    
    fileprivate let bookTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        return label
    }()
    
    fileprivate let bookPriceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        return label
    }()
    
    fileprivate let bookDateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier:reuseIdentifier)
        
        contentView.addSubview(bookImageView)
        contentView.addSubview(bookTitleLabel)
        contentView.addSubview(bookPriceLabel)
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
