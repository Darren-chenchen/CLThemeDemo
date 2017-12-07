

import UIKit
import RxSwift
import RxCocoa

class CustomNavgationView: UIView {

    lazy var titleLable:UILabel = {
        let titleLable = UILabel()
        titleLable.textAlignment = .center
        titleLable.font = UIFont.boldSystemFont(ofSize: 18)
        ThemeStyleTools.cl_setupViewLabelTextColor(label: titleLable)
        return titleLable
    }()
   lazy var navLine:UILabel = {
        let navLine = UILabel()
        navLine.backgroundColor = UIColor.groupTableViewBackground
        return navLine;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.titleLable)
        self.addSubview(self.navLine)
        self.backgroundColor = UIColor.white
        initEventHendle()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
    func initEventHendle() {
        self.titleLable.snp.makeConstraints { (make) in
            make.leading.equalTo(self).offset(50)
            make.width.equalTo(KScreenWidth-100)
            make.height.equalTo(44)
            make.centerY.equalTo(self).offset(DeviceTools.isX()==true ? 15:8)
        }
    }
    
    override func layoutSubviews() {
        self.navLine.frame = CGRect(x: 0, y: KNavgationBarHeight-0.1, width: KScreenWidth, height: 0.1);
    }
}
