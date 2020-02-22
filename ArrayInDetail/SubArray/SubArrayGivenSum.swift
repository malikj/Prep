//
//  SubArrayGivenSum.swift
//  ArrayInDetail
//
//  Created by malikj on 03/11/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import Foundation

// SubArray Theory
// https://www.geeksforgeeks.org/subarraysubstring-vs-subsequence-and-programs-to-generate-them/
// max sum
// https://www.geeksforgeeks.org/find-maximum-sum-strictly-increasing-subarray/


class pair {
    //fields
    var first: Int
    var second: Int
    
    //constructor
    init(first: Int, second: Int) {
        self.first = first
        self.second = second
    }
}

class SubArrayGivenSum {
    
    // https://www.geeksforgeeks.org/k-th-largest-sum-contiguous-subarray/
    func FindLargestSumOfSubArray() {
        
    }
    
    // https://www.geeksforgeeks.org/largest-sum-contiguous-subarray/
    
//    static func maxSubArray(inputArray:[Int]){
//
//
//    }
    
    // O(n2);
    static func FindLargestContiguousSubArrayNaive(){
//        let inputArray = [1, 3, -4, 14, -5, 5, 7];
       let inputArray = [-2,1,-3,4,-1,2,1,-5,4]
        var largestSum = inputArray[0];
        for i in 0..<inputArray.count {
            print("i \(i)");
            var result = 0;
            for j in i..<inputArray.count {
                print("j \(j)");
                result = result + inputArray[j];
                largestSum=max(largestSum,result);
                print("inner largestSum is \(largestSum)")
            }
        }
        print("largestSum is \(largestSum)")
    }
    
    static func FindLargestContiguousSubArrarIncreasing(){
        
        let inputArray = [2, 1,4,3,5,8]; // 3, 5, 8
        
        
        var max = 1;
        var len = 1;
        var maxIndex = 0;
        
        for i in 1..<inputArray.count {
            
            if(inputArray[i] > inputArray[i-1]) {
                len = len + 1;
            }
            else {
                if (max < len) {
                    max = len
                    maxIndex = i - max;
                }
                len = 1;
            }
        }
        
        if (max < len)
        {
            max = len;
            maxIndex = inputArray.count - max;
        }
        
        for i in maxIndex..<max+maxIndex {
            
            print(inputArray[i])
            
        }
        
    }
    
    // https://leetcode.com/problems/maximum-subarray/
//     static func maxSubArray(_ n: [Int]) -> Int {

    static func maxSubArray() -> Int {
        
        let inputArray =  [-2,1,-3,4,-1,2,1,-5,4];
        let nums = inputArray
        var best = nums[0];
        var current = nums[0];
        
        for i in 1..<nums.count {
            current = max(current + nums[i], nums[i]);
            print("current \(current)")
            best = max(current, best);
            print("best \(best)")
        }
        
        return best;
    }
    
    
    static func findLargestCommonSubsString() {
        
    }
    
    // Kadane’s Algorithm:
    
    //        Time Complexity: O(n)
    //        Algorithmic Paradigm: Dynamic Programming
    static func FindLargestContiguousSubArrayWithKadanes(){
        
        // https://www.geeksforgeeks.org/largest-sum-contiguous-subarray/
        
        var maxSofar = INT8_MIN;
        var curr_max = 0;
        
        var start = 0, s = 0;
        var end = 0;
        
        let inputArray = [-2, -3, 4, -1, -2, 1, 5, -3]; //  4-1-2+1+5 = 7
        
        //        let inputArray = [1, 3, -4, 14, -5, 5, 7]; // -> 21
        
        for i in 0..<inputArray.count {
            curr_max = curr_max + inputArray[i];
            if(maxSofar < curr_max) {
                maxSofar = Int32(curr_max);
                start = s;
                end = i
            }
            if (curr_max < 0){
                curr_max = 0;
                s =  i+1;
            }
        }
        print(" start is \(start) and end is \(end)");
        
        print("maxSofar - \(maxSofar)");
        
    }
    
    static func CheckSubArrayWithGivenSum(arr:[Int],givensum:Int) {
        
    }
    
