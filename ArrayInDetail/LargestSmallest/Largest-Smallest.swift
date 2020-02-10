//
//  Largest-Smallest.swift
//  ArrayInDetail
//
//  Created by malikj on 03/11/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import Foundation

public class Medium215: NSObject {
    // time: O(n), space: O(1)
    public class func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var from = 0
        var to = nums.count - 1
        var tNums = nums
        while (true) {
            let p = self.partition(&tNums, from, to: to)
            if (p+1 == k) {
                return tNums[p]
            } else if (p+1 < k) {
                from = p + 1
            } else {
                to = p - 1
            }
        }
    }
    
    class func partition(_ nums: inout [Int], _ from: Int, to: Int) -> Int {
        let pivot = nums[from]
        var l = from + 1
        var r = to
        while (l <= r) {
            if (nums[l] < pivot && nums[r] > pivot) {
                swap(&nums, l, r)
                l += 1
                r -= 1
            }
            if (nums[l] >= pivot) {
                l += 1
            }
            if (nums[r] <= pivot) {
                r -= 1
            }
        }
        // swap with the pivot
        self.swap(&nums, from, r)
        return r
    }
    
    class func swap(_ nums: inout [Int], _ a: Int, _ b: Int) {
        let t = nums[a]
        nums[a] = nums[b]
        nums[b] = t
    }
}


class LargestAndSmallest {
    
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
    
    // Largest sum contiguous increasing subarray  O(n) time complexity.
    // https://www.geeksforgeeks.org/largest-sum-contiguous-increasing-subarray/

    
   // https://www.geeksforgeeks.org/kth-smallestlargest-element-unsorted-array/
    
    // Input: arr[] = {7, 10, 4, 3, 20, 15}
   //  k = 3
   //  Output: 7
    // O(N Log N)
    static func kthLargest(_ a: [Int], _ k: Int) -> Int? {
      let len = a.count
      if k > 0 && k <= len {
        let sorted = a.sorted()
//        let sortedtTwo = sorted[len-k];
//        print(sortedtTwo);
        print("element is \(sorted[k-1])")
        return sorted[len - k]
      } else {
        return nil
      }
    }
 
    
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
    
    // back and forth search :
    
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
    
    /**
     string search(int arr[], int n, int x)
     {
         // 1st comparison
         if (arr[n - 1] == x)
             return "Found";
       
         int backup = arr[n - 1];
         arr[n - 1] = x;
       
         // no termination condition and thus
         // no comparison
         for (int i = 0;; i++) {
             // this would be executed at-most n times
             // and therefore at-most n comparisons
             if (arr[i] == x) {
                 // replace arr[n-1] with its actual element
                 // as in original 'arr[]'
                 arr[n - 1] = backup;
       
                 // if 'x' is found before the '(n-1)th'
                 // index, then it is present in the array
                 // final comparison
                 if (i < n - 1)
                     return "Found";
       
                 // else not present in the array
                 return "Not Found";
             }
         }
     }
     
     */
    static func findElementInUnSortedArray(){
        let array1 = [11, 13, 14, 24, 55,550, 750];
//        let tuple =  binarySearch(inputArr: array1,searchItem: 24);
       let tuple =  binarySearchMidLow(array1, searchElement: 24)
        print(tuple)
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
    
   static func binarySearchMidLow(_ inputArray:[Int], searchElement:Int) -> (Bool, Int) {
        var low = 0
        var high = inputArray.count-1
        var mid = 0
        while low <= high {
            mid = low + ((high - low) / 2)
            if inputArray[mid] == searchElement {
                return (true,mid)
            }
            else if inputArray[mid] < searchElement {
                low = mid+1
            }
            else {
                high = mid - 1
            }
        }
        return (false, -1)
    }
    
     static func FindSmallestAndSecondSmallestElement(){
            
            let array1 = [11, 13, 4, 14, 55,5, 7];
            
            var first = INT_MAX ,second = INT_MAX;
            
            // for largest and second largest
            
    //        var first = INT8_MIN ,second = INT8_MIN;

            
            for i in 0..<array1.count {
                
                /* If current element is smaller than first
                then update both first and second */
                if(array1[i] < first){
                    second = first;
                    first = Int32(array1[i]);
                }
                    /* If arr[i] is in between first and second
                    then update second */
                    
                else if(array1[i] < second && array1[i] != first){
                    second = Int32(array1[i]);

                }
            }
            
            if (second == INT_MAX) {
                print("no smallest element");

            }
            else {
                print("the smallest element is \(first) and second is \(second)");
            }
            
        }


     static  func FindLargesAndSecondLargestElement(){
            
            let array1 = [11, 13, 4, 14, 55,5, 7];
            
    //        var first = INT_MAX ,second = INT_MAX;
            
            // for largest and second largest
            
            var first = INT8_MIN ,second = INT8_MIN;

            
            for i in 0..<array1.count {
                
                /* If current element is smaller than first
                then update both first and second */
                if(array1[i] > first){
                    second = first;
                    first = Int32(array1[i]);
                    print("--- First IF ---first is \(first) second is \(second)")
                }
                    /* If arr[i] is in between first and second
                    then update second */
                    
                else if(array1[i] > second && array1[i] != first){
                    second = Int32(array1[i]);
                    print("--- else IF  second is \(second)")

                }
            }
            
            if (second == INT8_MIN) {
                print("no largest element");

            }
            else {
                print("the largest element is \(first) and second is \(second)");
            }
            
        }
    
       
        // Time Complexity of this solution is O(N Log N)
         static func kthFirstElement() {

    //           A simple solution is to sort the given array using a O(N log N) sorting algorithm like Merge Sort, Heap Sort, etc and return the element at index k-1 in the sorted array.
    //           Time Complexity of this solution is O(N Log N)
           }
        
        
        static func findLargestAndSmallest() {
            let a = [11, 13, 4, 14, 55,5, 7];
            var smallest = a[0];
            var largest = a[0];
            for i in 0..<a.count {
                
                if(a[i]>largest) {
                    largest = a[i]
                }
                else if(a[i]<smallest) {
                    smallest = a[i]
                }
            }
            print("smallest is \(smallest)")
            print("largest is \(largest)")
        }
        
}
