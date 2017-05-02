//
//  File.swift
//  new_test2
//
//  Created by 张皓 on 2017/5/1.
//  Copyright © 2017年 Darcy. All rights reserved.
//

import Foundation

class Stack {
    
    //private
    var stack: [AnyObject]  //应该定义为私有变量
    
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
        print("destoryed(栈被销毁)")
    }
    
    
}
