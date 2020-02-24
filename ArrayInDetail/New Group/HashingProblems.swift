//
//  HashingPronlems.swift
//  ArrayInDetail
//
//  Created by malikj on 05/02/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation


// https://www.geeksforgeeks.org/top-20-hashing-technique-based-interview-questions/
class HashingProblems {
    
    
        func findCommonElementsInTwoArrayWithHashing() {
            let firstArray = [9,54,59,60,66,362,372,399,400,411,428]
            let secondArray = [9,400,62,399]
            var hashDic : [Int:Int] = [:]
            for i in firstArray {
                hashDic[i] = 1
            }
            // HashDic = [9:1,
            // 54:1,
            // 59:1,
            // 60:1]
            
            
            for k in secondArray {
                // if 400 is present in dic -
                if (hashDic[k] != nil) {
                    print("common element is \(k)")

                }
            }
    //        for j in secondArray {
    //            if (hashDic[j] != nil) {
    //                print("common element is \(j)")
    //            }
    //        }
            
            
        }
    
    // https://www.geeksforgeeks.org/find-subarray-with-given-sum-in-array-of-integers/
    
        func FindSubArrayWithGivenSum(arr:[Int],givensum:Int) {
            
            var dic = [Int:Int]()
            
            // Maintains sum of elements so far
            var curr_sum = 0;
            
            //         let inputArray = [100, 4, 200, 1, 3, 2, 5]
            for i in 0..<arr.count {
                curr_sum = curr_sum + arr[i]
                
                print("curr_sum \(curr_sum)")

                if(curr_sum == givensum){
                    print("sum found between indexes 0 to \(i)")
    //                return;
                }
                
                if(dic[curr_sum - givensum] != nil){
                    print("sum found between indexes \(dic[curr_sum - givensum]! + 1) to \(i)")
    //                return
                }
                
                dic[curr_sum] = i;
                
                print("dic\(dic)")


            }
            print( "No subarray with given sum exists");

        
        }
    
  //  https://www.geeksforgeeks.org/find-missing-elements-of-a-range/
    
    static func findMissingRange(array:[Int], low:Int, high :Int){
        
        // output - 2 6 7 8 9 10

        var set = Set<Int>()
        
        for i in array {
            set.insert(i)
        }
        var i = low;
        while i<=high {
            if(!set.contains(i)) {
                print(i)
            }
            i = i+1
        }
        
    }
    static func zeroSumSubarray() {
              var set = Set<Int>()
//              set.insert(0)
              // Maintains sum of elements so far
              let arr = [4, -6, 3, -1, 4, 2, 7 ]
              var curr_sum = 0;
              for i in 0..<arr.count {
                  curr_sum = curr_sum + arr[i]
                  if(curr_sum == 0 || set.contains(curr_sum)){
                      print("Present")
                      return
                  }
                  set.insert(curr_sum)
              }
              print( "Not present");
          }
    
    // https://www.geeksforgeeks.org/print-all-subarrays-with-0-sum/
    static func PrintAllSubArrayWithZero() {
        var map = [Int:[Int]]()
        var out : [pair] =  [];
        // Maintains sum of elements so far
        var sum = 0;
        let a = [6, 3, -1, -3, 4, -2, 2, 4, 6, -12, -7];
        for i in 0..<a.count {
            sum = sum + a[i]
            if(sum == 0) {
                out.append(pair(first: 0, second: i))
            }
            var al : [Int] =  [];
            if (map[sum] != nil){
                al = map[sum]!;
                for it in 0..<al.count {
                    out.append(pair(first: al[it]+1, second: i))
                }
            }
            al.append(i)
            map[sum] = al;
        }
        print("out \(out)")
        
        if(out.count==0) {
            print(" not found");
        }
        for j in 0..<out.count {
            let p : pair = out[j]
            print(" Subarray found from Index \(p.first) to \(p.second)");
        }
    }
    
   
    
    static func findLongestConseqSubseq(array : [Int]){
        
        var ans = 0;
        
//        [1, 9, 3, 10, 4, 20, 2]

        var set = Set<Int>();
        for i in array {
            set.insert(i);
        }
        // check each possible sequence from the start
               // then update optimal length
        for i in 0..<array.count {
            // if current element is the starting
            // element of a sequence
            if(!set.contains(array[i] - 1)) {
                // Then check for next elements in the
                               // sequence
                var j = array[i];
                while (set.contains(j))
                {
                    j = j+1
                }
                // update  optimal length if this length
                // is more
//                if (ans < j - array[i])
//                {
//                    ans = j - array[i];
//                }
                
                ans = max(ans, j - array[i]);

            }
        }
        print("LongestConseqSubseq \(ans)")
    }
    
