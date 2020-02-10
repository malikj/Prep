//
//  Repeative.swift
//  ArrayInDetail
//
//  Created by malikj on 04/11/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import Foundation

class Repeative {
    
    
    

    // Given an array of integers, find the first repeating element in it. We need to find the element that occurs more than once and whose index of first occurrence is smallest.
    
    // Use Hashing to solve this in O(n) time on average.
    static func FindFirstRepeatingElement(){
        
        let a = [10, 5, 3, 4, 3, 5, 6];
        var min = -1;
                
        var set = Set<Int>()

        for i in (0 ..< a.count).reversed() {
            print(i) // 4,3,2,1,0
            
            if(set.contains(a[i])){
                min = i;
            }
            else {
                set.insert(a[i])
            }
        }
        
        // this is not working correctly
//        for i in stride(from:a.count-1, to:0, by:-1) {
//            if(set.contains(a[i])){
//                min = i;
//            }
//            else {
//                set.insert(a[i])
//            }
//        }
        
        if (min != -1) {
            print("The first repeating element is \( a[min])")
        }
        else {
            print("No repeating element is")

        }

    }
    
    static func FindFirstNonRepeatingElement(){
           
           let a = [10, 5, 3, 4, 3, 5, 6];
           var min = -1;
                   
           var set = Set<Int>()
        
           for i in (0 ..< a.count).reversed() {

            print("value \(a[i])");
               if(!set.contains(a[i])){
                set.insert(a[i])
                min = i;
               }

           }
           
           if (min != -1) {
               print("The first non repeating element is \( a[min])")
           }
           else {
               print("No repeating element is")

           }

       }
}


