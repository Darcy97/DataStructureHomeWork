//
//  main.swift
//  Swift_Queue
//
//  Created by 张皓 on 2017/4/30.
//  Copyright © 2017年 Darcy. All rights reserved.
//

import Foundation



/// 数组实现队列
class Queue {
    
    private var queue: [AnyObject]     //定义应该为私有变量， 外部只可以通过public方法操            作队列中的元素，不可以直接访问

    init() {
        
        queue = [AnyObject]()
    }
    
    func enqueue(object:AnyObject) {
        
        queue.append(object)
    }
    
    func dequeue() -> AnyObject? {
        
        if !isEmpty() {
            
            return queue.removeFirst()
        } else {
            
            return nil
        }
    }
    
    func isEmpty() -> Bool {
        
        return queue.isEmpty
    }

    func peek() -> AnyObject?
    {
        
        return queue.first
    }
    
    func size() -> Int {
        
        return queue.count
    }
    
    func clear() {
        queue.removeAll(keepingCapacity: true)
    }
    
    //销毁队列
    public static func destroy(queue: inout Queue?) {
        
        queue = nil
    }
    
    //类被销毁时调用
    deinit {
        print("destoryed")
    }
    
}

var myQueue:Queue? = Queue.init()

myQueue?.enqueue(object: "hello world" as AnyObject)
myQueue?.enqueue(object: "hello swift" as AnyObject)
myQueue?.enqueue(object: "hello queue" as AnyObject)

print(myQueue?.peek()!)
print(myQueue?.size())

print(myQueue?.dequeue()!)
print(myQueue?.peek()!)
print(myQueue?.size())

myQueue?.clear()

Queue.destroy(queue: &myQueue)




