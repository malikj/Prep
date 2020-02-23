//
//  ViewControllerTwo.swift
//  ArrayInDetail
//
//  Created by malikj on 23/10/19.
//  Copyright © 2019 malikj. All rights reserved.
//


//// *****************************************************
// Must try all

// https://github.com/KnightJoker/LeetCode-Solutions/blob/ba3230158f693428be7a3148a7dfa09d89f566f3/README.md
// https://github.com/prelangi/CP_IP_Prework_Jan2018/tree/a1d234191a0a93fc7703dd2477c0d9b51306488b
// rotation  https://medium.com/swift-coding/rotate-arrays-in-swift-7f223007ad6f

// more on swift https://medium.com/swift-coding
import UIKit

class ViewControllerTwo: UIViewController {
    
    
    //// Input: A = [2, 6, 3, 1, 7], d = 2
    //// Output: A = [3, 1, 7, 2, 6]
    
    func leftRotation<T>(_ array:[T], d: Int) -> [T] {
        var result = array
        guard array.count > 1 else { return array }
        
        for _ in 1...d {
            result.append(result.removeFirst())
        }
        
        return result
    }
    
   func rotateSingleRight(_ chars : inout [Int]) {
    
    guard chars.count > 1 else { return  }

    // alway use this
        let last = chars[chars.count - 1]
        for i in (1..<chars.count).reversed() {
            chars[i] = chars[i - 1]
        }
        chars[0] = last
    print("right rotate \(chars)")
    
    //    var inputArrayTwo = [10, 2, -2, -20, 10]

    
//    right rotate [10, 10, 2, -2, -20]
    



    }
    
    func rotateSingleLeft(_ chars : inout [Int]) {
        
        // alway use this

        let first = chars.first!
        for i in 0..<chars.count - 1 {
            chars[i] = chars[i + 1]
        }
        chars[chars.count - 1] = first
        print("left rotate \(chars)")
        
//         var inputArrayTwo = [10, 2, -2, -20, 10]
//
//        //        left rotate [2, -2, -20, 10, 10]
    }
    
    func leftRotationEfficient<T>(_ array:[T], d: Int) -> [T] {
        var result = array
        
        guard array.count > 1 else { return array }
        
        for _ in 1...d {
            result.append(result.removeFirst())
        }
        
        return result
    }
    
    
    //leftRotation(A, d: 2)

    // Rotation with index
    // expected index: 2, 3, 4, 0, 1
    // index = d + i % size
    // 2, 3, 4, 0, 1
    func leftRotationMod<T>(_ array:[T], d: Int) -> [T] {
        var result: [T] = []
        
        for i in 0..<array.count {
            let index = d + i % array.count
            result[i] = array[index]
        }
        
        return result
    }
    
    // check from hashing
        func longestConsecutive(_ A: [Int]) -> Int {
            var uniqueElemsInArray: Set<Int> = Set()
            var ans = 0, longestSeqLength = 0
            var j = 0
            
            //Add elements to the set
            for i in 0..<A.count {
                uniqueElemsInArray.insert(A[i])
            }
            
            //         let inputArray = [100, 4, 200, 1, 3, 2, 5]

            for i in 0..<A.count {
                //Look for the element which is the first element of the sequence
                //Set will not contain A[i]-1 when it is the first element
                
                print ("A[i]-1 \(A[i]-1)")
                //         if (S.find(arr[i]-1) == S.end())

                if(!uniqueElemsInArray.contains(A[i]-1)) {
                    j = A[i]
                    print ("j \(j)")

                    ans = 0
                     
                    //Check for the longest consecutive sequence by looking for adj elements
                    //   while (S.find(j) != S.end())

                    while(uniqueElemsInArray.contains(j)) {
                        j+=1
                        ans+=1
                        print ("ans \(ans)")

                    }
                }
                
                longestSeqLength = max(longestSeqLength,ans)

            }
            print (" longestSeqLength \(longestSeqLength)")
            
            /// 12 1 314 - 3

            return longestSeqLength
        }
    

