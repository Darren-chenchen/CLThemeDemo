
import UIKit

// 屏幕宽度
let KScreenHeight = UIScreen.main.bounds.height
// 屏幕高度
let KScreenWidth = UIScreen.main.bounds.width
//屏幕比例
let kScale = UIScreen.main.scale
//导航栏高度
let KNavgationBarHeight: CGFloat = DeviceTools.isX() == true ? 88.0:64.0
//tabbar高度
let KTabBarHeight: CGFloat = DeviceTools.isX() == true ? 83.0:49.0

// 导航栏默认字体
let NavTitleFont = UIFont.boldSystemFont(ofSize: 18)
// 导航栏默认字体颜色
let NavTitleColor = UIColor.black
// 导航栏默认背景颜色
let NavBackgroudColor = UIColor.white

//MARK: - RGBA颜色
var RGBAColor: (CGFloat, CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue, alpha in
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha);
}

// MARK:- 设置圆角
func XFViewsBorder(_ view:UIView, borderWidth:CGFloat, borderColor:UIColor?=nil,cornerRadius:CGFloat){
    view.layer.borderWidth = borderWidth;
    view.layer.borderColor = borderColor?.cgColor
    view.layer.cornerRadius = cornerRadius
    view.layer.masksToBounds = true
}

let win = UIApplication.shared.keyWindow
let CLNotificationCenter = NotificationCenter.default
let CLUserDefaults = UserDefaults.standard
