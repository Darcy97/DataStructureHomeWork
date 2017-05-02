//
//  main.swift
//  new_test2
//
//  Created by 张皓 on 2017/4/25.
//  Copyright © 2017年 Darcy. All rights reserved.
//

//// 循环遍历字符串， 若找到特殊字符  从这个字符截取到上一个特殊字符 存储到数据数组中  字符保存到另一个数组中



import Foundation

let trans = Transfer()

func main(){
    print("🤔🤔🤔🤔🤔🤔🤔🤔请输入一个正确的中缀表达式🤔🤔🤔🤔🤔🤔🤔🤔")
    
    print(trans.transfer(str: getInput()))
    
    endOrContinue()
}


func endOrContinue(){
    
    print("end or continue you can input end or continue and press enter")
    
    let str:String = getInput()
    
    if str == "continue" {
        main()
    } else if str == "end" {
        return
    } else {
        ErrorManager.invalid()
        endOrContinue()
    }
}

main()




