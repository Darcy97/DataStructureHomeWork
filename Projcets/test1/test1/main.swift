//
//  main.swift
//  test1
//
//  Created by 张皓 on 2017/4/24.
//  Copyright © 2017年 Darcy. All rights reserved.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    var index: Int?
    init(_ val:Int ) {
        self.val = val
        self.next = nil
    }
}

class List {
    var head : ListNode?
    var tail: ListNode?
    
    /// 尾插法
    ///
    /// - parameter val: 值
    func appendToTail(val: Int) {
        if tail == nil {
            tail = ListNode(val)
            tail?.index = 0
            head = tail!
        } else {
            tail!.next = ListNode(val)
            tail?.next?.index = (tail?.index)! + 1
            tail = tail!.next

        }
    }
    /// 头插法
    ///
    /// - parameter val: 值
    func appendToHead(val: Int) {
        if head == nil {
            head = ListNode(val)
            tail = head
        } else {
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }
}

func printList(list:List) {
    var node = list.head
    while node != nil {
        print((node?.val)!)
        node = node?.next
    }
}

func getInputInt() -> Int{
    
    let input = String(data: FileHandle.standardInput.availableData, encoding: String.Encoding.utf8)
    
    var result:Int? = nil
    if let str = input {
        let index = str.index(str.endIndex, offsetBy: -1) //去掉最后一个换行符
        result = Int(str.substring(to: index))
        
    }
        
    if result != nil{
        return result!
    } else{
        
        print("🙃🙃🙃🙃🙃🙃🙃输入错误， 请重新输入🙃🙃🙃🙃🙃🙃🙃")
        return getInputInt();
    }
}

func createList(length: Int) -> List{
    
    let result = List()
    
    for item in 0..<length{
        print("Please input the num\(item+1) node")
        result.appendToTail(val: Int(getInputInt()))
    }

    return result
}

func adjMax(length: Int, num: Int, list: List) -> ListNode{
    var result: ListNode = list.head!
    
    var currentNode = list.head
    var lastSum = 0
    
    for _ in 0..<num {
        lastSum += (currentNode?.val)!
        currentNode = currentNode?.next
    }
    
    currentNode = list.head
    var currentSumNode: ListNode?
    var currentSum = 0
    for _ in 0...(length-num) {
        
        currentSumNode = currentNode
        
        for _ in 0..<num{
            currentSum += (currentSumNode?.val)!
            currentSumNode = currentSumNode?.next
        }
        
        if currentSum>lastSum {
            lastSum = currentSum
                        if currentNode != nil {
                result = currentNode!
            }
        }
        
        currentNode = currentNode?.next
        currentSum = 0
    }
    
    return result
}

func main(){
    //输入长度
    print(("🙃🙃🙃🙃🙃🙃🙃Please input length of the list🙃🙃🙃🙃🙃🙃🙃"))
    var  length = 0
    length = getInputInt()
    
    if length <= 0 {
        print("🙃🙃🙃🙃🙃🙃🙃长度有误，请重新输入🙃🙃🙃🙃🙃🙃")
        length = getInputInt()
    }
    
    
    //输入链表
    let list = createList(length: length)
    //输出
    print("🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃确认🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃")
    printList(list: list)
    
    print("😆😆😆😆😆😆😆😆😆😆😆😆请输入k值😆😆😆😆😆😆😆😆😆😆😆😆😆")
    var k = getInputInt()
    if k <= 0 {
        print("🙃🙃🙃🙃🙃🙃🙃错误，请重新输入🙃🙃🙃🙃🙃🙃")
        k = getInputInt()
    } else if k > length {
        print("🙃🙃🙃🙃🙃🙃🙃错误，请重新输入🙃🙃🙃🙃🙃🙃")
        k = getInputInt()
    }
    
    let result = adjMax(length: length, num: k, list: list)
    
    print("😆😆😆😆😆😆😆😆😆😆😆😆result😆😆😆😆😆😆😆😆😆😆😆😆😆")
    print("index: \(result.index!+1), data:\(result.val)")
    
    

    
    print("🙃🙃🙃🙃🙃🙃🙃Do you want to restart?🙃🙃🙃🙃🙃🙃🙃")
    print("input 1 and press enter will restart , input 0 and enter press will end")
    let bool = getInputInt()
    if bool == 1 {
        main()
    }
    
}

main()










