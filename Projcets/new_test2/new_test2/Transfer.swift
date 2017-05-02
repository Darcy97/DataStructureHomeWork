//
//  Transfer.swift
//  new_test2
//
//  Created by 张皓 on 2017/5/1.
//  Copyright © 2017年 Darcy. All rights reserved.
//

import Foundation

enum Operator:Character {
    case plus = "+"
    case subtract = "-"
    case multi = "*"
    case divide = "/"
    case lBracket = "("
    case rBracket = ")"
}



class Transfer {
    
    let operatorArr:[Character] = ["+", "-", "*", "/", "(", ")"]
    
    public func transfer(str: String) -> String {
        
        print(str)
        
        if str.characters.count == 0 {
            ErrorManager.null()
            return "error"
        }
        
        let operatorStack = Stack()  // s1
        let tempStack = Stack()      // s2
        
        
        var lastIndex = 0
        var currentIndex = 0
        
        for (index, character) in str.characters.enumerated(){
            for _operator in operatorArr{
                if character == _operator{
                    currentIndex = index
                    if lastIndex != 0{
                        let tempstr = str.subString(with: (start: lastIndex-1, end: lastIndex)).characters.first
//                        print(tempstr)
                    }
                    if lastIndex == 0{
                        if let item = Int(str.subString(with: (start: lastIndex, end: currentIndex))){
                            
                            tempStack.push(object: item as AnyObject)
                            
                            //                        result.append("," + String(item))
                            //                        numbers.append(item)
                            //                        operators.append(_operator)
                        } else {
                            ErrorManager.invalid()
                            return "error"
                        }

                    } else if _operator != Operator.lBracket.rawValue &&
                         str.subString(with: (start: lastIndex-1, end: lastIndex)).characters.first != Operator.rBracket.rawValue{
                        if let item = Int(str.subString(with: (start: lastIndex, end: currentIndex))){
                            
                            tempStack.push(object: item as AnyObject)
                            
                            //                        result.append("," + String(item))
                            //                        numbers.append(item)
                            //                        operators.append(_operator)
                        } else {
                            ErrorManager.invalid()
                            return "error"
                        }
                    } else {
                        if let _ = Int(str.subString(with: (start: lastIndex, end: currentIndex))){
                            ErrorManager.invalid()
                            return "error"
                        }
                    }
                    
                    switch _operator {
                        
                    case Operator.lBracket.rawValue:    // 为"(" 时直接将运算符压入operatorstack
                        operatorStack.push(object: _operator as AnyObject)
                        break
                        
                    case Operator.rBracket.rawValue:  //")" 时依次弹出oper中的元素到temp中直到找到左括号 同时弃掉两个括号
                        
                        while operatorStack.peek() as! Character != Operator.lBracket.rawValue {
                            tempStack.push(object: operatorStack.pop()!)
                        }
                        _ = operatorStack.pop()
                        break
                        
                    default:
                        var run = true
                        while run {
                            
                            if operatorStack.isEmpty() || (operatorStack.peek() as! Character) == Operator.lBracket.rawValue{
                                
                                operatorStack.push(object: _operator as AnyObject)
                                run = false
                                
                            } else if _operator == Operator.plus.rawValue || _operator == Operator.subtract.rawValue{
                                
                                tempStack.push(object: operatorStack.pop()!)
                                
                            } else if
                                operatorStack.peek() as! Character == Operator.plus.rawValue ||
                                    operatorStack.peek() as! Character == Operator.subtract.rawValue{
                                
                                operatorStack.push(object: _operator as AnyObject)
                                run = false
                            } else {
                                
                                tempStack.push(object: operatorStack.pop()!)
                            }
                        }
                    }
                    
                    lastIndex = currentIndex+1
                    break
                } else if index == str.characters.count - 1{
                    
                    if let item = Int(str.subString(with: (start: lastIndex, end: str.characters.count))){
                        
                        operatorStack.push(object: item as AnyObject)
//                        result.append("," + String(item))
                    } else {
                        ErrorManager.invalid()
                        return "null"
                    }
                    
                    while !operatorStack.isEmpty() {
                        tempStack.push(object: operatorStack.pop()!)
                    }
                    

                    while !tempStack.isEmpty() {
                        operatorStack.push(object: tempStack.pop()!)
                        
                    }
                    
                    while !operatorStack.isEmpty() {
                        print(operatorStack.pop()!)
                    }
                    
                    return "complete"
                }
            }
        }
        
        return "error"
    }
}
