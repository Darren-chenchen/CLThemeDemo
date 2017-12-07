//
//  ThemeTools.swift
//  XFMusic
//
//  Created by darren on 2017/11/8.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit
import SSZipArchive

class ThemeTools: NSObject {
    static let share = ThemeTools()
    
    func setupLocalResource(fileName:String,success:([String])->()) {
        //1.先判断之前有没有缓存
        let path = CacheUtils.getCachePath()
        let theme1Path = path+fileName
        if CacheUtils.dirExists(dir: theme1Path) { // 存在说明之前解压过
            print("已经解压")
            self.dealLocalData(fileName: fileName,unzipPath: theme1Path, success: { (imgUrlArr) in
                success(imgUrlArr)
            })
        } else {
            // 不存在说明第一次，就缓存存入沙盒，并把zip文件解压
            // 取到zip文件,写入沙盒
            let themeZip = Bundle.main.path(forResource: fileName, ofType: "zip")
            guard let themeZipUrlStr = themeZip else {return}
            let url = URL(fileURLWithPath: themeZipUrlStr)
            var data = Data()
            do {
                data = try Data.init(contentsOf: url)
                let success = CacheUtils.writeFile(fileName: "\(fileName).zip", data: data as NSData)
                if success {
                    print("成功写入")
                }
            } catch (let writeError) {
                print(writeError)
            }
            // 将本地的zip文件解压
            let zipPath = path + "\(fileName).zip"
            let isDone = SSZipArchive.unzipFile(atPath: zipPath, toDestination: path)
            if isDone {
                print("解压成功")
                self.dealLocalData(fileName: fileName,unzipPath: theme1Path, success: { (imgUrlArr) in
                    success(imgUrlArr)
                })
            } else {
                print("解压失败")
            }
        }
    }
    
    // 处理本地的图片资源
    func dealLocalData(fileName: String,unzipPath: String,success:([String])->()) {
        // 取出解压的文件
        var items: [String]
        do {
            items = try FileManager.default.contentsOfDirectory(atPath: unzipPath)
        } catch {
            return
        }
        var imgUrl = [String]()
        for item in items {
            imgUrl.append(fileName+"/"+item)
        }
        
        success(imgUrl)
    }

}
