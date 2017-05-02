//
//  GetInput.swift
//  new_test2
//
//  Created by 张皓 on 2017/5/1.
//  Copyright © 2017年 Darcy. All rights reserved.
//

import Foundation

func getInput() -> String{
    
    print("🤔🤔:")
    
    let input = String(data: FileHandle.standardInput.availableData, encoding: String.Encoding.utf8)
    
    var result:String? = nil
    if let str = input {
        
        let index = str.index(str.endIndex, offsetBy: -1) //去掉最后一个换行符
        result = str.substring(to: index)
    }
    
    if result != nil{
        return result!
    } else{
        
        print("🙃🙃🙃🙃🙃🙃🙃输入为空， 请重新输入🙃🙃🙃🙃🙃🙃🙃")
        return getInput();
    }
}
