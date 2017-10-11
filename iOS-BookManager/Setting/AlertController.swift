import UIKit

struct AlertController {
    
    static func setAlert(target: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: R.string.localizable.ok(), style: .default)
        alert.addAction(action)
        target.present(alert, animated: true, completion: nil)
    }
}
