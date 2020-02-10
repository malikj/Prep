//
//  Rotate.swift
//  ArrayInDetail
//
//  Created by malikj on 16/11/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import Foundation

class Rotate {
    
    static func rotateSingleLeft() {
        
        var chars = [1, 2, 3, 4, 5]
        // alway use this
        let first = chars.first!
        for i in 0..<chars.count - 1 {
            chars[i] = chars[i + 1]
        }
        chars[chars.count - 1] = first
        print("left rotate \(chars)")
        
    }
    
    // https://www.geeksforgeeks.org/program-decimal-binary-conversion/
    // a[i] = n%2, n = n/2
    static func decToBinary() {
        var binaryNum : [Int] = []
    
        var i = 0;
        
        var n = 10;
        
        while (n > 0) {
            binaryNum[i] = n%2;
            n = n / 2;
            i = i+1;
        }
        
        for i in (0..<n).reversed() {
            print(binaryNum[i])
        }

    }

    
    /*
     
     void decToBinary(int n)
     {
         // array to store binary number
         int binaryNum[32];
       
         // counter for binary array
         int i = 0;
         while (n > 0) {
       
             // storing remainder in binary array
             binaryNum[i] = n % 2;
             n = n / 2;
             i++;
         }
       
         // printing binary array in reverse order
         for (int j = i - 1; j >= 0; j--)
             cout << binaryNum[j];
     }
     */
    
//    func rotateSingleRight(_ input : inout [Int]) {
//
//          var chars = [1, 2, 3, 4, 5]
//        //        left rotate [2, -2, -20, 10, 10]
//
//
//        //        left rotate [2, -2, -20, 10, 10]
//        guard chars.count > 1 else { return  }
//        // alway use this
//        let last = chars[chars.count - 1]
//        for i in (1..<chars.count).reversed() {
//            chars[i] = chars[i - 1]
//        }
//        chars[0] = last
//        print("right rotate \(chars)")
//    }
    
  static  func rotateSingleRight() {
          
    var chars = [1, 2, 3, 4, 5]
    guard chars.count > 1 else { return  }
    // alway use this
    
    // d = 1, right rotate [5, 1, 2, 3, 4]
    // d = 2,  right rotate [4, 5, 1, 2, 3]

    let d = 2;
    for _ in 1...d {
        let last = chars[chars.count - 1]
        for i in (1..<chars.count).reversed() {
//            print("reverse i \(i)")
            chars[i] = chars[i - 1]
        }
        chars[0] = last
    }
    print("right rotate \(chars)")
    
    }

}

