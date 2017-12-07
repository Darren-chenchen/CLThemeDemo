//
//  CacheUtils.swift
//  XFMusic
//
//  Created by darren on 2017/11/7.
//  Copyright © 2017年 陈亮陈亮. All rights reserved.
//

import UIKit

//第一层文件夹名称
let CACHEPATH = "APPTheme"

class CacheUtils {
    
    //获得NSFileManager
    class func getFileManager()->FileManager{
        return FileManager.default
    }
    
    //判断文件夹是否存在
    class func dirExists(dir:String)->Bool{
        return getFileManager().fileExists(atPath: dir)
    }
    
    //创建文件夹
    class func createDir(dir:String)->Bool{
        let fileManager = getFileManager()
        do{
            try fileManager.createDirectory(at: NSURL(fileURLWithPath: dir, isDirectory: true) as URL, withIntermediateDirectories: true, attributes: nil)
        }catch{
            return false
        }
        return true
    }
    
    //缓存路径
    class func getCachePath()->String{
        var cacheDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true).first!
        if(!cacheDir.hasSuffix("/")){
            cacheDir += "/"
        }
        cacheDir += CACHEPATH + "/"
        return cacheDir
    }

    /// 写文件
    ///
    /// - Parameters:
    ///   - fileName: 文件名称
    ///   - data: 数据data
    /// - Returns: <#return value description#>
    class func writeFile(fileName:String,data:NSData)->Bool{
        
        guard let filePath = createFilePath(fileName: fileName) else{
            return false
        }
        
        return data.write(toFile: filePath, atomically: true)
    }

    /// 根据文件名创建路径
    ///
    class func createFilePath(fileName:String)->String?{
        let dir = getCachePath()
        if(!dirExists(dir: dir) && !createDir(dir: dir)){
            return nil
        }
        let filePath = dir + fileName
        if(fileExists(path: filePath)){
            do{
                try getFileManager().removeItem(atPath: filePath)
            }catch{
                return nil
            }
        }
        return filePath
    }
    //判断文件是否存在
    class func fileExists(path:String)->Bool{
        return dirExists(dir: path)
    }
    
    /// 删除文件 - 根据文件路径
    class func deleteFile(path:String)->Bool{
        if(!fileExists(path: path)){
            return true
        }
        let fileManager = getFileManager()
        do{
            try fileManager.removeItem(atPath: path)
        }catch{
            return false
        }
        
        return true
    }

    
}
