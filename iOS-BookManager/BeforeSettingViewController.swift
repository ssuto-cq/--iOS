import UIKit

class BeforeSettingViewController: UIViewController {
    
    private lazy var settingButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.localizable.accountsetting(), for: .normal)
        button.setButton()
        button.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.string.localizable.setting()
        
        view.addSubview(settingButton)
        //anchor
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        
        settingButton.topAnchor.constraint(equalTo:self.view.topAnchor, constant:120).isActive = true
        settingButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func settingButtonTapped() {
        let accountSettingViewController = AccountSettingViewController()
        let navi = UINavigationController(rootViewController: accountSettingViewController)
        accountSettingViewController.modalTransitionStyle = .crossDissolve
        present(navi, animated: true, completion: nil)
    }
}
