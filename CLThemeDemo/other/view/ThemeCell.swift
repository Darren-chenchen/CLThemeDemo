

import UIKit

typealias changeThemeSuccessClouse = ()->()

class ThemeCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userBtn: UIButton!
    @IBOutlet var iconView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        XFViewsBorder(self.userBtn, borderWidth: 0, cornerRadius: 20)
    }
        
    var changeThemeSuccess: changeThemeSuccessClouse?
    
    var mainColor: String? {
        didSet{
            self.bgView.backgroundColor = UIColor(hexString: mainColor ?? "")
            
            // 当前使用的主题
            let theme = CLUserDefaults.value(forKey: currentThemeKey)
            if theme != nil {
                let themeDict = theme as! [String:Any]
                guard let colorStr = themeDict["mainColor"] as? String else {
                    return
                }
                if colorStr == (mainColor ?? "") {
                    self.userBtn.setTitle("使用中", for: .normal)
                    self.userBtn.isUserInteractionEnabled = false
                } else {
                    self.userBtn.setTitle("去使用", for: .normal)
                    self.userBtn.isUserInteractionEnabled = true
                }
                self.userBtn.backgroundColor = UIColor(hexString: colorStr)
            }
        }
    }

    @IBAction func clickUserBtn(_ sender: Any) {
        
        if self.changeThemeSuccess != nil {
            self.changeThemeSuccess!()
        }

    }
    
}
