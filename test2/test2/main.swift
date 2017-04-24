//
//  main.swift
//  test2
//
//  Created by 张皓 on 2017/4/24.
//  Copyright © 2017年 Darcy. All rights reserved.
//

//// 循环遍历字符串， 若找到特殊字符  从这个字符截取到上一个特殊字符 存储到数据数组中  字符保存到另一个数组中



import Foundation

let operatorArr:[Character] = ["+", "-", "*", "/", "(", ")"]

func transfer(str: String) -> String {
    
    var operators: [Character] = []
    var numbers: [Int] = []
    
    var lastIndex = 0
    var currentIndex = 0
    
    
    for (index, character) in str.characters.enumerated(){
        for (_operator) in operatorArr{
            if character == _operator{
                currentIndex = index
                
                //先转换为NSString 再截取
                /*let strNew:NSString = str as NSString
                numbers.append(Int(
                    strNew.substring(with:
                        NSMakeRange(
                            lastIndex,
                            currentIndex - lastIndex)))!)*/
  
                let startIndex = str.index(str.startIndex, offsetBy: lastIndex)
                let endIndex = str.index(str.startIndex, offsetBy: currentIndex)
                
                numbers.append(Int(
                    str.substring(with:
                        Range.init(uncheckedBounds:
                            (lower: startIndex,
                             upper: endIndex))))!)
                operators.append(_operator)
                
                lastIndex = currentIndex
            }
        }
    }
    return "ull"
}




//
//var str = "Hello, playground"
//
//for (index, character) in str.characters.enumerated(){
//    for (index, _operator) in operatorArr.enumerated(){
//        if character == _operator{
//            
//        }
//    }
//        
//    
//}
