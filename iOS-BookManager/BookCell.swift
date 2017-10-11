import UIKit

class BookCell: UITableViewCell {
    
    fileprivate var bookImageView: UIImageView! = {
        return UIImageView(image: R.image.noimage())
    }()
    
    fileprivate let bookTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    fileprivate let bookPriceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    fileprivate let bookDateLabel: UILabel = {
        let label = UILabel()
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
        
        bookTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        bookPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        bookDateLabel.translatesAutoresizingMaskIntoConstraints = false
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        
        bookTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120).isActive = true
        bookTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        
        bookPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120).isActive = true
        bookPriceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60).isActive = true
        
        bookDateLabel.leadingAnchor.constraint(equalTo: bookPriceLabel.leadingAnchor, constant: 100).isActive = true
        bookDateLabel.topAnchor.constraint(equalTo: bookPriceLabel.topAnchor).isActive = true
        
        bookImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        bookImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1/4).isActive = true
        bookImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
    }
    
    func bookRegister(book:Book){
        bookTitleLabel.text = book.name
        bookPriceLabel.text = R.string.localizable.price(book.price)
        bookDateLabel.text = book.boughtDate
        bookImageView.image = UIImage(named: book.imagePath)
    }
}
