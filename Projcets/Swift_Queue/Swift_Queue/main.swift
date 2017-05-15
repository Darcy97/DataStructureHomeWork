//
//  main.swift
//  Swift_Queue
//
//  Created by 张皓 on 2017/4/30.
//  Copyright © 2017年 Darcy. All rights reserved.
//

import Foundation

var myQueue:Queue? = Queue.init()

func main(){
    
    let input = getInput()
    
    switch input {
    case "0":
        if let a = myQueue?.dequeue(){
            print(a)
        } else {
            print("当前队列为空")
        }
        main()
        break
    case "@":
        myQueue?.dequeueAllAndPrint()
        break
    default:
        myQueue?.enqueue(object: input as AnyObject)
        main()
        break
    }
    
    myQueue?.clear()
    Queue.destroy(queue: &myQueue)

}

main()

//var myQueue:Queue? = Queue.init()
//
//myQueue?.enqueue(object: "hello world" as AnyObject)
//myQueue?.enqueue(object: "hello swift" as AnyObject)
//myQueue?.enqueue(object: "hello queue" as AnyObject)
//
//print(myQueue?.peek()!)
//print(myQueue?.size())
//
//print(myQueue?.dequeue()!)
//print(myQueue?.peek()!)
//print(myQueue?.size())
//
//myQueue?.clear()
//
//Queue.destroy(queue: &myQueue)
//
//let input = getInput()
//print(input)

//
//
