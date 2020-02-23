//
//  Search.swift
//  ArrayInDetail
//
//  Created by malikj on 23/02/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation


class  Search  {
    
    static func searchElement(arr:inout [Int], element:Int) {
        if(arr[arr.count-1] == element){
            print("element found")
        }
        let backup = arr[arr.count-1]
        arr[arr.count-1] = element
        for i in 0..<arr.count {
            if (arr[i] == element) {
                arr[arr.count - 1] = backup;
                if (i < arr.count - 1) {
                    print("element found")
                }
                else {
                    print("notfound")
                }
            }
        }
    }
    
    static func searchInsert(nums: [Int], target: Int) -> Int {
             var low: Int = 0
             var high: Int = nums.count - 1
             while low <= high {
                 let mid: Int = low + (high - low)/2
                 if target < nums[mid] {
                     high = mid - 1
                 } else if target > nums[mid] {
                     low = mid + 1
                 } else {
                     return mid
                 }
             }
             return low
         }
    
    
    //    bool search(int arr[], int n, int x)
    //    {
    //        // Start searching from both ends
    //        int front = 0, back = n - 1;
    //
    //        // Keep searching while two indexes
    //        // do not cross.
    //        while (front <= back)
    //        {
    //            if (arr[front] == x || arr[back] == x)
    //              return true;
    //            front++;
    //            back--;
    //        }
    //        return false;
    //    }
    
    static func searchElementInArray() {
        
        // sorted Array
        let intArray = [22, 23, 33,44]
        
        let elementToSearch = 33
        // Binary search : Time Complexity O(logn)
        
        let foundAtIndex = binarySearch(inputArr: intArray, searchItem: elementToSearch)
        let foundAtIndex2 = binarySearchTwo(matrixArray: intArray, low: 0, high: intArray.count-1, key: elementToSearch)
        print("foundAtIndex2 \(foundAtIndex2)")
        print("foundAtIndex \(foundAtIndex)")

        
        // hashing

    }
    
   static func binarySearch<T:Comparable>(inputArr:Array<T>, searchItem: T) -> Int? {
         var lowerIndex = 0;
         var upperIndex = inputArr.count - 1
         while (true) {
             let currentIndex = (lowerIndex + upperIndex)/2
             if(inputArr[currentIndex] == searchItem) {
                 return currentIndex
             } else if (lowerIndex > upperIndex) {
                 return nil
             } else {
                 if (inputArr[currentIndex] > searchItem) {
                     upperIndex = currentIndex - 1
                 } else {
                     lowerIndex = currentIndex + 1
                 }
             }
         }
     }
    
    // this is workig fine
   static  func binarySearchTwo(matrixArray : [Int],low:Int, high: Int, key :Int) -> Int   {
          var start = low
          var end = high
          while (start <= end) {
              let mid = (start+end)/2
              if matrixArray[mid] <= key {
                  start = mid + 1
              }
              else {
                  end = mid - 1
              }
          }
          return end
      }
}
