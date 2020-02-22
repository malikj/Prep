//
//  Stack.swift
//  ArrayInDetail
//
//  Created by malikj on 10/02/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation

class Stack<T> {
    
    private var array = [T]()
    
    func push (_ element :T) {
        array.append(element)
    }
    
    func pop () -> T? {
        return array.popLast()
    }
    
    func top () ->T? {
        return array.last
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    func returnAllValues ()-> [T] {
        return array
    }
    
    func validParanthesis () {
        
    }
}
