//
//  String+Extension.swift
//  Swift-Extension
//
//  Created by 路政浩 on 2016/11/15.
//  Copyright © 2017年 RamboLu. All rights reserved.
//

import Foundation

extension String{
    
    /// 判断用户输入的手机号是否正确
    ///
    /// - Returns: 返回是否相同
    public func isTelNumber()->Bool{
        
        /// 手机号码:
        /// 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[0, 1, 6, 7, 8], 18[0-9]
        /// 移动号段: 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
        /// 联通号段: 130,131,132,145,155,156,170,171,175,176,185,186
        /// 电信号段: 133,149,153,170,173,177,180,181,189
        let MOBILE = "^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$"
        
        /// 中国移动：
        /// 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
        let  CM = "^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$"
        
        /// 中国联通：
        /// 130,131,132,145,155,156,170,171,175,176,185,186
        let  CU = "^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$"
        
        /// 中国电信：
        /// 133,149,153,170,173,177,180,181,189
        let  CT = "^1(3[3]|4[9]|53|7[037]|8[019])\\d{8}$"
        
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",MOBILE)
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluate(with: self) == true)
            || (regextestcm.evaluate(with: self)  == true)
            || (regextestct.evaluate(with: self)  == true)
            || (regextestcu.evaluate(with: self)  == true))
        {
            return true
        }else{
            return false
        }
    }
    
    /// 判断用户输入是否是数字
    ///
    /// - Returns: 返回是否数字
    public func isNumber()->Bool{
        let NUM = "^[0-9]*$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",NUM)
        if (regextestmobile.evaluate(with: self) == true){
            return true
        }else{
            return false
        }
    }
    
    /// 判断两个字符串是否相同
    ///
    /// - Parameter str: 比较的字符串
    /// - Returns: 返回是否相同
    public func isEqualToStr(_ str:String) -> Bool{
        
        if (self as NSString).isEqual(to: str){
            return true
        } else {
            return false
        }
    }
    
    /// 判断字符串的长度是否大于0
    ///
    /// - Returns: 不是空字符串就返回true  是空的就返回 false
    public func isQaulity()->Bool {
        if self.characters.count > 0 {
            return true
        } else {
            return false
        }
    }
    
    /// 换换字节
    ///
    /// - Parameter value: 字节大小
    /// - Returns: 返回转换后字节
    public func transformedValue(_ value:Int) -> String {
        var transformedValue = Double(value)
        var index = 0
        let tokens = ["bytes","KB","MB","GB","TB","PB", "EB", "ZB", "YB"]
        while transformedValue > 1024 {
            transformedValue = transformedValue / 1024
            index = index + 1
        }
        return String(format: "%4.2f", transformedValue) + tokens[index]
    }
    
}
