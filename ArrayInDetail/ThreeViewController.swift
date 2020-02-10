//
//  ThreeViewController.swift
//  ArrayInDetail
//
//  Created by malikj on 28/10/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LongestConsecutiveSequence();
        
    }
    
    
      func LongestConsecutiveSequenceTwo(){
            
    //        For example,
    //        Given [100, 4, 200, 1, 3, 2],
    //        The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.
            
            let inputArray = [4, 2, 4, 5, 2, 3, 1]
            
            var LISSize = 1;
            var LISIndex = 0;
            
            var dictionary : [Int:Int] = [:]
        
        var set = Set<Int>()

        
//        var set : [Int:Int] = [:]
//
//
//        var ans = 0;
//        for i in 0..<inputArray.count {
//            set.insert(inputArray[i])
//        }
//
//
//        for i in 0..<inputArray.count {
////            set.insert(inputArray[i])
//            if(set.contains(inputArray[i] - 1)) {
//                var j = inputArray[i];
//
//                while set.contains(j) != nil {
//                    j = j+1
//                }
//
//            }
//        }
            // iterate through array and find
            // end index of LIS and its Size
            
           for i in 1..<inputArray.count {
            
            dictionary[inputArray[i]] =  dictionary[inputArray[i] - 1]! + 1;
            if (LISSize < dictionary[inputArray[i]]!) {
                LISSize = dictionary[inputArray[i]]!;
                LISIndex = inputArray[i];
            }
            
            }
            
            print ("lis size \(LISSize)");
            var start = LISIndex - LISSize + 1;
            while start <= LISIndex {
                print (start);
                start = start + 1;
            }

        }
    
    // find length of longest consecutive sequence in array of integers
    
    // check this only https://www.geeksforgeeks.org/longest-consecutive-subsequence/
    // below is difficult
    func LongestConsecutiveSequence(){
        
//        For example,
//        Given [100, 4, 200, 1, 3, 2],
//        The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.
        
        let inputArray = [4, 2, 4, 5, 2, 3, 1]
        
        var LISSize = 1;
        var LISIndex = 0;
        
        var dictionary : [Int:Int] = [:]
        
        dictionary[inputArray[0]] = 1;

        // iterate through array and find
        // end index of LIS and its Size
        
       for i in 1..<inputArray.count {
        
        dictionary[inputArray[i]] =  dictionary[inputArray[i] - 1]! + 1;
        if (LISSize < dictionary[inputArray[i]]!) {
            LISSize = dictionary[inputArray[i]]!;
            LISIndex = inputArray[i];
        }
        
        }
        
        print ("lis size \(LISSize)");
        var start = LISIndex - LISSize + 1;
        while start <= LISIndex {
            print (start);
            start = start + 1;
        }

    }
    
    
}
