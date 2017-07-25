//
//  RemoveCacheTool.swift
//  removeCacheTool
//
//  Created by 路政浩 on 2017/7/25.
//  Copyright © 2017年 路政浩. All rights reserved.
//

import Foundation

class RemoveCacahe {
    
    private var cachePath : String = ""
    
    init() {
        cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        debugPrint("缓存路径: \(cachePath)")
    }
    
    // 获得缓存大小
    func cacheData() -> String {
        var cacheCount = Int()
        
        // 取出当前目录下的所有文件名
        let files = FileManager.default.subpaths(atPath: cachePath)
        debugPrint("缓存路径所有文件名: \(String(describing: files))")
        
        for file in files! {
            
            // 拼接路径名
            let path = cachePath.appendingFormat("\(file)")
            debugPrint("缓存路径所有文件路径: \(String(describing: path))")
            
            if FileManager.default.fileExists(atPath: path) {
                
                let floder = try! FileManager.default.attributesOfItem(atPath: path)
                debugPrint("缓存路径所有文件: \(String(describing: floder))")
                
                for (size,value) in floder {
                
                    if size == FileAttributeKey.size{
                        cacheCount += (value as AnyObject).intValue
                    }
                }
            }
        }
        return "\(cacheCount/(1024*1024))M"
    }
    
    // 清理缓存
    func cleanCacheDate(){
        
        let files = FileManager.default.subpaths(atPath: cachePath)
        debugPrint("清除缓存目录:\(String(describing: files))")
        
        for file in files!{
            
            let path = cachePath.appendingFormat("/\(file)")
            
            if FileManager.default.fileExists(atPath: path) {
                
                do {
                    try FileManager.default.removeItem(atPath: path)
                } catch {
                    debugPrint("删除缓存错误信息:\(error)")
                }
            }
        }
        debugPrint("清理后的缓存大小:\(self.cacheData())")
    }
    
}
