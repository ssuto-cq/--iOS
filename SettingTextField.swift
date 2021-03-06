import Foundation
import UIKit

class SettingTextField: UITextField{
    
    private let datePicker = UIDatePicker()
    private let dateFormat = DateFormatter()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: UIControlEvents.valueChanged)
        inputView = datePicker
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func datePickerValueChanged() {
        let pickerDate = datePicker.date
        dateFormat.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        dateFormat.dateFormat = "yyyy年MM月dd日"
        text = dateFormat.string(from: pickerDate)
    }
}
