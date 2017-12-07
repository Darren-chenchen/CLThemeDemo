//
//  Test2ViewController.swift
//  CLThemeDemo
//
//  Created by darren on 2017/12/7.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

class Test2ViewController: BaseViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        ThemeStyleTools.cl_setupImageViewColor(img: self.imgView)
        
    }

}
