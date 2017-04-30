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

func throwError(){
    
    print("🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃error🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃")
    print("the string you input is invalid")
}

func transfer(str: String) -> String {
    
    var result = ""
    
    var operators: [Character] = []
    var numbers: [Int] = []
    
    var lastIndex = 0
    var currentIndex = 0
    
    for (index, character) in str.characters.enumerated(){
        for (_index, _operator) in operatorArr.enumerated(){
            if character == _operator{
                currentIndex = index
                
                if _index == 4{   //判断符号是否为小括号
                    
                    lastIndex = currentIndex+1
                    //str.subString(with: (start: lastIndex, end: currentIndex))
                    break
                }
                
                if _index == 5 {
                    let item = str.subString(with: (start: lastIndex, end: currentIndex))
                    result.append("'" + transfer(str: item))
                    break
                }
                
                if let item = Int(str.subString(with: (start: lastIndex, end: currentIndex))){
                    result.append("," + String(item))
                    numbers.append(item)
                    operators.append(_operator)
                } else {
                    throwError()
                    return "null"
                }
                
                lastIndex = currentIndex+1
                break
            } else if index == str.characters.count - 1{
                
                if let item = Int(str.subString(with: (start: lastIndex, end: str.characters.count))){
                    
                        result.append("," + String(item))
                } else {
                    throwError()
                    return "null"
                }
                
                for item in operators {
                    result.append(item)
                }
                
                print(str)
                
                print(numbers)
                print(operators)
                return result.substring(from:str.index(str.startIndex, offsetBy: 1)
)   //正确执行从这里返回值 结束该函数
            }
        }
    }
    
    
    
    return "error"
}

print(transfer(str: "12+23*45+12"))



for i in 1...10 {
    if i>2 {
        print("two")
        break
    }
    
    print(i)
    
    if i>5 {
        print("five")
        break
    }
}

