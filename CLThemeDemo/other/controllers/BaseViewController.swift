//
//  BaseViewController.swift
//  CLThemeDemo
//
//  Created by darren on 2017/12/7.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {

    fileprivate let disposeBag = DisposeBag() // 监听者自动销毁器
    
    // 自定义导航栏
    lazy var customNavBar: CustomNavgationView = {
        let nav = CustomNavgationView.init()
        nav.frame = CGRect(x: 0, y: 0, width: KScreenWidth, height: KNavgationBarHeight)
        return nav
    }()
    // 右边第一个按钮
    lazy var rightBtn: UIButton = {
        let btn = UIButton()
        btn.adjustsImageWhenHighlighted = false
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(BaseViewController.rightBtnClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    // 右边第二个按钮
    lazy var rightBtnTwo: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: KScreenWidth-100, y: 0, width: 44, height: 44);
        btn.xf_centerY = self.backBtn.xf_centerY
        btn.adjustsImageWhenHighlighted = false
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(BaseViewController.rightBtnTwoClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    // 导航栏左侧按钮
    lazy var leftBtn: UIButton = {
        let btn = UIButton.init(frame: CGRect(x: 0, y: 20, width: 60, height: 44))
        btn.setImage(UIImage(named:"菜单_b"), for: .normal)
        btn.addTarget(self, action: #selector(clickLeftBtn), for: .touchUpInside)
        return btn
    }()
    // 标题
    var navTitle = "" {
        didSet{
            customNavBar.titleLable.text = navTitle
        }
    }
    // 返回按钮
    lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 20, width: 50, height: 44);
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        btn.setImage((UIImage(named: "back")), for:UIControlState())
        btn.addTarget(self, action: #selector(BaseViewController.backBtnclick), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.setupNav()
        
        setupLayout()
    }
    
    func setupLayout() {
        self.rightBtn.snp.makeConstraints { (make) in
            make.left.equalTo(KScreenWidth-64)
            make.width.equalTo(64)
            make.height.equalTo(44)
            make.centerY.equalTo(self.customNavBar.titleLable.snp.centerY)
        }
        self.leftBtn.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.width.equalTo(60)
            make.height.equalTo(44)
            make.centerY.equalTo(self.customNavBar.titleLable.snp.centerY)
        }
        self.backBtn.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.width.equalTo(50)
            make.height.equalTo(44)
            make.centerY.equalTo(self.customNavBar.titleLable.snp.centerY)
        }
    }
    
    
    fileprivate func setupNav(){
        
        // 添加导航栏
        self.view.addSubview(self.customNavBar)
        self.customNavBar.backgroundColor = UIColor.white
        
        // 右边按钮
        self.customNavBar.addSubview(self.rightBtn)
        self.customNavBar.addSubview(self.rightBtnTwo)
        
        // 左边按钮
        self.customNavBar.addSubview(self.leftBtn)
        self.leftBtn.isHidden = true
        
        self.customNavBar.addSubview(self.backBtn)
        // 多层push才显示返回按钮
        if self.navigationController != nil {
            if ((self.navigationController?.childViewControllers.count)!>1){
                self.backBtn.isHidden = false
            } else {
                self.backBtn.isHidden = true
            }
        }
        
        ThemeStyleTools.cl_setupViewBackgroundColor(view: self.customNavBar)
        ThemeStyleTools.cl_setupBtnNormalTextColor(btn: self.rightBtn)
        ThemeStyleTools.cl_setupBtnNormalImgColor(btn: self.leftBtn)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @objc func rightBtnTwoClick() {
        
    }
    
    @objc func clickLeftBtn() {
    }
    
    @objc func rightBtnClick(){
        
    }
    @objc func backBtnclick(){
        
        let VCArr = self.navigationController?.viewControllers
        if VCArr == nil {
            self.dismiss(animated: true, completion: nil)
            return
        }
        if VCArr!.count > 1 {
            self.navigationController!.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}
