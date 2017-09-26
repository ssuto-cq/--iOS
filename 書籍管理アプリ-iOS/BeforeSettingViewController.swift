import UIKit

class BeforeSettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = R.string.localizable.setting()

        let settingButton = UIButton()

        let accountSettingTitle = R.string.localizable.accountsetting()
        settingButton.setTitle(accountSettingTitle, for:UIControlState.normal)
        settingButton.setTitleColor(UIColor.lightGray, for: .normal)
        settingButton.titleLabel?.font =  UIFont.systemFont(ofSize: 24)
        settingButton.backgroundColor = UIColor.init(red:0.9, green: 0.9, blue: 0.9, alpha: 1)
        settingButton.layer.position = CGPoint(x:self.view.frame.width/2, y:200)
        settingButton.addTarget(self, action: #selector(settingButtonTapped(sender:)), for: .touchUpInside)
        self.view.addSubview(settingButton)

        settingButton.translatesAutoresizingMaskIntoConstraints = false

        settingButton.topAnchor.constraint(equalTo:self.view.topAnchor, constant:120).isActive = true
        settingButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func settingButtonTapped(sender: UIButton) {
        let accountSettingViewController = AccountSettingViewController()
        let navi = UINavigationController(rootViewController: accountSettingViewController)
        accountSettingViewController.modalTransitionStyle = .crossDissolve
        present(navi, animated: true, completion: nil)
    }
}
