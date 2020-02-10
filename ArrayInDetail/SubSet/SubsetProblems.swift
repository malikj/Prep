//
//  SubsetProblems.swift
//  ArrayInDetail
//
//  Created by malikj on 04/11/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import Foundation


class SubSetProblems {
    
    
    //    Find the smallest positive integer value that cannot be represented as sum of any subset of a given array

    static func findSmallestPositveNotSum() {
        
        let a = [1, 2, 6, 10, 11, 15];
        
        
        var res = 1; // Initialize result
        
         var i = 0;
        while i < a.count && a[i] <= res {
            res = res + a[i];
            i += 1
            
        }
                
        print ("findSmallestPositveNotSum \(res)")
       

        
    }
    
    

    
}
