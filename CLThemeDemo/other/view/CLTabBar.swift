//
//  CLTabBar.swift
//  haihang_swift
//
//  Created by darren on 16/8/16.
//  Copyright © 2016年 shanku. All rights reserved.
//

import UIKit

protocol CLTabBarDelegate:NSObjectProtocol {
    func setupSelectedTabbar(_ clTabbar:CLTabBar, fromIndex:NSInteger ,toIndex:NSInteger)
}

class CLTabBar: UIView {
    
    let tabBarCount: CGFloat = 4
    
    weak var delegate : CLTabBarDelegate?
    //数组初始化
    var customBtnsArr:[CLTabBarButton] = [CLTabBarButton]()
    
    var selectedBtn = CLTabBarButton()
    
    func addCustomButtonWithitem(_ item:UITabBarItem) {
        
        let customBtn = CLTabBarButton()
        customBtn.item = item

        self.addSubview(customBtn)
        customBtnsArr.append(customBtn)
        
        //监听按钮点击
        customBtn.addTarget(self, action: #selector(clickbtn(_:)), for: .touchUpInside)
    }
    
    @objc func clickbtn(_ btn:CLTabBarButton) {
    
        delegate?.setupSelectedTabbar(self, fromIndex: selectedBtn.tag, toIndex: btn.tag)

        self.selectedBtn.isSelected = false;
        btn.isSelected = true;
        self.selectedBtn = btn;
    }
    
    // 设置按钮的尺寸
    override func layoutSubviews() {
        
        let btnW = self.frame.size.width / self.tabBarCount
        let btnY: CGFloat = self.xf_height-49
        let btnH: CGFloat = 49
        
        for i in 0..<Int(self.tabBarCount) {
            
            let btnX = CGFloat(i) * btnW
            let tabbarbtn = customBtnsArr[i] 
            tabbarbtn.tag = i
            if tabbarbtn.tag == 0 {
                self.selectedBtn = tabbarbtn 
                self.selectedBtn.isSelected = true
            }
            tabbarbtn.frame = CGRect(x: btnX, y: btnY, width: btnW, height: btnH)
            ThemeStyleTools.cl_setupBtnSelectedTextColor(btn: tabbarbtn)
        }
    }
}
