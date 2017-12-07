//
//  Test1ViewController.swift
//  CLThemeDemo
//
//  Created by darren on 2017/12/7.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

class Test1ViewController: BaseViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var switchView: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navTitle = "各种控件测试"
        self.pageController.pageIndicatorTintColor = UIColor.lightGray
        self.textField.text = "测试textField颜色"

        
        ThemeStyleTools.cl_setupSliderColor(slider: self.sliderView)
        ThemeStyleTools.cl_setupPageControlColor(page: self.pageController)
        ThemeStyleTools.cl_setupProgressViewlColor(progress: self.progressView)
        ThemeStyleTools.cl_setupSwitchViewlColor(switchView: self.switchView)
        
        ThemeStyleTools.cl_setupSegmentControllColor(segment: self.segmentControl)
        ThemeStyleTools.cl_setupTextFieldTextColor(textField: self.textField)

    }
}
