//
//  MinMax.swift
//  ArrayInDetail
//
//  Created by malikj on 06/11/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import Foundation

class MinMax {
    
    static func MaxArrayAfterKOperation() {
        
        let kOperation = 4;
       
        var a = [-2, 0, 5, -1, 2]
       
        for i in 0..<kOperation {
            
            var min = INT_MAX;
            var index = -1;
            for j in 0..<a.count {
                
                if (a[j] < min)
                {
                    min = Int32(a[j]);
                    index = j;
                }

            }
            // this the condition if we find 0 as
            // minimum element, so it will useless to
            // replace 0 by -(0) for remaining operations
            if (min == 0) {
                break;

            }
            
            // Modify element of array

            a[index] = -a[index];

            
        }


        // Calculate sum of array
        var sum = 0;
        for i in 0..<a.count {
            sum += a[i];

        }
        print("sum ** \(sum)")
        
        
    }
        
    // Minimum possible sum of array elements after performing the given operation

    
    static func minimumSumArrayAfterOperation() {
        
        var a = [1, 2, 3, 4, 5]
        var x = 2;

//        let kOperation = 4;
        var sum = 0
        
        var largestDivisible = -1,
        minimum = a[0];
        
        for i in 0..<a.count {
             
            sum += a[i];
            
            // If current element is divisible
                  // by x and it is maximum so far
                  if (a[i] % x == 0 &&
                    largestDivisible < a[i]) {
                    largestDivisible = a[i];

            }
            
                  // Update the minimum element
            if (a[i] < minimum) {
                minimum = a[i];

            }

            
        }
        
        if (largestDivisible == -1) {
            
        }
//              return sum;
        
          // Subtract the chosen elements from the
          // sum and then add their updated values
          let sumAfterOperation = sum - minimum - largestDivisible +
                                  (x * minimum) + (largestDivisible / x);
        

        var minSum = min(sum, sumAfterOperation);
        
        print ("minSum \(minSum)")

    }
}
