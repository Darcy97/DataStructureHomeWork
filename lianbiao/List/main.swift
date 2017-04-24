//
//  main.swift
//  linked list
//
//  Created by 张皓 on 2017/3/7.
//  Copyright © 2017年 Darcy. All rights reserved.
//

class ListNode {
    var val: Int
    var next: ListNode?
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
            head = tail!
        } else {
            tail!.next = ListNode(val)
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

var la = List()  // 1 3 5 7 9
var lb = List()  // 2 4 5 8 9
func createTwoList(a:[Int], b:[Int]){
    la = List()
    lb = List()
    la.appendToTail(val: a[0])
    la.appendToTail(val: a[1])
    la.appendToTail(val: a[2])
    la.appendToTail(val: a[3])
    la.appendToTail(val: a[4])
    
    lb.appendToTail(val: b[0])
    lb.appendToTail(val: b[1])
    lb.appendToTail(val: b[2])
    lb.appendToTail(val: b[3])
    lb.appendToTail(val: b[4])
}
let arr_la = [1,3,5,7,9]
let arr_lb = [2,4,5,8,9]
createTwoList(a: arr_la, b: arr_lb)

//*******************************第一题  相减************************************
func LaSubLb(la:List, lb:List) -> List{
    var nodeA = la.head
    var nodeB = lb.head
    let resultList = List()
    while nodeA != nil {
        while nodeB != nil {
            if nodeA?.val == nodeB?.val {
                break
            } else {
                nodeB = nodeB?.next
            }
            if nodeB == nil {
                resultList.appendToTail(val: (nodeA?.val)!)
                break
            }
        }
        nodeA = nodeA?.next
        nodeB = lb.head
    }
    return resultList
}

//la 与 lb 的交集
func theIntersectionOfLaAndLb(la:List, lb:List) -> List{
    var nodeA = la.head
    var nodeB = lb.head
    let resultList = List()
    while nodeA != nil {
        while nodeB != nil {
            if nodeA?.val == nodeB?.val {
                resultList.appendToTail(val: (nodeA?.val)!)
                break
            } else {
                nodeB = nodeB?.next
            }
        }
        nodeA = nodeA?.next
        nodeB = lb.head
    }
    return resultList
}

let result1 = LaSubLb(la: la, lb: lb)
let result2 = theIntersectionOfLaAndLb(la: la, lb: lb)

print("**********************  此处输出第一题结果 *********************************")
print("******************************* La **********************************")
printList(list: la)
print("******************************* Lb **********************************")
printList(list: lb)
print("*******************  result of Intersection  *************************")
printList(list: result1)
print("***********************  result of La-Lb  ****************************")
printList(list: result2)

//*******************************第三题  相减************************************
func findNodeFromANode(list:List, FromNode: Int, data:Int) -> ListNode? {
    
    var node: ListNode? = list.head;
    while node != nil {
        if node?.val == FromNode {
            while node != nil {
                if node?.val == data {
                    return node!
                }
                node = node!.next
            }
            return nil
        }
        node = node!.next
    }
    return nil
}
// 0  2  3  7  4  3  2
let head = ListNode(0)
let list = List();
list.appendToTail(val: 0)
list.appendToTail(val: 2)
list.appendToTail(val: 3)
list.appendToTail(val: 7)
list.appendToTail(val: 4)
list.appendToTail(val: 3)
list.appendToTail(val: 2)
print("********************* 此处输出第三题结果 ****************************")
print("*********************   此处输出链表   ****************************")
printList(list: list)
let result3 = findNodeFromANode(list: list, FromNode: 2, data: 4)
print("*********************   此处输出结果   ****************************")
print((result3?.val)!)

//**********************************第四题***************************************

func isEqual(la: List, lb:List) -> Bool {
    
    var nodeA = la.head
    var nodeB = lb.head
    
    while nodeA != nil && nodeB != nil{
        if nodeA?.val != nodeB?.val {
            return false
        } else if (nodeB?.next == nil && nodeA?.next == nil){
            return true
        }
        nodeA = nodeA?.next
        nodeB = nodeB?.next
    }
    return false
}
print("********************* 此处输出第四题结果 ****************************")
createTwoList(a: [1, 2, 3, 4, 5], b: [1, 2, 3, 4, 5])
//lb.appendToTail(val: 9)
print("********************* 链表A ****************************")
printList(list: la)
print("********************* 链表B ****************************")
printList(list: lb)
print("********************** 结果 ****************************")
print(isEqual(la: la, lb: lb))

//**********************************第二题***************************************
enum Sex{
    case Man
    case Woman
}

class ListNodeOfStudent{
    var s_no: Int
    var s_sno: String
    var s_name: String
    var s_sex: Sex
    var s_class: String
    init(_ no: Int, sno: String, name: String, sex:Sex, cla: String) {
        self.s_no = no
        self.s_sno = sno
        self.s_name = name
        self.s_sex = sex
        self.s_class = cla
    }
    var next:ListNodeOfStudent?
}

class ListOfStu {
    var head : ListNodeOfStudent?
    var tail: ListNodeOfStudent?
    
    /// 尾插法
    ///
    /// - parameter val: 值
    func appendToTail(node: ListNodeOfStudent) {
        if tail == nil {
            tail = node
            head = tail!
        } else {
            tail!.next = node
            tail = tail!.next
        }
    }
    
    /// 头插法
    ///
    /// - parameter val: 值
    func appendToHead(node: ListNodeOfStudent) {
        if head == nil {
            head = node
            tail = head
        } else {
            let temp = node
            temp.next = head
            head = temp
        }
    }
}

func printStuList(list:ListOfStu) {
    var node = list.head
    while node != nil {
        print((node?.s_sno)!)
        node = node?.next
    }
}

//   insert student x
func insertStudentInList(list: ListOfStu, stu: ListNodeOfStudent){
    var stu_node = list.head
    var stu_node_pre:ListNodeOfStudent? = nil
    
    while stu_node != nil {
        if stu.s_no < (stu_node?.s_no)! {
            stu_node_pre?.next = stu
            stu.next = stu_node
            break
        }
        stu_node_pre = stu_node
        stu_node = stu_node?.next
        if stu_node == nil {
            stu_node_pre?.next = stu
        }
    }
}
let stu_x = ListNodeOfStudent.init(11, sno: "J00011", name: "darcy", sex: .Woman, cla: "计02")

//生成测试链表
let student_list = ListOfStu()
for item in 1...10 {
    student_list.appendToTail(node: ListNodeOfStudent.init(
        item, sno: "J000"+String(item), name: "Darcy", sex: Sex.Man, cla: "计02"))
}

for item in 12...20 {
    student_list.appendToTail(node: ListNodeOfStudent.init(
        item, sno: "J000"+String(item), name: "Darcy", sex: Sex.Man, cla: "计02"))
}
print("********************* 此处输出第二题结果 ****************************")
print("********************* 此处输出插入前的表 ****************************")
printStuList(list: student_list)

insertStudentInList(list: student_list, stu: stu_x)

print("********************* 此处输出结果 ****************************")
printStuList(list: student_list)






