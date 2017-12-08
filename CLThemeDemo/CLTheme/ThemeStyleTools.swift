//
//  ThemeStyleTools.swift
//  CLThemeDemo
//
//  Created by darren on 2017/12/7.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

import UIKit
import RxSwift

class ThemeStyleTools {
    
    static fileprivate let disposeBag = DisposeBag() // 监听者自动销毁器
    
    static let share = ThemeStyleTools()
}

//MARK: - UIView相关
extension ThemeStyleTools {
    //MARK: - view背景色
    static func cl_setupViewBackgroundColor(view: UIView) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["mainColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            view.backgroundColor = color
            
        }).addDisposableTo(disposeBag)
    }
}

//MARK: - UILabel
extension ThemeStyleTools {
    //UILabel主要文字颜色
    static func cl_setupViewLabelTextColor(label: UILabel) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["titleColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            label.textColor = color
        }).addDisposableTo(disposeBag)
    }
    
    // 副标题的颜色
    static func cl_setupViewSubLabelTextColor(label: UILabel) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["subTitleColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            label.textColor = color
        }).addDisposableTo(disposeBag)
    }
}
//MARK: - UIButton
extension ThemeStyleTools {
    //UIButton文字颜色normal
    static func cl_setupBtnNormalTextColor(btn: UIButton) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["titleColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            
            btn.setTitleColor(color, for: .normal)
        }).addDisposableTo(disposeBag)
    }
    //UIButton文字颜色selected
    static func cl_setupBtnSelectedTextColor(btn: UIButton) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["mainColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            
            btn.setTitleColor(color, for: .selected)
        }).addDisposableTo(disposeBag)
    }
    
    //UIButton图片颜色normalnormal
    static func cl_setupBtnNormalImgColor(btn: UIButton) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["titleColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            
            btn.tintColor = color
            let img = btn.image(for: .normal)?.withRenderingMode(.alwaysTemplate)
            btn.setImage(img, for: .normal)
        }).addDisposableTo(disposeBag)
    }
    //UIButton图片颜色select
    static func cl_setupBtnSelectImgColor(btn: UIButton) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["mainColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            
            btn.tintColor = color
            let img = btn.image(for: .selected)?.withRenderingMode(.alwaysTemplate)
            btn.setImage(img, for: .selected)
        }).addDisposableTo(disposeBag)
    }
}
//MARK: - UIImageView
extension ThemeStyleTools {
    //UISlider颜色
    static func cl_setupImageViewColor(img: UIImageView) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["mainColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            let image = img.image?.withRenderingMode(.alwaysTemplate)
            img.tintColor = color
            img.image = image
        }).addDisposableTo(disposeBag)
    }
}
//MARK: - UITextView
extension ThemeStyleTools {
    //UITextView文字颜色
    public static func cl_setupTextViewColor(textView: UITextView) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["mainColor"] as? String else {
                return
            }
            let color = UIColor(hexString: colorStr)

            textView.textColor = color
            
        }).addDisposableTo(disposeBag)

    }
}

//MARK: - UISlider
extension ThemeStyleTools {
    //UISlider颜色
    static func cl_setupSliderColor(slider: UISlider) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["mainColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            
            slider.tintColor = color
        }).addDisposableTo(disposeBag)
    }
}
//MARK: - UIPageControl
extension ThemeStyleTools {
    //UISlider颜色
    static func cl_setupPageControlColor(page: UIPageControl) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["mainColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            
            page.currentPageIndicatorTintColor = color
            
        }).addDisposableTo(disposeBag)
    }
}

//MARK: - UIProgressView
extension ThemeStyleTools {
    static func cl_setupProgressViewlColor(progress: UIProgressView) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["mainColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            
            progress.tintColor = color
            
        }).addDisposableTo(disposeBag)
    }
}
//MARK: - UISwitch
extension ThemeStyleTools {
    static func cl_setupSwitchViewlColor(switchView: UISwitch) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["mainColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            
            switchView.onTintColor = color
            
        }).addDisposableTo(disposeBag)
    }
}

//MARK: - UITextField
extension ThemeStyleTools {
    static func cl_setupTextFieldTextColor(textField: UITextField) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["mainColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            
            textField.textColor = color
            textField.layoutSubviews()
            
        }).addDisposableTo(disposeBag)
    }
}
//MARK: - UISegmentedControl
extension ThemeStyleTools {
    static func cl_setupSegmentControllColor(segment: UISegmentedControl) {
        ListeningThemeAdjuster.listeningTheme.asObservable().subscribe(onNext: { (themeDict:[String:Any]) in
            
            Project_Theme = themeDict
            
            guard let colorStr = Project_Theme["mainColor"] as? String else {
                return
            }
            
            let color = UIColor(hexString: colorStr)
            
            segment.tintColor = color
            
        }).addDisposableTo(disposeBag)
    }
}

//MARK: - 自定义颜色,暂时用不到
extension ThemeStyleTools{
    //view背景色---自定义
    static func cl_setupViewCustomBackgroundColor(view: UIView, customColors: CustomStyle<UIColor>) {
        customColors.styleDrive.drive(view.rx.backgroundColor).disposed(by: disposeBag)
    }
    // label的文字颜色
    static func cl_setupViewCustomLabelColor(label: UILabel, customColors: CustomStyle<UIColor>) {
        customColors.styleDrive.drive(label.rx.textColor).disposed(by: disposeBag)
    }
    // button的文字颜色normal
    static func cl_setupViewCustomBtnNormalTextColor(btn: UIButton, customColors: CustomStyle<UIColor>) {
        customColors.styleDrive.drive(btn.rx.textColor).disposed(by: disposeBag)
    }
    // button的文字颜色select
    static func cl_setupViewCustomBtnSelectTextColor(btn: UIButton, customColors: CustomStyle<UIColor>) {
        customColors.styleDrive.drive(btn.rx.selectTextColor).disposed(by: disposeBag)
    }
    // button的图片颜色normal
    static func cl_setupViewCustomBtnNormalImgColor(btn: UIButton, customColors: CustomStyle<UIColor>) {
        customColors.styleDrive.drive(btn.rx.normalImgColor).disposed(by: disposeBag)
    }
    // button的图片颜色select
    static func cl_setupViewCustomBtnSelectImgColor(btn: UIButton, customColors: CustomStyle<UIColor>) {
        customColors.styleDrive.drive(btn.rx.selectImgColor).disposed(by: disposeBag)
    }


}