    // https://www.geeksforgeeks.org/print-all-subarrays-with-0-sum/
    static func PrintAllSubArrayWithZero() {
        var map = [Int:[Int]]()
        var out : [pair] =  [];
        
        // Maintains sum of elements so far
        var sum = 0;
        let a = [6, 3, -1, -3, 4, -2, 2];
        
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
    
    /*
     
     // Function to print all subarrays in the array which
     // has sum 0
     static ArrayList<Pair> findSubArrays(int[] arr, int n)
     {
     // create an empty map
     HashMap<Integer,ArrayList<Integer>> map = new HashMap<>();
     
     // create an empty vector of pairs to store
     // subarray starting and ending index
     ArrayList<Pair> out = new ArrayList<>();
     
     // Maintains sum of elements so far
     int sum = 0;
     
     for (int i = 0; i < n; i++)
     {
     // add current element to sum
     sum += arr[i];
     
     // if sum is 0, we found a subarray starting
     // from index 0 and ending at index i
     if (sum == 0)
     out.add(new Pair(0, i));
     ArrayList<Integer> al = new ArrayList<>();
     
     // If sum already exists in the map there exists
     // at-least one subarray ending at index i with
     // 0 sum
     if (map.containsKey(sum))
     {
     // map[sum] stores starting index of all subarrays
     al = map.get(sum);
     for (int it = 0; it < al.size(); it++)
     {
     out.add(new Pair(al.get(it) + 1, i));
     }
     }
     al.add(i);
     map.put(sum, al);
     }
     return out;
     }
     */
    
    static func zeroSumSubarray() {
        
        
        var set = Set<Int>()
        set.insert(0)
        
        // Maintains sum of elements so far
        
        let arr = [4, -6, 3, -1, 4, 2, 7 ]
        var curr_sum = 0;
        
        for i in 0..<arr.count {
            curr_sum = curr_sum + arr[i]
            if(set.contains(curr_sum)){
                print("Present")
                return
            }
            set.insert(curr_sum)
            
        }
        print( "Not present");
        
    }
    
    
    // https://www.geeksforgeeks.org/given-an-array-a-and-a-number-x-check-for-pair-in-a-with-sum-as-x/
    // Time Complexity: O(n)
    // Auxiliary Space: O(n) where n is size of array.
    // Write a program that, given an array A[] of n numbers and another number x, determines whether or not there exist two elements in S whose sum is exactly x.

    // hashing

    static func findPairWithGivenSum(arr:[Int],givensum:Int) {
        
        
        var dic = [Int:Int]()
        
       //  var array = [-4, 0, 1, 2, 4, -23, 7, 6, 9, 12, 8]

        // Maintains sum of elements so far
//        (-4, 12), (0, 8 )(1, 7), (2, 6)
        //        var inputArrayTwo = [8, 7, 2, 5, 3, 1]
        var count = 0;
        for i in 0..<arr.count {
            if(dic[givensum - arr[i]] != nil){
//                print("sum found between indexes \(String(describing: dic[givensum - arr[i]])) and \(i)")
                count = count + 1
            }
            dic[arr[i]] = i;
        }
        print( "No pair with given sum exists");
        
        
    }
    
    // hashing
    static func hasTwoConditates() {
        
        let inputArrayTwo = [8, 7, 2, 5, 3, 1]
        let givenSum = 10;
        
        var dictionary = [Int:Int]()
        for i in 0..<inputArrayTwo.count-1 {
            
            let temp = givenSum - inputArrayTwo[i];
            
            if(dictionary[temp] != nil) {
                print("sum found between \(dictionary[temp]) and \(i)")
            }
            dictionary[inputArrayTwo[i]] = i;
            
        }

    }
    
    //     // hashing

    static func FindSubArrayWithGivenSum(arr:[Int],givensum:Int) {
        
        var dic = [Int:Int]()
        
        // Maintains sum of elements so far
        var curr_sum = 0;
        
        //        var inputArrayTwo = [10, 2, -2, -20, 10]
        
        for i in 0..<arr.count {
            curr_sum = curr_sum + arr[i]
            print("curr_sum \(curr_sum)")
            if(curr_sum == givensum){
                print("sum found between indexes 0 to \(i)")
                print("yes present")
                return;
                //                return;
            }
            // dic[curr_sum - givensum] will give key - 0, 1, 2, 3,
            if(dic[curr_sum - givensum] != nil){
                print("sum found between indexes \(dic[curr_sum - givensum]! + 1) to \(i)")
                print("yes present")
                return;
                //                return
            }
            dic[curr_sum] = i;
            
            print("dic\(dic)")
            
        }
        print( "No subarray with given sum exists");
    }

}

