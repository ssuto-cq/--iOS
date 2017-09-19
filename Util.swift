import Foundation
import UIKit

class Util: UITextField{
    
    let datePicker = UIDatePicker()
    let dateFormat = DateFormatter()
    
    
    override  init(frame: CGRect) {
        super.init(frame: frame)
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        self.inputView = datePicker
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func datePickerValueChanged(sender: UIDatePicker) {
        let pickerDate = datePicker.date
        
        dateFormat.locale = NSLocale(localeIdentifier: "ja_JP") as Locale
        dateFormat.dateFormat = "yyyy年MM月dd日"
        self.text = dateFormat.string(from: pickerDate)
    }
}
