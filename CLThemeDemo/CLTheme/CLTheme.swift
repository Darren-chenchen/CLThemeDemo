//
//  CLTheme.swift
//  CLThemeDemo
//
//  Created by darren on 2017/12/7.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

class CLTheme {

    static let share = CLTheme()
    
    func enable() {
        // 皮肤相关
        let theme = UserDefaults.standard.value(forKey: currentThemeKey)
        if theme != nil {
            let themeDict = theme as! [String:Any]
            guard let _ = themeDict["mainColor"] as? String else {
                // 赋值默认的
                CLUserDefaults.set(Project_Theme, forKey: currentThemeKey)
                CLUserDefaults.synchronize()
                return
            }
            Project_Theme = themeDict
        } else {
            // 设置默认的
            CLUserDefaults.set(Project_Theme, forKey: currentThemeKey)
            CLUserDefaults.synchronize()
        }
    }

}
