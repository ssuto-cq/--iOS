import UIKit

extension UITextField {
    
    func setTextField() {
        backgroundColor = UIColor(white: 0.9, alpha: 1)
        leftViewMode = .always//文字の左の余白
        leftView?.translatesAutoresizingMaskIntoConstraints = false
        leftView?.widthAnchor.constraint(equalToConstant: 10).isActive = true
        leftView?.heightAnchor.constraint(equalToConstant: 10).isActive = true
        clearButtonMode = .always
        returnKeyType = .done
    }
}
