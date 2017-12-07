//
//  TestViewController.swift
//  CLThemeDemo
//
//  Created by darren on 2017/12/7.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit
import Kingfisher

class TestViewController: BaseViewController {
    @IBOutlet weak var testView: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    let identify = "ThemeCell"
    let cellH: CGFloat = (KScreenWidth-60)/2+70
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame:CGRect(x: 0, y: KNavgationBarHeight+100, width: UIScreen.main.bounds.size.width, height: KScreenHeight-KNavgationBarHeight-100-KTabBarHeight), collectionViewLayout:layout)
        layout.minimumLineSpacing = 20
        layout.headerReferenceSize = CGSize(width: KScreenWidth, height: 0)
        layout.itemSize = CGSize(width: (KScreenWidth-60)/2, height: self.cellH)
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        collectionView.register(UINib.init(nibName: "ThemeCell", bundle: nil), forCellWithReuseIdentifier: self.identify)
        
        ThemeStyleTools.cl_setupViewBackgroundColor(view: collectionView)
        
        return collectionView
    }()
    
    // 模拟服务器下载的数据，假设服务器数据结构如下
    /*
    data = [
    {
        mainColor="#0096F5"       主题色
        subTitleColor="#7CCD7C"   辅助颜色
        imgUrl:XXXXXXXXX
        zipName:"theme1"
        tabBarImgDownLoadLink: http://XXXXXXXXXXXXXXXXXX  一个zip链接
    },
    {
        mainColor="#EE3B3B"       主题色
        subTitleColor="#7CCD7C"   辅助颜色
        imgUrl:XXXXXXXXX
        zipName:"theme2"
        tabBarImgDownLoadLink: http://XXXXXXXXXXXXXXXXXX  一个zip链接
    },
    {
        mainColor="#6A5ACD"       主题色
        subTitleColor="#7CCD7C"   辅助颜色
        imgUrl:XXXXXXXXX
        zipName:"theme3"
        tabBarImgDownLoadLink: http://XXXXXXXXXXXXXXXXXX  一个zip链接
    },
    {
        mainColor="#DAA520"       主题色
        subTitleColor="#7CCD7C"   辅助颜色
        imgUrl:XXXXXXXXX
         zipName:"theme4"
        tabBarImgDownLoadLink: http://XXXXXXXXXXXXXXXXXX  一个zip链接
    }
           ]
 
 */
    
    var data = [["mainColor":"#0096F5","titleColor":"#ffffff","subTitleColor":"#7CCD7C","imgUrl":"http://images2017.cnblogs.com/blog/818253/201712/818253-20171207113453800-82167766.png","zipName":"theme1","tabBarImgDownLoadLink":""],["mainColor":"#EE3B3B","titleColor":"#ffffff","subTitleColor":"#00008B","imgUrl":"http://images2017.cnblogs.com/blog/818253/201712/818253-20171207113450222-167397254.png","zipName":"theme2","tabBarImgDownLoadLink":""],["mainColor":"#6A5ACD","titleColor":"#0000FF","subTitleColor":"#7CCD7C","imgUrl":"http://images2017.cnblogs.com/blog/818253/201712/818253-20171207113446081-565060219.png","zipName":"theme3","tabBarImgDownLoadLink":""],["mainColor":"#DAA520","titleColor":"#000000","subTitleColor":"#008B8B","imgUrl":"http://images2017.cnblogs.com/blog/818253/201712/818253-20171207113442206-1149834805.png","zipName":"theme4","tabBarImgDownLoadLink":""]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initEventHendle()
        
        initView()
        
        loadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func clickLeftBtn() {
    }
    func loadData() {
    }
    
    func initView() {
        self.view.addSubview(self.collectionView)
        self.navTitle = "主题"
        self.view.bringSubview(toFront: self.customNavBar)
        self.leftBtn.isHidden = false
        
        ThemeStyleTools.cl_setupViewBackgroundColor(view: self.testView)
        ThemeStyleTools.cl_setupViewSubLabelTextColor(label: self.infoLabel)
        self.rightBtn.setTitle("测试", for: .normal)
    }
    
    func initEventHendle() {
        
    }
}

extension TestViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.identify, for: indexPath) as! ThemeCell
        
        // 图片
        let url = URL(string:self.data[indexPath.row]["imgUrl"]!)
        if let url = url {
            cell.iconView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil, completionHandler: nil)
        }
        cell.mainColor = self.data[indexPath.row]["mainColor"]
        
        cell.changeThemeSuccess = {[weak self]() in
            
            // 处理主题相关
            self?.dealTheme(themeDict: (self?.data[indexPath.row])!,index: indexPath.row)
            
            self?.collectionView.reloadData()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func dealTheme(themeDict: [String : String],index: Int) {
        // 下载Tabbar相关的图片，一般是从一个特定的连接上下载一个zip文件到本地，这里就把zip文件放到项目中，模拟一下网络获取
        var themeDictNew = [String:Any]()

        // 网络请求到颜色值即赋值，但是图片资源需要本地处理，解压到沙盒
        themeDictNew["mainColor"] = themeDict["mainColor"]
        themeDictNew["subTitleColor"] = themeDict["subTitleColor"]
        themeDictNew["titleColor"] = themeDict["titleColor"]

        let zipName = themeDict["zipName"] ?? ""
        
        ThemeTools.share.setupLocalResource(fileName: zipName, success: { (imgArr) in
            // 处理数据
            themeDictNew["TabBarIcon"] = imgArr
        })
        ThemeTools.share.setupLocalResource(fileName: "\(zipName)"+"s", success: { (imgArr) in
            themeDictNew["TabBarIcon_S"] = imgArr
        })
        
        // 记录使用的主题
        CLUserDefaults.set(themeDictNew, forKey: currentThemeKey)
        CLUserDefaults.synchronize()
        
        CLNotificationCenter.post(name: NSNotification.Name(rawValue:ThemeChangeNotic), object: themeDictNew)
        
        ListeningThemeAdjuster.cl_updateTheme(themeDict: themeDictNew)
    }
}



