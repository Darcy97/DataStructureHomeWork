//
//  main.swift
//  Swift_Stack
//
//  Created by 张皓 on 2017/4/30.
//  Copyright © 2017年 Darcy. All rights reserved.
//

import Foundation

/// 使用数组定义栈
class Stack {
    private var stack: [AnyObject]  //应该定义为私有变量
    
    init() {
        stack = [AnyObject]()
    }
    
    func push(object: AnyObject) {
        stack.append(object)
    }
    
    func pop() -> AnyObject? {
        if !isEmpty() {
            return stack.removeLast()
        } else {
            return nil
        }
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    func peek() -> AnyObject? {
        return stack.last
    }
    
    func size() -> Int {
        return stack.count
    }
    
    func clear() {
        stack.removeAll(keepingCapacity: true)
    }
    
    //销毁栈
    public static func destroy( stack: inout Stack?) {
        
        stack = nil
    }
    
    //类被销毁时调用
    deinit {
        print("destoryed")
    }
    
}


var myStack:Stack? = Stack.init()

myStack?.push(object: "hello" as AnyObject)

myStack?.push(object: "hello swift" as AnyObject)

myStack?.push(object: "hello stack" as AnyObject)

print(myStack?.isEmpty())
print(myStack?.pop()!)
print(myStack?.peek()!)
print(myStack?.size())
print(myStack?.isEmpty())

myStack?.clear()

Stack.destroy(stack: &myStack)





