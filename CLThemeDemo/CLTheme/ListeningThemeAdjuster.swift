//
//  ListeningThemeAdjuster.swift
//  CLThemeDemo
//
//  Created by darren on 2017/12/7.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListeningThemeAdjuster {
    
    // 给出默认的主题
    static var listeningTheme: Variable<[String:Any]> = Variable(Project_Theme)
    
    init() { }
    
    static func cl_updateTheme(themeDict: [String:Any]) {
        self.listeningTheme.value = themeDict
    }
}
