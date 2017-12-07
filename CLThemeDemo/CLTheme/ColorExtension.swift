//
//  ColorExtension.swift
//  CloudscmSwift
//
//  Created by RexYoung on 2017/2/20.
//  Copyright © 2017年 RexYoung. All rights reserved.
//

import UIKit


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    //RGBA颜色定义
    convenience init(redValue: Int, green: Int, blue: Int, alpha: CGFloat) {
        self.init(red: CGFloat(redValue) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    class var appDarkSkyBlue: UIColor {
        return UIColor(red: 33.0 / 255.0, green: 127.0 / 255.0, blue: 219.0 / 255.0, alpha: 1.0)
    }
    
    class var appBrownishGrey: UIColor {
        return UIColor(white: 102.0 / 255.0, alpha: 1.0)
    }
    
    class var appBlack: UIColor {
        return UIColor(white: 51.0 / 255.0, alpha: 1.0)
    }
    
    class var appBlackTwo: UIColor {
        return UIColor(white: 0.0, alpha: 1.0)
    }
    
    class var appWarmGrey: UIColor {
        return UIColor(white: 120.74 / 255.0, alpha: 1.0)
    }
    
    class var appBlackTwo60: UIColor {
        return UIColor(white: 0.0, alpha: 0.6)
    }
    
    class var appWhite: UIColor {
        return UIColor(white: 255.0 / 255.0, alpha: 1.0)
    }
    
    class var appBrownishGreyTwo: UIColor {
        return UIColor(white: 94.0 / 255.0, alpha: 1.0)
    }
    
    class var appWhiteTwo: UIColor {
        return UIColor(white: 240.0 / 255.0, alpha: 1.0)
    }
    
    class var appOrigenColor: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 120 / 255.0, blue: 40 / 255.0, alpha: 1.0)
    }

    class var appBrownishGreyThree: UIColor {
        return UIColor(white: 97.0 / 255.0, alpha: 1.0)
    }
    
    class var appWarmGreyTwo: UIColor { 
        return UIColor(white: 127.51 / 255.0, alpha: 1.0)
    }
    class var appGrapefruit: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 89.4 / 255.0, blue: 89.4 / 255.0, alpha: 1.0)
    }
    class var appBluish: UIColor {
        return UIColor(red: 37.0 / 255.0, green: 126.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0)
    }
    class var greyish: UIColor {
        return UIColor(white: 127.51 / 255.0, alpha: 1.0)
    }
    class var appGreyish: UIColor {
        return UIColor(white: 170.26 / 255.0, alpha: 1.0)
    }
    class var appAzure: UIColor {
        return UIColor(red: 0.0, green: 150.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
    }

    class var appPinkishRed: UIColor {
        return UIColor(red: 235.0 / 255.0, green: 37.0 / 255.0, blue: 61.0 / 255.0, alpha: 1.0)
    }
    class var appWhiteFour: UIColor {
        return UIColor(white: 211.0 / 255.0, alpha: 1.0)
    }
    class var appDarkSkyBlueTwo: UIColor {
        return UIColor(red: 35.0 / 255.0, green: 127.0 / 255.0, blue: 219.0 / 255.0, alpha: 1.0)
    }
    class var appGreyishBrown: UIColor {
        return UIColor(red: 68.0 / 255.0, green: 68.0 / 255.0, blue: 68.0 / 255.0, alpha: 1.0)
    }

}