    func SubArrayProblems() {
        
        SubArrayGivenSum.FindLargestContiguousSubArrayNaive();
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let inputArray = [100, 4, -104, 1, 3, 2, 5]
        
        
        var inputArrayTwo = [10, 2, -2, -20, 10]
        SubArrayProblems()
        
//       FindLargestContiguousSubArrayNaive();

        
//        left rotate [2, -2, -20, 10, 10]

        
//        left rotate [2, -2, -20, 10, 10]

//
//        rotateSingleRight(&inputArrayTwo)
////        rotateSingleLeft(&inputArrayTwo);
//
//        FindSubArrayWithGivenSum(arr: inputArray, givensum: 0)
//
//        longestConsecutive(inputArray);
//        LongestConsecutiveSequence();
//        return;
        
//        funcMoveZeroToFirst();
//        FindLargestContiguousSubArrayNaiveWithKadanes();
//        FindLargestContiguousSubArrayNaive();
//
//        let inputArray = [1, 3, -4, 14]

//        let result =   FindLargestContiguousSubArrayDivideAndConque(elements: inputArray, l: 0, h: inputArray.count-1)
//
//        print (" Maximum contiguous sum is \(result)")
        /*
// https://javarevisited.blogspot.com/2015/06/top-20-array-interview-questions-and-answers.html?source=post_page---------------------------
         */
        
        
        /*
         
         // https://javarevisited.blogspot.com/2015/06/top-20-array-interview-questions-and-answers.html?source=post_page---------------------------
         */
        
        // Intersection and Union of Array
//        NaiveInterSectionAndUnionOfTwoArrays();
//        UnionOfTwoArraysMethodTwo();
//        IntersectionOfTwoArraysMethodTwo()
        
        
        // Find Minimum Element from Array
//        FindMinimumElement();
        
//        FindSmallestAndSecondSmallestElement();
        
    }
    
