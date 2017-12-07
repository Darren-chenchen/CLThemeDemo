
import UIKit

class TabBarViewController: UITabBarController,CLTabBarDelegate {
    
    var cl_tabbar = CLTabBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        self.setupTabBar()
        
        CLNotificationCenter.addObserver(self, selector: #selector(themeChange(notic:)), name: NSNotification.Name(rawValue:ThemeChangeNotic), object: nil)
    }
    
    // 更换主题
    @objc func themeChange(notic: Notification) {
        var newFileArr_d = [String]()
        var newFileArr_s = [String]()
        let dict = notic.object as! [String:Any]
        let tabbar_dArr = dict["TabBarIcon"] as! [String]
        let tabbar_sArr = dict["TabBarIcon_S"] as! [String]
        
        if dict["mainColor"] as! String == Project_Theme["mainColor"] as!String {  // 默认的
            newFileArr_d = defArr_d as! [String]
            newFileArr_s = defArr_s as! [String]
        } else {
            for itme in tabbar_dArr {
                newFileArr_d.append(CacheUtils.getCachePath()+itme)
            }
            for itme in tabbar_sArr {
                newFileArr_s.append(CacheUtils.getCachePath()+itme)
            }
        }
        for i in 0..<self.cl_tabbar.subviews.count {
            let item = self.cl_tabbar.subviews[i]
            if item.classForCoder == CLTabBarButton.self {
                let btn = item as! CLTabBarButton
                btn.setImage(UIImage.init(contentsOfFile: newFileArr_d[i]), for: .normal)
                btn.setImage(UIImage.init(contentsOfFile: newFileArr_s[i]), for: .selected)
            }
        }
    }

    
    // 移除系统自带的tabbar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor.white
        
        self.removeSystemTabar()
    }
    
    func removeSystemTabar() {
        for child in self.tabBar.subviews {
            if child.isKind(of: UIControl.self) {
                child.isHidden = true  // 适配ios11
            }
        }
    }
    
    // 自定义tabbar覆盖系统的tabbar
    func setupTabBar(){
        
        cl_tabbar.frame = CGRect(x: 0, y: 0, width: KScreenWidth, height: 49)
        self.tabBar.addSubview(cl_tabbar)
        cl_tabbar.delegate = self
    }

    
    func initView() {
        // 当前使用的主题
        let theme = CLUserDefaults.value(forKey: currentThemeKey)
        if theme != nil {
            
            var newFileArr_d = [String]()
            var newFileArr_s = [String]()
            
            let themeDict = theme as! [String:Any]
            
            guard let themeDictVaile = themeDict["TabBarIcon"] as? [String],let themeDictVaileS = themeDict["TabBarIcon_S"] as? [String] else {
                let newFileArr_d = defArr_d as! [String]
                let newFileArr_s = defArr_s as! [String]
                
                self.setupContent(newFileArr_d: newFileArr_d, newFileArr_s: newFileArr_s)
                return
            }
            let tabbar_dArr = themeDictVaile
            let tabbar_sArr = themeDictVaileS
            
            if themeDict["mainColor"] as! String == Project_Theme["mainColor"] as!String {  // 默认的
                newFileArr_d = defArr_d as! [String]
                newFileArr_s = defArr_s as! [String]
            } else {
                for itme in tabbar_dArr {
                    newFileArr_d.append(CacheUtils.getCachePath()+itme)
                }
                for itme in tabbar_sArr {
                    newFileArr_s.append(CacheUtils.getCachePath()+itme)
                }
            }
            
            // 防止意外情况
            if newFileArr_d.count != 4 || newFileArr_s.count != 4 {
                newFileArr_d = defArr_d as! [String]
                newFileArr_s = defArr_s as! [String]
            }
            
            self.setupContent(newFileArr_d: newFileArr_d, newFileArr_s: newFileArr_s)
        } else { // 防止意外情况
            let newFileArr_d = defArr_d as! [String]
            let newFileArr_s = defArr_s as! [String]
            
            self.setupContent(newFileArr_d: newFileArr_d, newFileArr_s: newFileArr_s)
        }
    }
    
    func setupContent(newFileArr_d: [String],newFileArr_s: [String]) {
        self.setupChildViewController(viewController: TestViewController.init(nibName: "TestViewController", bundle: nil), image: UIImage.init(contentsOfFile: newFileArr_d[0]), selectedImage: UIImage.init(contentsOfFile: newFileArr_s[0]), title: "主题")
        
        self.setupChildViewController(viewController: Test1ViewController.init(nibName: "Test1ViewController", bundle: nil), image:  UIImage.init(contentsOfFile: newFileArr_d[1]), selectedImage: UIImage.init(contentsOfFile: newFileArr_s[1]), title: "测试1")
        
        self.setupChildViewController(viewController: Test2ViewController.init(nibName: "Test2ViewController", bundle: nil), image:  UIImage.init(contentsOfFile: newFileArr_d[2]), selectedImage:UIImage.init(contentsOfFile: newFileArr_s[2]), title: "测试2")
        
        self.setupChildViewController(viewController: Test3ViewController.init(nibName: "Test3ViewController", bundle: nil), image:  UIImage.init(contentsOfFile: newFileArr_d[3]), selectedImage: UIImage.init(contentsOfFile: newFileArr_s[3]), title: "测试3")
    }
    
    func setupChildViewController(viewController: UIViewController, image: UIImage!, selectedImage: UIImage!, title: NSString) {
        
        let navVC = BaseNavViewController.init(rootViewController: viewController)
        
        // 让图片显示图片原始颜色  “UIImage” 后+ “.imageWithRenderingMode(.AlwaysOriginal)”
        navVC.tabBarItem = UITabBarItem.init(title: title as String, image: image, selectedImage: selectedImage.withRenderingMode(.alwaysOriginal))
        
        navVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.black], for: .normal)
        navVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.red], for: .selected)
        
        self.addChildViewController(navVC)
        
        cl_tabbar.addCustomButtonWithitem(navVC.tabBarItem)
    }
    
    // MARK: - CLTabBarDelegate
    func setupSelectedTabbar(_ clTabbar: CLTabBar, fromIndex: NSInteger, toIndex: NSInteger) {
        self.selectedIndex = toIndex
    }
    
    deinit {
        CLNotificationCenter.removeObserver(self)
    }
}



