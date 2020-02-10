//
//  RemoveDuplicate.swift
//  ArrayInDetail
//
//  Created by malikj on 04/11/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import Foundation

class RemoveDuplicateProblems {

    static func removeDuplicatesWithExtraArray(){
        
        var a = [1, 2, 2, 3, 4, 4, 4, 5, 5];

        var temp = [Int]()
        var j = 0;
        for i in 0..<a.count {
            if(a[i] != a[i+1]){
                temp[j] = a[i]
                j = j+1;
            }
        }
        for i in 0..<j {
            a[i] = temp[j]
        }
        print("array \(a)");
    }
    
    /// O(n) 
    static func removeDuplicates(){
        var a = [1, 2, 2, 3, 4, 4, 4, 5, 5]; //
        var j = 0;
        for i in 0..<a.count-1 {
            if(a[i] != a[i+1]){
                a[j] = a[i]
                j = j+1;
            }
        }
        // // Store the last element as whether
        // it is unique or repeated, it hasn't
        // stored previously
        a[j] = a[a.count-1];
        j = j+1;
        for i in 0..<j {
            print("array \(a[i])");
        }
    }
    
    /// O(n)

    static func removeDuplicatesWithSet() {
        let a = [1, 2, 2, 3, 4, 4, 4, 5, 5];
        var set = Set<Int>();
        for i in a {
            set.insert(i);
        }
        print(set);
        
    }
    
    // check this only https://www.geeksforgeeks.org/longest-consecutive-subsequence/

    // Hashing
     static func LongestConsecutiveSequence(){
            
    //        For example,
    //        Given [100, 4, 200, 1, 3, 2],
    //        The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.
            
        let a = [1, 9, 3, 10, 4, 20, 2]
        var set = Set<Int>()
        var ans = 0;
        
        for i in 0..<a.count {
            set.insert(a[i])
        }
        for i in 0..<a.count {
            if(!set.contains(a[i]-1)){
                var j = a[i];
                while set.contains(j) {
                    j = j + 1;
                }
                ans = max(ans, j - a[i])
            }
        }
        
        print("ans \(ans)")
    }
}
