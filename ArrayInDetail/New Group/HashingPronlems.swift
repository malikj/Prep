//
//  HashingPronlems.swift
//  ArrayInDetail
//
//  Created by malikj on 05/02/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation

class HashingProblems {

   static func findHowmanyDuplicates() {
    
    }
    
    static func removeDuplicates(){
        
    }
    
    // https://www.geeksforgeeks.org/find-whether-an-array-is-subset-of-another-array-set-1/
    static func isSubSet() {
        
        let a = [11, 1, 13, 21, 3, 7];
        let b = [11, 3, 7, 1];

        var set = Set<Int>();
        for i in a {
            set.insert(i);
        }
        
        for j in b {
            if(!set.contains(j)){
                print("is not subset")
            }
            else {
                print("is subset")
            }
        }
    }

}
