//
//  Test3ViewController.swift
//  CLThemeDemo
//
//  Created by darren on 2017/12/7.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

class Test3ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navTitle = "测试控制器释放问题"
        
    }
    @IBAction func clickBtn1(_ sender: Any) {
        let testVC = TestViewController.init(nibName: "TestViewController", bundle: nil)
        self.navigationController?.pushViewController(testVC, animated: true)
    }
    @IBAction func clickBtn2(_ sender: Any) {
        let testVC = Test1ViewController.init(nibName: "Test1ViewController", bundle: nil)
        self.navigationController?.pushViewController(testVC, animated: true)
    }
}
