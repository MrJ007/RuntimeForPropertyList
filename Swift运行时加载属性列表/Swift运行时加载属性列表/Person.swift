//
//  Person.swift
//  Swift运行时加载属性列表
//
//  Created by James on 2017/5/24.
//  Copyright © 2017年 James. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String?
    
    var age:Int = 0;
    
    var title: String?
    
    //基本数据类型，在OC中没有可选，如果定义可选，运行时同样获取不到，使用KVC就会崩溃
    var height:Int?
    
    //private 修饰的属性同样获取不到
    private var score:Int?

    
    //使用运行时获取属性列表
    class func propertyList() ->[String] {
        var count:UInt32 = 0
        
        let list = class_copyPropertyList(self,&count) //返回可选的数组
        
        for i in 0..<Int(count) {
            let pty = list?[i]
            
            //获取属性的名称
            //UnsafePointer<Int8>?
            let cName =  property_getName(pty)  //C字符串
//            print(cName)
            
//            let name = String(cString: cName!, encoding: .utf8)
            let name = String(utf8String: cName!)
            //name: String?
            print(name ?? "")
        }
        
        free(list)
       
        return []
    }
    
    //使用运行时获取属性列表
    class func propertyListNew() ->[String] {
        var count:UInt32 = 0
        
        let list = class_copyPropertyList(self,&count) //返回可选的数组
        
        for i in 0..<Int(count) {
            //使用guard语法，一次判断每一项是否有值，一旦有一项为nil,就不再执行后面的代码
            guard let pty = list?[i] ,
                 let cName =  property_getName(pty) ,
                 let name = String(utf8String: cName)

            else {
                continue
            }

            print(name)//到这里已经确认name有值
        }
        
        free(list)
        
        return []
    }

}
