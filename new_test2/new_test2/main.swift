//
//  main.swift
//  new_test2
//
//  Created by 张皓 on 2017/4/25.
//  Copyright © 2017年 Darcy. All rights reserved.
//

//// 循环遍历字符串， 若找到特殊字符  从这个字符截取到上一个特殊字符 存储到数据数组中  字符保存到另一个数组中



import Foundation

let operatorArr:[Character] = ["+", "-", "*", "/", "(", ")"]

//扩展字符串添加截取方法 方便使用
extension String {
    func subString(with:(start: Int,end: Int)) -> String {
        let str = self
        
        let startIndex = str.index(str.startIndex, offsetBy: with.start)
        let endIndex = str.index(str.startIndex, offsetBy: with.end)
        
        
        
        return str.substring(with:
            Range.init(uncheckedBounds:
                (lower: startIndex,
                 upper: endIndex)))
    }
}

//字符串截取方法
func subString(_ str: String,range: (start: Int,end: Int) ) -> String {
    
    let startIndex = str.index(str.startIndex, offsetBy: range.start)
    let endIndex = str.index(str.startIndex, offsetBy: range.end)
    
    return str.substring(with:
        Range.init(uncheckedBounds:
            (lower: startIndex,
             upper: endIndex)))
    
    
}

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
                
                let item = str.subString(with: (start: lastIndex, end: currentIndex))
                
                numbers.append(Int(item)!)
                    
                    operators.append(_operator)
                
                lastIndex = currentIndex+1
            } else if index == str.characters.count - 1{
                
            }
        }
    }
    
    print(str.characters)
    
    print(numbers)
    print(operators)
    return "ull"
}

let result = transfer(str: "12+12*23+12")
let str = "12+12*23+12"

let startIndex = str.index(str.startIndex, offsetBy: 1)
let endIndex = str.index(str.startIndex, offsetBy: 3)

print(str.substring(with: Range.init(uncheckedBounds: (lower: startIndex, upper: endIndex))))


