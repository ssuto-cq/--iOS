import UIKit

extension UIButton {
    
    func setButton() {
        setTitleColor( .lightGray, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 24)
        backgroundColor = UIColor(red:0.9, green: 0.9, blue: 0.9, alpha: 1)
    }
}
