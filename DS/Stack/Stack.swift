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

class ValidParenthesis {

    func isValid2(_ s: String) -> Bool {
        
        var array = [String]()
        let dict = [")":"(", "]":"[", "}":"{"]
        
        for element in s {
            
            if dict.values.contains(String(element)) {
                array.append(String(element))
                continue
            } else if array.count > 0 && String(array.removeLast()) != dict[String(element)] {
                return false
            }
        }
        return array.count == 0 ? true : false
    }
    
    static let map: [Character: Character] = [
        "}": "{",
        "]": "[",
        ")": "("
    ]

   static func isValid(s: String) -> Bool {
        var stack: [Character] = []

        for char in s {
            if "{[(".contains(char) {
                stack.append(char)
            } else {
                if stack.last == ValidParenthesis.map[char] {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }

        return stack.isEmpty
    }

    static func test() {
        print(isValid(s: "()[]{}"))
        print(isValid(s: "({"))
        print(isValid(s: "{[]}"))
    }
    
    /*
    * NO.678
    * Given a string containing only three types of characters: '(', ')' and '*', write a function to
    * check whether this string is valid. We define the validity of a string by these rules:
    *
    * 1. Any left parenthesis '(' must have a corresponding right parenthesis ')'.
    * 2. Any right parenthesis ')' must have a corresponding left parenthesis '('.
    * 3. Left parenthesis '(' must go before the corresponding right parenthesis ')'.
    * 4. '*' could be treated as a single right parenthesis ')' or a single left parenthesis
    *    '(' or an empty string.
    * 5. An empty string is also valid.
    */
    
    // Reverse String
    
    // Search Insert Position
    
    // Reverse Words
    
    // Generate Parathesis
    
    // String - valid paranthesis
    
    // Permutaion
    
    // Anagram
    
    // Longest polindrimic substring
    
  static  func checkValidString(_ s: String) -> Bool {
        var a = 0, b = 0
        for c in s {
            if c == "(" {
                a += 1
                b += 1
            } else if c == ")" {
                a -= 1
                b -= 1
            } else {
                a -= 1
                b += 1
            }
            a = max(0, a)
            if b < 0 {
                return false
            }
        }
        return a == 0
    }

}