    // https://www.geeksforgeeks.org/given-an-array-a-and-a-number-x-check-for-pair-in-a-with-sum-as-x/
    func  printPairs() {
        
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
    
    func moveZeroesTwo(_ nums: inout [Int]) {
        let count = nums.count
        nums = nums.filter { $0 != 0 }
        let newCount = nums.count
        for _ in 0..<count - newCount {
            nums.append(0)
        }
    }
    
    
    func moveZeroes(_ nums: inout [Int]) {
        var j = 0
        for i in 0..<nums.count {
            if nums[i] != 0 {
                let temp = nums[j]
                nums[j] = nums[i]
                nums[i] = temp
                j += 1
            }
        }
    }
    
    
    // https://www.geeksforgeeks.org/move-zeroes-end-array/ idaptive
   func funcMoveZeroToFirst() {
        
    var inputArray = [1, 2, 0, 4, 6, 0, 9, 0, 4, 0, 3, 0, 9, 0, 1, 0, 3, 0]
    
//    new input array i [0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 6, 9, 4, 3, 9, 1, 3]

    var current = inputArray.count - 1;

    for i in stride(from: current, to: 0, by: -1) {
        if(inputArray[i] != 0){
            inputArray[current] = inputArray[i];
            current = current - 1;
        }
    }
    
    while current >= 0 {
        inputArray[current] = 0;
        current = current - 1;

    }

    print("new input array i \(inputArray)");

    for i in 0..<inputArray.count {
        print("new input array i \(inputArray[i])");
    }
    }

    
// Kadane’s Algorithm:
    
    
    func FindLargestContiguousSubArrayNaiveWithKadanes(){
//        let inputArray = [-2, -3, 4, -1, -2, 1, 5, -3];
//        var maxSofar = inputArray[0];
//        var curr_max = inputArray[0];
//
//        for i in 1..<inputArray.count {
//
//            curr_max = max(inputArray[i], curr_max+inputArray[i]);
//            maxSofar = max(maxSofar, curr_max);
//
//        }
//
//        print("maxSofar - \(maxSofar)");
        
        // method two
        
        // https://www.geeksforgeeks.org/largest-sum-contiguous-subarray/
        
        var maxSofar = INT8_MIN;
        var curr_max = 0;
        
        var start = 0, s = 0;
        var end = 0;
        
        let inputArray = [-2, -3, 4, -1, -2, 1, 5, -3];

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



   

// Divide and Conquare - https://www.geeksforgeeks.org/maximum-subarray-sum-using-divide-and-conquer-algorithm/


func FindLargestContiguousSubArrayDivideAndConque(elements:[Int], l: Int, h : Int)-> Int{
    
//    let inputArray = [1, 3, -4, 14, -5, 5, 7];

    print ("l  is \(l)")

    
    print ("h  is \(h)")


    let a = elements;
    if (l==h){
        return a[l];
    }
    
    let mid = (l+h)/2
    
    print ("mid is \(mid)")

    /* Return maximum of following three possible cases
    a) Maximum subarray sum in left half
    b) Maximum subarray sum in right half
    c) Maximum subarray sum such that the subarray crosses */
 
    
    print("before leftLargest is going to called")

    let leftLargest = FindLargestContiguousSubArrayDivideAndConque(elements: a, l: l, h: mid);
    
   
    
    
    print("rightLargest is going to called \(leftLargest)")
    
    print ("before rightLargest l  is \(l)")
    print ("before rightLargest h  is \(h)")
    print ("before mid rightLargest h  is \(mid)")


    let rightLargest = FindLargestContiguousSubArrayDivideAndConque(elements: a, l: mid+1, h: h);
    
    print("rightLargest is done  \(rightLargest)")
    
    
    print ("after rightLargest l  is \(l)")

       
       print ("after rightLargest h  is \(h)")
    
    print (" after mid rightLargest h  is \(mid)")

    
    
    //    let inputArray = [1, 3, -4, 14, -5, 5, 7];

    
    print("maxCrossing is going to call  ")

    print ("l  is \(l)")
       
       
    print ("h  is \(h)")
    print ("mid   is \(mid)")



    let maxCrossing = maxCrossingSum(elements: a, l: l, m: mid, h: h);

    print("maxCrossing is done  \(maxCrossing)")

     return  max(leftLargest,rightLargest, maxCrossing);
}

func maxCrossingSum(elements:[Int], l: Int, m :Int,  h : Int)-> Int {
    var left_sum = INT8_MIN;
    var right_sum = INT8_MIN;
    var sum = 0;
    
    //    let inputArray = [1, 3, -4, 14, -5, 5, 7];

    for i in stride(from: m, to: l+1, by: -1) {
        //        print(index)
        print(" left_sum  elements[i] \(elements[i])");

        sum = sum + elements[i];
        if (sum > left_sum) {
            left_sum = Int32(sum);
            print(" left_sum  val \(left_sum)");
        }
    }
    
    sum = 0;
    
    for i in m+1..<elements.count {
        print(" right_sum  elements[i] \(elements[i])");
        sum = sum + elements[i];
        if (sum > right_sum) {
            right_sum = Int32(sum);
            print(" right_sum  val \(right_sum)");
        }
    }

    // Return sum of elements on left and right of mid
    return Int(left_sum + right_sum);
}
        

    
    func FindMinimumElement(){
        let array1 = [11, 13, 4, 14, 55,5, 7];
        
        var min = array1[0];
        for i in 0..<array1.count {
            if(array1[i]<min){
                min = array1[i]
            }
        }
        print("min  is \(min)");

    }
    
    
    func NaiveInterSectionAndUnionOfTwoArrays() {
     
        let array1 = [1, 3, 4, 4, 5,5, 7];
        let array2 = [2, 3, 5, 6];
        
        let fruitsSet = Set(array1)
        let vegSet = Set(array2)
        let outputIntersetctionSet = fruitsSet.intersection(vegSet);
        let finalArrayIntersection = Array(outputIntersetctionSet)
        print("intersection finalArray \(finalArrayIntersection)"); // common [5, 3]
        
        let unionSet = fruitsSet.union(vegSet);
        let unionArray = Array(unionSet)
        print("union finalArray \(unionArray)"); // mix all [6, 5, 4, 3, 7, 2, 1]
        

    }
    
    
//    Method 3 (Use Sorting and Searching)
//    Union:
//    1) Initialize union U as empty.
//    2) Find smaller of m and n and sort the smaller array.
//    3) Copy the smaller array to U.
//    4) For every element x of larger array, do following
//    …….b) Binary Search x in smaller array. If x is not present, then copy it to U.
//    5) Return U.
    
//    ntersection:
//    1) Initialize intersection I as empty.
//    2) Find smaller of m and n and sort the smaller array.
//    3) For every element x of larger array, do following
//    …….b) Binary Search x in smaller array. If x is present, then copy it to I.
//    4) Return I.
//
//    Time complexity of this method is min(mLogm + nLogm, mLogn + nLogn) which can also be written as O((m+n)Logm, (m+n)Logn). This approach works much better than the previous approach when difference between sizes of two arrays is significant.
    
    func UnionOfTwoArraysMethodTwo() {
        
        // work for duplicates too
        var array1 = [7, 1, 5, 2, 3, 6];
        var array2 = [3, 8, 6, 20, 7];
                
        let a1Length = array1.count;
        let a2Length = array2.count;
        if(a1Length < a2Length){
            let tempArray = array1;
            array1 = array2;
            array2 = tempArray;
        }

        let smallerArraySorted = array2.sorted()
        print("Union is : ");

        for j in 0..<smallerArraySorted.count {
            print(smallerArraySorted[j]);
        }

        for i in 0..<array1.count {
            let tupleResult = binarySearchMidLow(smallerArraySorted, searchElement: array1[i]);
            if(tupleResult.0 == false){
                print(array1[i]);
            }
        }
    }
    
    func IntersectionOfTwoArraysMethodTwo() {
        
        // work for duplicates too
        var array1 = [7, 1, 5, 2, 3, 6];
        var array2 = [3, 8, 6, 20, 7];
                
        let a1Length = array1.count;
        let a2Length = array2.count;
        if(a1Length < a2Length){
            
            let tempArray = array1;
            array1 = array2;
            array2 = tempArray;

        }

        let smallerArraySorted = array2.sorted()
        print("Intersection is : ");

//        for j in 0..<smallerArraySorted.count {
//            print(smallerArraySorted[j]);
//        }
        for i in 0..<array1.count {
            let tupleResult = binarySearchMidLow(smallerArraySorted, searchElement: array1[i]);
            if(tupleResult.0 == true){
                print(array1[i]);
            }
        }
        
    }
    
     func binarySearchMidLow(_ inputArray:[Int], searchElement:Int) -> (Bool, Int) {
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


    
    // Must follow and complete this
    // https://www.geeksforgeeks.org/find-union-and-intersection-of-two-unsorted-arrays/

//   static void UnionArray(int arr1[],
//                          int arr2[])
//   {
//       // Taking max element present in either array
//       int m = arr1[arr1.length - 1];
//       int n = arr2[arr2.length - 1];
//
//       int ans = 0;
//
//       if(m > n)
//       {
//           ans = m;
//       }
//       else
//       ans = n;
//
//       // Finding elements from 1st array
//       // (non duplicates only). Using
//       // another array for storing union
//       // elements of both arrays
//       // Assuming max element present
//       // in array is not more than 10^7
//       int newtable[] = new int[ans + 1];
//
//       // First element is always
//       // present in final answer
//       System.out.print(arr1[0] + " ");
//
//       // Incrementing the First element's count
//       // in it's corresponding index in newtable
//       ++newtable[arr1[0]];
//
//       // Starting traversing the first
//       // array from 1st index till last
//       for(int i = 1; i < arr1.length; i++)
//       {
//           // Checking whether current element
//           // is not equal to it's previous element
//           if(arr1[i] != arr1[i - 1])
//           {
//               System.out.print(arr1[i] + " ");
//               ++newtable[arr1[i]];
//           }
//       }
//
//       // Finding only non common
//       // elements from 2nd array
//       for(int j = 0; j < arr2.length; j++)
//       {
//           // By checking whether it's already
//           // present in newtable or not
//           if(newtable[arr2[j]] == 0)
//           {
//               System.out.print(arr2[j] + " ");
//               ++newtable[arr2[j]];
//           }
//       }
//   }

//}
}
