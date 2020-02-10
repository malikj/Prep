//
//  Rearrainge.swift
//  ArrayInDetail
//
//  Created by malikj on 04/11/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import Foundation

class Rearrainge {
    
   //  https://www.geeksforgeeks.org/rearrange-positive-and-negative-numbers-publish/
   //  https://www.geeksforgeeks.org/rearrange-positive-and-negative-numbers-publish/
    // advanced
   // https://www.geeksforgeeks.org/rearrange-positive-and-negative-numbers/
    
    // https://www.geeksforgeeks.org/move-ve-elements-end-order-extra-space-allowed/
    
   //  https://www.geeksforgeeks.org/rearrange-array-alternating-positive-negative-items-o1-extra-space/
    
    
    
   //  https://www.geeksforgeeks.org/rearrange-positive-and-negative-numbers-publish/

   static func RearraingeArray() {
      
    var i = -1, temp = 0;
    var a = [-1, 2, -3, 4, 5, 6, -7, 8, 9];
    print ("before arrainge \(a)")

    for j in 0..<a.count {
        if(a[j] < 0){
            i = i+1;
//            temp = a[i];
//            a[i] = a[j];
//            a[j] = temp;
            a.swapAt(i,j)
        }
    }
    print ("negatives arrainge \(a)")

    var pos = i + 1;
    var neg = 0;
    while  (pos < a.count && neg < pos && a[neg] < 0) {
//        temp = a[neg]
//        a[neg] = a[pos]
//        a[pos] = temp;
        a.swapAt(pos, neg)
        pos = pos + 1;
        neg = neg + 2
    }
    print ("after arrainge \(a)")

    }
    
  //  https://www.techiedelight.com/rearrange-the-array-with-alternate-high-and-low-elements/
    
      static func RearraingeArrayHighAndLowValues() {
        
        var a = [9, 6, 8, 3, 7, 2, 10];
        print (" RearraingeArrayHighAndLowValues before arrainge \(a)")
        
        var i = 1;
        
        while i < a.count {
            
            if(a[i-1] > a[i]){
                a.swapAt(i-1, i);
            }
            
            if(i+1 < a.count && a[i+1] > a[i]){
                a.swapAt(i+1, i);
            }
            i = i+2;

        }
        print ("RearraingeArrayHighAndLowValues before arrainge \(a)")
        
//         RearraingeArrayHighAndLowValues before arrainge [9, 6, 8, 3, 7]
//        RearraingeArrayHighAndLowValues before arrainge [6, 9, 3, 8, 7]
        
//        RearraingeArrayHighAndLowValues before arrainge [9, 6, 8, 3, 7, 10, 2]
//        RearraingeArrayHighAndLowValues before arrainge [6, 9, 3, 8, 7, 10, 2]
//
    }
    
    static func rearraingeInGroup(){
        
        var a = [10, 5, 3, 10, 10, 4, 1, 3];
        print (" RearraingeArrayHighAndLowValues before arrainge \(a)")
        var dic = [Int:Int]()
        
/// 10, 10, 10, 5, 3, 3, 4
        for i in 0..<a.count {
            var pv = dic[a[i]];
            if (pv == nil){
                pv = 0;
            dic[a[i]] = (pv ?? 0) + 1;
        }
        
        for i in 0..<a.count {

            // Check if this is first occurrence
            if let prevCount = dic[a[i]] {
                for j in 0..<prevCount {
                    print(a[i])
                }
                dic[a[i]] = nil;
            }
        }
    }
    
    // Function to group elements of the given array based on first occurrence
    // of each element
//    void rearrange(int A[], int n)
//    {
//        // create an empty map to store frequency of each element
//        // present in the input array
//        unordered_map<int, int> freq;
//
//        // traverse the input array and update frequency of each element
//        for (int i = 0; i < n; i++) {
//            freq[A[i]]++;
//        }
//
//        for (int i = 0; i < n; i++)
//        {
//            // if A[i] exists in the map (first occurrence of A[i])
//            if (freq.find(A[i]) != freq.end())
//            {
//                // print A[i] n times where n = freq[A[i]]
//                int n = freq[A[i]];
//                while (n--) {
//                    cout << A[i] << " ";
//                }
//
//                // delete the element from the map so it would not
//                // get processed again
//                freq.erase(A[i]);
//            }
//        }
//    }
}
}
