//
//  ThemeConfig.swift
//  XFMusic
//
//  Created by darren on 2017/11/3.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

//MARK: - tabbar的默认图标
let defArr_d = [Bundle.main.path(forResource: "defaultTheme_d1.png", ofType: nil),Bundle.main.path(forResource: "defaultTheme_d2.png", ofType: nil),Bundle.main.path(forResource: "defaultTheme_d3.png", ofType: nil),Bundle.main.path(forResource: "defaultTheme_d4.png", ofType: nil)
    ]
let defArr_s = [Bundle.main.path(forResource: "defaultTheme_s1.png", ofType: nil),
                Bundle.main.path(forResource: "defaultTheme_s2.png", ofType: nil),
                Bundle.main.path(forResource: "defaultTheme_s3.png", ofType: nil),
                Bundle.main.path(forResource: "defaultTheme_s4.png", ofType: nil)
]

var Project_Theme = ["mainColor":"#0096F5","titleColor":"#ffffff","subTitleColor":"#7CCD7C","TabBarIcon":defArr_d,"TabBarIcon_S":defArr_s] as [String : Any]

// 主题改变的通知
let ThemeChangeNotic = "ThemeChangeNotic"
// 当前使用的主题色
let currentThemeKey = "currentTheme"