    static func findSymPairs(array:[[Int]]) {
        
        /*
         https://www.geeksforgeeks.org/given-an-array-of-pairs-find-all-symmetric-pairs-in-it/
         *
         */
        var map : [Int:Int] = [:]
        var val = 0;
        for i in 0..<array.count {
            
            let first = array[i][0];
            let second = array[i][1];
            
            // Look for second element of this pair in hash
            if let value = map[second] {
                val = value
            }
            // If found and value in hash matches with first
            // element of this pair, we found symmetry
            if(val != 0 && val == first){
                print("\(second) \(first)")
            }
            else {
                map[first] = second;
            }

        }
    }
    
   static func countDistinctNew(a: [Int],  k : Int, n : Int) {
    
        var ans = 0 ;
        var m : [Int:Int] = [:]
        for i in 0..<n {
            if(m[a[i]] == nil) {
                m[a[i]] = i
                ans = ans + 1
            }
            else {
                m[a[i]] = i;
            }
            if(i>=k-1){
                print("ans \(ans)")
                print((i-k+1))
                print(a[i-k+1])

                print(m[a[i-k+1]]!)
                
                if(m[a[i-k+1]]==i-k+1){
                    ans = ans - 1
                    m.removeValue(forKey: a[i-k+1])
                }
            }
        }
    }

   static  func countDisdinct(arr :[Int], k : Int) {

       var map : [Int:Int] = [:]

        var dist_count = 0;
        for i in 0..<k {

            let tempVal = (map[arr[i]] ?? 0)
            map[arr[i]] = tempVal + 1
    
            if(map[arr[i]] == 1) {
             dist_count = dist_count + 1
            }
        }
        print(map)

        print("first window \(dist_count)");
        
        for i in k..<arr.count
        {
            print(" [arr[i-k]] \(arr[i-k])")

            print(" map[arr[i-k]] \(map[arr[i-k]])")
            // // Remove first element of previous window
            // If there was only one occurrence, then
            // reduce distinct count.
            if(map[arr[i-k]] == 1) {
                map.removeValue(forKey: arr[i-k])
                dist_count = dist_count - 1
            }
            else {
                // reduce count of the removed element
                let count = map[arr[i-k]];
                map.removeValue(forKey: arr[i-k])
                map[arr[i-k]] = (count ?? 0) - 1
            }
            
            // Add new element of current window
            // If this element appears first time,
            // increment distinct element count
            if(map[arr[i]] == nil) {
                map[arr[i]] = 1
                dist_count = dist_count + 1;
            }
            else {
                // Increment distinct element count
                let count = map[arr[i]] ;
                map.removeValue(forKey: arr[i])
                map[arr[i]] = (count ?? 0) - 1

            }
         print("distinct Count \(dist_count)")
        }
        
    
    }
 
   static func findHowmanyDuplicates() {
    
    }
    
    static func removeDuplicates(){
        
    }
    
    static func findPairWithGivenSum(arr:[Int],givensum:Int) {
            
            var dic = [Int:Int]()
            
           //  var array =  [-4, 0, 1, 2, 4, -23, 7, 6, 9, 12, 8]


            // Maintains sum of elements so far - 8
    //        (-4, 12), (0, 8 )(1, 7), (2, 6)
            //        var inputArrayTwo = [8, 7, 2, 5, 3, 1]
            var count = 0;
            for i in 0..<arr.count {
                if(dic[givensum - arr[i]] != nil){
                    print("sum found between indexes \(String(describing: dic[givensum - arr[i]])) and \(i)")
                    count = count + 1
                }
                dic[arr[i]] = i;
            }
//            print( "No pair with given sum exists");
            
            
        }
    
    func printPairsUsingSet()  {
            
    //       Input  :  arr[] = {1, 5, 7, -1},
            // pair with given no is ( 5 , 1 )
    // pair with given no is ( -1 , 7 )
            let intArray = [1, 5, 7,-1,4,2]
            let sum = 6
        
            if intArray.count > 2 {
                var dic :[Int:Int] = [:]
                for i in intArray {
                    let target = sum - i
                    if(target>0 && dic[target]==1) {
                        print("pair with given no is ( \(i) , \(target) )")
                    }
                    else {
                        dic[i] = 1;
                    }
                }
            }
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
    
    static func isSubSetUsingMap() {
        
        let a = [11, 1, 13, 21, 3, 7];
        let b = [11, 3, 7, 1];

        var mapDic : [Int :Int] = [:]
        
        guard a.count == 0 || b.count == 0 else {
            return
        }
        
//        11 : 0,13:1, 21: 2, 3:3 , 7 : 4
        
        var isSubset = false;
        for i in 0..<a.count {
            mapDic[a[i]] = i
        // m[arr[i]]++;
          //  mp1[a[i]]++;
        }
        
        
        for j in 0..<b.count {
            
            // if b[i] is not present in map
                  // then array b[] can not be a
                  // subset of array a[]
            
            if(mapDic[b[j]] == nil) {
                isSubset = false
                break;
            }
               //if if b[i] is present in map
                // decrement by one
            else {
                mapDic[b[j]] = 0;
                
            }
            
        }
        
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
