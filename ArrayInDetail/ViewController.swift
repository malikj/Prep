//
//  ViewController.swift
//  ArrayInDetail
//
//  Created by malikj on 07/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import UIKit
import Foundation


//int main( )
//{
//    Someclass a(4);
//        Someclass b = a;
//        cout << b.x << endl;
//return 0;
//}

class ViewController: UIViewController {
    
    func fn(i:Int) -> Int{
        if(i%2 == 0) {
            return 0;
        }
     else
        {
            return 1;
        }
    }
    
    func calculateProfit(n: Int, earning: [Int], cost: [Int], e: Int) -> Int {
        // Write your code here

        var e = e;
        var earning = earning;
        var sum = 0

        var ef = e;

        var count = 0;

        var maximum = 0;
        

        for i in 0..<n {

            if (i != n - 1) {

                    if (earning[i] > cost[i]) {

                        sum += ef * earning[i];
                        e = 0;

                        maximum = 0;

                        if (ef * earning[i + 1] > ef * cost[i] && sum > 0) {

                            //console.log(e);
                            sum -= ef * cost[i];
                            e = ef;
                        }


                    }
                    else {
                        count = count+1;
                        maximum = max(maximum, earning[i]);
                    }


            }
            else {//last day

                if (earning[i] <= cost[i]) {
                    count = count + 1 ;
                }

                maximum = max(maximum, earning[i]);

                if (e > 0) {
                    sum = sum + ef * Int(maximum)

                }

            }


        }

        if (count == n) {
            earning.sort();
            sum = earning[n-1] * ef;
        }

        return sum;

    }
    
    func minSumTwo(num: [Int], k: Int) -> Int {
          // Write your code here
          // if array count is less than 1 return 0 or empty
          
//        var w = 6.5
//        w.round(.toNearestOrAwayFromZero)
//
//        if(num.count < 1){
//            return 0;
//        }
//        var finalVal = 0.0;
//        for i in 0..< k {
//            for j in num {
//                finalVal  = finalVal + Double((j/2));
//                finalVal.round(.toNearestOrAwayFromZero)
//            }
//        }
//        return Int(finalVal);
        return 0
      }
    

//
//    int maxSubArraySum(int a[], int size)
//    {
//        int max_so_far = INT_MIN, max_ending_here = 0;
//
//        for (int i = 0; i < size; i++) {
//            max_ending_here = max_ending_here + a[i];
//            if (max_so_far < max_ending_here)
//                max_so_far = max_ending_here;
//
//            if (max_ending_here < 0)
//                max_ending_here = 0;
//        }
//        return max_so_far;
//    }
    
//    fun minSum(int arr[], int x) {
//        
//    }
    
//    ll minSum(int arr[], int n, int x)
//    {
//        ll sum = 0;
//
//        // To store the largest element
//        // from the array which is
//        // divisible by x
//        int largestDivisible = -1, minimum = arr[0];
//        for (int i = 0; i < n; i++) {
//
//            // Sum of array elements before
//            // performing any operation
//            sum += arr[i];
//
//            // If current element is divisible by x
//            // and it is maximum so far
//            if (arr[i] % x == 0 && largestDivisible < arr[i])
//                largestDivisible = arr[i];
//
//            // Update the minimum element
//            if (arr[i] < minimum)
//                minimum = arr[i];
//        }
//
//        // If no element can be reduced then there's no point
//        // in performing the operation as we will end up
//        // increasing the sum when an element is multiplied by x
//        if (largestDivisible == -1)
//            return sum;
//
//        // Subtract the chosen elements from the sum
//        // and then add their updated values
//        ll sumAfterOperation = sum - minimum - largestDivisible
//                               + (x * minimum) + (largestDivisible / x);
//
//        // Return the minimized sum
//        return min(sum, sumAfterOperation);
//    }
    
    
    func mainss()
    {
        let users = ["y", "s"];
        print(users);
            var i = 5, j = 2;

        print( i << j)
        print(i >> j)
//        i << j, i >> j
//            printf("%d %d", i << j, i >> j);
    }
    
    func observerPattern(){
        let observerCenter:ObserverCenter = ObserverCenter()
        
        
        
        let courseObserver:CourseObserver = CourseObserver()
        observerCenter.addObserver(observerName: "Course", observer: courseObserver)
        
        let studentObserver:StudyObserver = StudyObserver()
        observerCenter.addObserver(observerName: "Student", observer: studentObserver)
        
        observerCenter.notifyObserver(data: "FlyElephant")
        
        
        
        // refer from here
        let center : MyNotificationCenter = MyNotificationCenter();
        
        let notification : MyNotification = MyNotification(name: "notificationname");
        notification.notificationName = "notificationname"
        
        let courss:CourseObserverTwo = CourseObserverTwo();
        center.addObserver(observer: courss);
        center.postNotification(n: notification);
        
    }
    
    func LCMediumProblems(){
        let arr = [11, 13, 14, 19, 29];
        
        // Search Insert Position
//        let insertElement =  LCMedium.searchInsert(arrayData:arr, targetValue: 10)
//        print("insertElement is \(insertElement)")
        SubdomainVisitCountSolution.test();
        
//        CanMeetingRoomsSolution.test();
//        Medium253.test();
    }
    
    func SubArrayProblems() {
        
        SubArrayGivenSum.FindLargestContiguousSubArrayNaive();
    }
    
    func StringProblems() {
//        strProblems.patternSearch(pattern: "AABA",text: "AABAACAADAABAAABAA")
        strProblems.longest("aaabbbc")
    }
    
    func ObserverPatternExample(){
        var obs1 = Observer_Class_1(id: 1)
        var obs2 = Observer_Class_2(id: 2)
        var obsv = Variable<String>()
        obsv.addObserver(observer: obs1)
        obsv.addObserver(observer: obs2)
        obsv.value = "Hello world"
        obsv.removeObserver(observer: obs1)
        obsv.value = "Obs1 removed, yey"
    }
    
    func removeDuplicates() {
//        RemoveDuplicateProblems.removeDuplicatesWithSet();
        RemoveDuplicateProblems.LongestConsecutiveSequence();
    }
    
    func hashingProblems(){
        let inputArray = [10, 2, -2, -20, 10]

//        HashingProblems.isSubSet();
//        SubArrayGivenSum.hasTwoConditates()
//        SubArrayGivenSum.FindSubArrayWithGivenSum(arr: inputArray, givensum: 0)
//        SubArrayGivenSum.maxSubArray();
//        SubArrayGivenSum.FindLargestContiguousSubArrayWithKadanes();
        SubArrayGivenSum.PrintAllSubArrayWithZero();
        
    }
    
    
    func LargestElementsProblems(){
        var inputArray =  [7, 10, 4, 3, 20, 15]
//        LargestAndSmallest.kthLargest(inputArray, 3)
//        LargestAndSmallest.findElementInUnSortedArray();
//        LargestAndSmallest.searchElement(arr: &inputArray,element: 3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arrayTwow = [-4, 0, 1, 2, 4, -23, 7, 6, 9, 12, 8]
               let sum =  8
        var array:[Int] = [8, 7, 2, 5, 3, 1]

            SubArrayGivenSum.findPairWithGivenSum(arr: arrayTwow, givensum: sum)
        
       
        countPairs(inputArray: arrayTwow, sum: sum)
         LCMediumProblems()

        removeDuplicates();
        LargestElementsProblems()
//        hashingProblems();
//        removeDuplicates();
//        dupPractice();
//        ObserverPatternExample();
        // subarray :
//        StringProblems();
//        SubArrayProblems();
        
//        LCMediumProblems()
        
        // HighOrder Functions
//        Group.FlatMapEx();
        
//        Group.GroupBy();
        
        // Group
        
        // a!@bc&d
        var cc :[Character] = ["a", "!", "@","b","c","&","d"];
        strProblems.ReverseStringWithoutSpecialChar(cc);
//        mainss()
//        Rotate.rotateSingleLeft();
//        Rotate.rotateSingleRight();
        
        // rearrainge Array
//        Rearrainge.RearraingeArray()
//        Rearrainge.RearraingeArrayHighAndLowValues();
        Rearrainge.rearraingeInGroup();

//        LargestAndSmallest.FindSmallestAndSecondSmallestElement();
//        LargestAndSmallest.FindLargesAndSecondLargestElement();
//        LargestAndSmallest.findLargestAndSmallest()
//
//                    var array:[Int] = [8, 7, 2, 5, 3, 1]
//
//        SubArrayGivenSum.findPairWithGivenSum(arr: array, givensum: 10)
//        SubArrayGivenSum.zeroSumSubarray()
        SubArrayGivenSum.PrintAllSubArrayWithZero();
//
//        SubArrayGivenSum.FindLargestContiguousSubArrayWithKadanes()
//        SubArrayGivenSum.FindLargestContiguousSubArrarIncreasing()
//
//        Repeative.FindFirstRepeatingElement();
//        Repeative.FindFirstNonRepeatingElement()
        
        
        // subset
//        SubSetProblems.findSmallestPositveNotSum();
        
        // 
//        RemoveDuplicate.removeDuplicates()
        
//        MinMax.MaxArrayAfterKOperation()
        MinMax.minimumSumArrayAfterOperation()
        
//        RemoveDuplicate.LongestConsecutiveSequence();
//
//        findlargestandSmallest();
        
        
        var i=3;
        i=fn(i: i);
        i=fn(i: i);
        print(i)
        
        var inputArrayTwo = [1,2,1]
        
//        minSumTwo(num: inputArrayTwo, k: 1);
                
        
        printPairsUsingSet();
//                let newViewController = ViewControllerTwo()
//                self.navigationController?.pushViewController(newViewController, animated: true)
//
//        reverseArrayWithSwap();
//        var test = [0, 16, 10, 12, 13, 101, 54, 7, 3, 2, 5, 4, 88]
//
////        print("========================== BubbleSort(test) \(BubbleSort(elements: test))")
//
//        print("========================== Inserttion (test) \(OptimizeinsertionSort(test))")
//
//
//        factorial(n: 4);

//
//            var array:[Int] = [3,2,4,6,8,7,5,9,100,94,18,15,16,101,200,1,0]
//
//             var merge = mergeSort(array)
//             print(merge)
//
//             print("==========================")
//
////             var test = [1, 8, 11, 100, 0, 6, 10, 12, 13, 101, 54, 7, 3, 2, 5, 4, 88]
//             quicksort(arr: &test, left: 0, right: test.count-1)
//             print(test)
                     
//        let missingValuesArrayTwosss = [4, 5, 6, 7];
//        print("reverse arrray \(Reversesolution(missingValuesArrayTwosss))");
//        RemoveDuplicates();
//
//        
//        duplicates1();
//        checkPolindromeOrNot();
//        
//        
//        var arrayWithRepeat = Array(repeating: "Malik", count: 5)
//        var students = ["Ben", "Ivy", "Jordell", "Maxime"]
//        if let i = students.index(of: "Maxime") {
//            students[i] = "Max"
//        }
//        print(students)
//        
////        createMultiDimenionalArray()
//
//        
////        print(arrayWithRepeat)
////        createMultiDimenionalArray()
//        
//        
////        Input: arr[] = {8, 12, 16, 4, 0, 20}, k = 4
////        Output: 5
////        There are 5 pairs with difference 4, the pairs are {0, 4}, {4, 8},
////        {8, 12}, {12, 16} and {16, 20}
////
//        let missingValuesArray = [1, 5, 3, 4, 2];
//        
////        countPairNaiveMethid(missingValuesArray,k:3)
////        countPairsWithDiffK(missingValuesArray,k: 3);
//        
//        let missingNumber = findMissingNumber(missingValuesArray);
//        print(missingNumber)
//        // Input: {0, 1, 2, 6, 9}, n = 5, m = 10
////        let missingValuesArrayTwo = [4, 5, 6, 7, 9,10];
//        let missingValuesArrayTwo = [4, 5, 6, 7, 19,20];
//        
////                let missingValuesArrayThree = [4, 7, 8, 16, 19];
//        
////      let missingValuesArrayThree =   [1,2,3,4,5,7,6, 9]
//
//        let missingValuesArrayThree =   [1,3,4]
//
////
//        findMissingNumberSorted(missingValuesArrayThree)
//////
////        findMissingNumberSortedTwo(missingValuesArrayThree);
////
////        findMissingNumberSortedThree(missingValuesArrayThree);
//        
        let missingValuesArrayFour = [2, 3, -7, 6, 8, 1, -10, 15];

        findMissingNumberUnsorted(missingValuesArrayFour)
//////
////        let dupValuesArrayTwo = [1, 2, 3, 1];
////
////        findDuplicates(dupValuesArrayTwo)
////
////        duplicates1()
//        
////        searchElementInArray()
//        
//        let arrayOfStrings = ["a", "b", "a", "c", "a", "d"]
//        let uniqueStrings = uniqueElementsFrom(array:arrayOfStrings)
//        print(uniqueStrings);
//        printPairsUsingSet()
//        
//        findCommonElementsInTwoArray()
//        findCommonElementsInTwoArrayWithHashing()
//        findCommonWithWhileLoop()
//        
////        calcaulateDiff()
////        dupPractice()
////
////        let a = [5, 1, 3, 2, 7, 6, 4]
////
////        kthLargest(a, 0)
////
////        randomizedSelect(a,order: 1);

    }
    
    func findlargestandSmallest(){
        
        var arr = [1, 2, 0, 11, 9];
        
        var largest = arr[0];
        var smallest = arr[0];
        
    
        for i in 1..<arr.count {
            
            if(arr[i] > largest){
                largest = arr[i];
            }
            else if(arr[i] < smallest){
                smallest = arr[i];
            }
            
        }

        print("largest is \(largest)")
        print("smallest is \(smallest)")

    }
    
    
    func findKthElement(_ inputArray:[Int], elementSearch:Int){
        
    }
    
    
    
    
    /*
      Returns the k-th largest value inside of an array a.
      This is an O(n log n) solution since we sort the array.
    */
    public func kthLargest(_ a: [Int], _ k: Int) -> Int? {
      let len = a.count
      if k > 0 && k <= len {
        let sorted = a.sorted()
        return sorted[len - k]
      } else {
        return nil
      }
    }
    
    // MARK: - Randomized selection
    /*
      Returns the i-th smallest element from the array.
      This works a bit like quicksort and a bit like binary search.
      The partitioning step picks a random pivot and uses Lomuto's scheme to
      rearrange the array; afterwards, this pivot is in its final sorted position.
      If this pivot index equals i, we're done. If i is smaller, then we continue
      with the left side, otherwise we continue with the right side.
      Expected running time: O(n) if the elements are distinct.
    */
    public func randomizedSelect<T: Comparable>(_ array: [T], order k: Int) -> T {
      var a = array

      func randomPivot<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int) -> T {
        let pivotIndex = Int.random(in: low...high)
        a.swapAt(pivotIndex, high)
        return a[high]
      }

      func randomizedPartition<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int) -> Int {
        let pivot = randomPivot(&a, low, high)
        var i = low
        for j in low..<high {
          if a[j] <= pivot {
            a.swapAt(i, j)
            i += 1
          }
        }
        a.swapAt(i, high)
        return i
      }

      func randomizedSelect<T: Comparable>(_ a: inout [T], _ low: Int, _ high: Int, _ k: Int) -> T {
        if low < high {
          let p = randomizedPartition(&a, low, high)
          if k == p {
            return a[p]
          } else if k < p {
            return randomizedSelect(&a, low, p - 1, k)
          } else {
            return randomizedSelect(&a, p + 1, high, k)
          }
        } else {
          return a[low]
        }
      }

      precondition(a.count > 0)
      return randomizedSelect(&a, 0, a.count - 1, k)
    }

    
    // MARK :- Array 2D
    // https://github.com/raywenderlich/swift-algorithm-club/tree/master/Array2D
    
    
    func  createMultiDimenionalArray() {
        var cookies = [[Int]]()
        for _ in 1...9 {
            var row = [Int]()
            for _ in 1...7 {
                row.append(0)
            }
            cookies.append(row)
        }
        
        print(cookies)
        var chocklets = [[Int]]()
        for _ in 1...9 {
            var row = [Int]()
            for _ in 1...7 {
                row.append(0)
            }
            chocklets.append(row)
        }
        
        print(chocklets);
        
        let myCookie = chocklets[3][6]
        print(myCookie)

    }
    
    // 1. Find the missing number in integer array of 1 to 100? (solution)
    
    // MARK : - Missing number
    
    func findMissingNumber(_ valueArray:[Int]) -> Int {
        
        // Work for unsorted Array as well
        // but the difference should be only one
        
//        (n+1)*(n+2)/2 - gives total  expected  sum
        let expectedSum  = (valueArray.count+1)*(valueArray.count+2)/2;

        var actualSum = 0
        for i in valueArray {
            actualSum += i
        }
        return expectedSum - actualSum

    }
    
    // Find the smallest missing number
   // Given a sorted array of n distinct integers where each integer is in the range from 0 to m-1 and m > n. Find the smallest number that is missing from the array.
    
    // Input: {0, 1, 2, 6, 9}, n = 5, m = 10
   //  Output: 3
    
    
    // https://www.geeksforgeeks.org/find-the-missing-number-in-a-sorted-array/
    ///  A binary search based program to find the
    // only missing number in a sorted array of
    // distinct elements within limited range.
    // https://www.tutorialspoint.com/data_structures_algorithms/binary_search_algorithm.htm
    
    // https://www.geeksforgeeks.org/find-the-only-missing-number-in-a-sorted-array/
    func findMissingNumberSorted(_ valueArray:[Int]) {
//        let missingValuesArrayTwo = [4, 5, 6, 7, 19,20];
        var missing = 0
        var first = 0
        var last = valueArray.count-1
        var middle = (first + last)/2
        while first < last {
            if ((valueArray[middle] - valueArray[first]) != (middle - first)) {
                /* there is a hole in the first half */
                if ((middle - first) == 1 && (valueArray[middle] - valueArray[first] > 1)) {
                    missing = (valueArray[first] + 1);
                    print("missing first half \(missing)")
                    break
                }
                last = middle;
            }
            else if ((valueArray[last] - valueArray[middle]) != (last - middle)) {
                /* there is a hole in the second half */
                if ((last - middle) == 1 && (valueArray[last] - valueArray[middle] > 1)) {
//                    return (valueArray[middle] + 1);
                    missing = (valueArray[middle] + 1);
                    print("missing second half  \(missing)")
                    break
                }
                first = middle;
            }
        else {
            print("no missing")
                break
        }
            middle = (first + last)/2;
        }
    }
    
    // this work find the missing element from array
    // more than one element
    func findMissingNumberSortedTwo(_ valueArray:[Int]) {
        
//        let missingValuesArrayTwo = [0, 1, 2, 6, 7];
        
//        let missingValuesArrayTwo = [4, 7, 9, 16, 19];

        var missing = 0
        for i in 0..<valueArray.count-1 {
            let x = valueArray[i+1]
            let y = valueArray[i] + 1
            if x != y {
                missing = y
                print("missing \(missing)")
//                break
            }
        }
    }
    
    // concept
    // Method 2 (Linear Search)
//    If arr[0] is not 0, return 0. Otherwise traverse the input array starting from index 0, and for each pair of elements a[i] and a[i+1], find the difference between them. if the difference is greater than 1 then a[i]+1 is the missing number.
    // O(n)
    func findMissingNumberSortedThree(_ valueArray:[Int]) {
        var missing = 0
        for i in 0..<valueArray.count-1 {
            let x = valueArray[i]
            let y = valueArray[i+1]
            if (x - y) > 1 {
                missing = valueArray[i]+1
                print("missing \(missing)")
//                break
            }
        }
    }
    
    func findMissingNumberSortedFour(_ valueArray:[Int]) {

    }
    
//    Find the smallest positive number missing from an unsorted array | Set 1
//    You are given an unsorted array with both positive and negative elements. You have to find the smallest positive number missing from the array in O(n) time using constant extra space. You can modify the original array.
    
    // https://www.geeksforgeeks.org/find-the-smallest-positive-number-missing-from-an-unsorted-array/
    
   //  https://www.geeksforgeeks.org/?p=9755
    
    /*
     traverse the list for i= 0 to n-1 elements
     {
     check for sign of A[abs(A[i])] ;
     if positive then
     make it negative by   A[abs(A[i])]=-A[abs(A[i])];
     else  // i.e., A[abs(A[i])] is negative
     this   element (ith element of list) is a repetition
     }
     
 */
    func findMissingNumberUnsorted(_ valueArray: [Int]) {
        
//        let missingValuesArrayTwo = [2, 3, 7, 6, 8, -1, -10, 15];

        let segArray =  segregateArray(valueArray)
        
        let miss = findmissingPositive(valueArray, valueArray.count-segArray)
        print(miss)
        
    }
    
    func findmissingPositive(_ arrayVal:[Int], _ negativeSize : Int) -> Int {
        var valueArray = arrayVal
        for i in 0..<negativeSize {
            if abs(valueArray[i]) - 1  < negativeSize {
                if valueArray[abs(valueArray[i]) - 1] > 0 {
                    valueArray[abs(valueArray[i]) - 1] = -valueArray[abs(valueArray[i]) - 1];
                }
            }
            
        }
        for j in 0..<negativeSize {
            if valueArray[j] > 0 {
            print("j+1 \(j+1)")
                return j+1
            }
        }
      return negativeSize+1
        
    }
    
    func segregateArray(_ valueArray : [Int]) -> Int{
        
     //    swapping
//        [2, 3, 7, 6, 8, -1, -10, 15];
        //  [-1, 3, 7, 6, 8, 2, -10, 15];
        var values = valueArray
        var j = 0
        for i in 0..<values.count {
                if values[i] < 0 {
                    values.swapAt(i, j)
                    j = j+1
                }
        }
        return j
    }
    
    // MARK: - Duplicates
    
    func findDuplicates (_ values : [Int]) {
        var valueArray = values
        for i in 0..<valueArray.count {
            if valueArray[abs(valueArray[i])] >= 0 {
                print(" before valueArray \(valueArray[i])");
             valueArray[abs(valueArray[i])] = -valueArray[abs(valueArray[i])];
                print(" after valueArray \(valueArray[i])");
                }
            else {
                print(" duplicte \(abs(valueArray[i]))");
            }
        }
    }
    
    func uniqueElementsFrom<T: Hashable>(array: [T]) -> [T] {
      var set = Set<T>()
      let result = array.filter {
//        guard !set.contains($0) else {
//          return false
//        }
        set.insert($0)
        return true
      }
      return result
    }
    
    func removeDuplicatesFromSortedArray(_ arr: inout [Int]) -> Int {
        if arr.count < 2 {
            return arr.count
        }
        var index: Int = 1
        let n: Int = arr.count
        for i in 1 ..< n {
            if arr[i] != arr[i-1] {
                arr[index] = arr[i]
                index += 1
            }
        }
        return index
    }
    
    func dupPractice() {
        var intArray = [4, 2, 4, 5, 2, 3, 1]
//        var sortArray = [2,4,4,14,15,15,22,23,31]
        
//        let expected = Array(sortArray[0..<withoutDup])
//        print(expected)

        var hashMap = [Int:Int]()
        
        for element in intArray {
//            hashMap[4] =  hashMap[4]??0 +1
            // hashMap[4] = 1
            // hashMap[2] = 1
             // hashMap[4] = 1+1

            hashMap[element] = hashMap[element] ?? 0 + 1
        }
        print(hashMap)

    }
    
    // hasing technique  - This approach may take O(n) time on average, but it requires O(n) extra space.
    func duplicates1()  {
        let intArray = [4, 2, 4, 5, 2, 3, 1]
        var newCounts : [Int:Int] = [:]
        for element in intArray {
            newCounts[element] = (newCounts[element] ?? 0) + 1
            if(newCounts[element]==1) {
                print("unique elementsss \(element)");
            }
        }
        
        print(newCounts);
        
        for (key, value) in newCounts {
            if value>=2 {
                print("\(key) occurs \(value) time(s)")
            }
        }
        
        let arr = ["FOO", "FOO", "BAR", "FOOBAR"]
        let counts = arr.reduce(into: [:]) { counts, word in counts[word, default: 0] += 1 }
        print(counts)  // ["BAR": 1, "FOOBAR": 1, "FOO": 2]
        for (key, value) in counts {
                print("\(key) occurs \(value) time(s)")
        }
        let letters = "abracadabra"
        let letterCount = letters.reduce(into: [:]) { counts, letter in
            counts[letter, default: 0] += 1
        }
                
    }
    
    // MARK: - Search
    
    // Check if array contains a number
    
    func searchElementInArray() {
        
        // sorted Array
        let intArray = [22, 23, 33,44]
        
        let elementToSearch = 33
        // Binary search : Time Complexity O(logn)
        
        let foundAtIndex = binarySearch(inputArr: intArray, searchItem: elementToSearch)
        let foundAtIndex2 = binarySearchTwo(matrixArray: intArray, low: 0, high: intArray.count-1, key: elementToSearch)
        print("foundAtIndex2 \(foundAtIndex2)")
        
        // hashing

    }
    
    func binarySearch<T:Comparable>(inputArr:Array<T>, searchItem: T) -> Int? {
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
    
    func binarySearchTwo(matrixArray : [Int],low:Int, high: Int, key :Int) -> Int   {
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
    
//    How to find all pairs on integer array whose sum is equal to given number? (solution)
    
    // https://www.geeksforgeeks.org/print-all-pairs-with-given-sum/
   
    
    // https://www.youtube.com/watch?v=I7Nz1XzzPYc
    
    
    func findMostCommonNameInArray() {
        
    }
    
    
    func countPairNaiveMethid(_ inputArray:[Int], k:Int) {
        
        var count = 0;
              
        for i in 0..<inputArray.count {
        
            for j in i+1..<inputArray.count {
                if(inputArray[i]+inputArray[j] == k) {
                count = count+1;

                }
//                if(inputArray[i] - inputArray[i] == k || inputArray[j] - inputArray[i] == k ) {
//                    count = count+1;
//                }
            }
        }
        
        print("count \(count)");

        
//            // Pick all elements one by one
//            for (int i = 0; i < n; i++)
//            {
//                // See if there is a pair of this picked element
//                for (int j = i+1; j < n; j++)
//                    if (arr[i] - arr[j] == k || arr[j] - arr[i] == k )
//                          count++;
//            }
//            return count;
//        }
    }
    
    func countPairsWithDiffK(_ inputArray:[Int], k:Int) {
        
             var count = 0;  // Initialize count
        

                   var dic :[Int:Int] = [1:1]
        
        var dicTwo :[String:Int] = ["1":1, "2":2]

        
                   for i in inputArray
                    {
                        dic[i] = 1;
                    }
                for i in inputArray {
                    let x = i;
                    
                    if(((x-k)>0 || (x-k)==0) && (dic[x-k] != nil)) {
//                        print("pair with given no is ( \(i) , \(target) )")
//                        print((dic[x-k]))

                        count = count+1;
                    }
                    else if(((x+k)>0 || (x-k)==0) && (dic[x+k] != nil)) {
                        count = count+1;
//                        print((dic[x+k]))

//                        print("pair with given no is ( \(i) , \(dic[x-k]) )")

                    }
                    else {
                        dic[x] = 0;
                    }
        }
        print("count \(count)");
    }
    
    // Hashing O (n)
    // https://www.geeksforgeeks.org/given-an-array-a-and-a-number-x-check-for-pair-in-a-with-sum-as-x/
    // Given an array A[] and a number x, check for pair in A[] with sum as x
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
    
    
    func minSum(num: [Int], k: Int) -> Int {
        // Write your code here
        // if array count is less than 1 return 0 or empty
        
        var w = 6.5
        w.round(.toNearestOrAwayFromZero)
        
     if(num.count < 1){
         return 0;
     }
    var finalVal = 0.0;
     for i in 1..<k {
     for j in num {
        finalVal  = finalVal + Double((j/2));
    finalVal.round(.toNearestOrAwayFromZero)

     }
     }
        return Int(finalVal);
    }
    
  
    
    
    // MARK: - Common Elements
    
    func findCommonElementsInTwoArray() {
    let firstArray = [9,54,59,60,66,362,372,399,400,411,428]
    let secondArray = [9,400,62,399]
        
//  let mergeArray =  firstArray + secondArray;
    
    let newArray  = firstArray.filter { (string) -> Bool in
    return secondArray.contains(string)
    }
//    print (newArray)
    }
    
    // with Hashing
    
    // All Hashing operations take a constant amount of time, so inserting, retrieving, and removing are all O(1)
    
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
    
    // This will work only for sorted array
   // O(n1 + n2 ) where n1, n2
    func findCommonWithWhileLoop() {
        let firstArray = [9,54,59,60,66,362,372,399,400,411,428]
        let secondArray = [9,400,62,399]
        var i = 0, j = 0
        while i < firstArray.count && j < secondArray.count {
            if (firstArray[i] == secondArray [j]) {
                print("equal elements \(firstArray[i])")
                i = i+1
                j = j+1
            }
            else if (firstArray[i] < secondArray[j]) {
                i = i+1
            }
            else {
                j = j+1
            }
        }
    }
    
    // MARK: - Difference between elements
    
//    A little explanation: subArray = slice(1) gets all but the first element. map returns a new value for each of those, and the value returned is the difference between the element and the corresponding element in A, (the un-sliced array), so A[i] is the element before [i] in the slice.
    

    func flatMapTest () {
        
        let arrayOfArrays = [ [1, 1], [2, 2], [3, 3] ]
        let flattenedArray = arrayOfArrays.flatMap { array in
            return array.map { integer in
                return integer * 2
            }
        }
        print(flattenedArray) // outputs: [ 2, 2, 4, 4, 6, 6 ]
    }
    
    func calcaulateDiff () {
        
        
//        let firstArrayTwo = [59,54,59,60,61]
//
//        let subArrayTwo =  [1...firstArrayTwo.count-1]
//
//        let indexAndNumTwo = subArrayTwo.enumerated().map { (arg) -> [Int] in
//
//            let (index, element) = arg
//            return element - firstArrayTwo[index]
//        }

        
        
        
        // array with difference
        let firstArray = [59,54,59,60,61]
        let subArray = firstArray[1...firstArray.count-1]
        let indexAndNum = subArray.enumerated().map { (index,element) in
            return element - firstArray[index]
        }
        
        print(indexAndNum)

        
        // which has specific difference

        let diff1 = subArray.enumerated().map { (arg) -> Int in
            let (index, element) = arg
            let diff = element - firstArray[index]
            if diff == 1 {
                return diff
            }
            else {
                return 0
            }
        }
        
        print(diff1)
        
        
        // elements which has 1 difference

        let diff2 = subArray.enumerated().filter { (arg) -> Bool in
            let (index, element) = arg
            return (element - firstArray[index]) == 1
        }
        
        print(diff2)
        
        let names: Set = ["Sofia", "Camilla", "Martina", "Mateo", "Nicolás"]
        var shorterIndices: [SetIndex<String>] = []
        for (i, name) in zip(names.indices, names) {
            if name.count <= 5 {
                shorterIndices.append(i)
            }
        }
        
        for i in shorterIndices {
            print(names[i])
        }
        
    }
    
    
//    if (n==0 || n==1){
//               return n;
//           }
//           int j = 0;//for next element
//           for (int i=0; i < n-1; i++){
//               if (arr[i] != arr[i+1]){
//                   arr[j++] = arr[i];
//               }
//           }
//           arr[j++] = arr[n-1];
//           return j;
    
    // Method 2: (Constant extra space)
   //  Just maintain a separate index for same array as maintained for different array in
        
        func RemoveDuplicates() {
            
            var intArray = [2, 3, 3, 5, 12, 13, 13]
            
             // To store index of next unique element
             var j = 0;
            
            for i in 0..<intArray.count-1 {
                if (intArray[i] != intArray[i+1]) {
                    intArray[j] = intArray[i];
                    j += 1;
                }
            }
            intArray[j] = intArray[intArray.count-1];
            j += 1;

            for k in 0..<j {
                
           print("remove duplicates \(intArray[k])");

            }
            print("remove duplicates \(intArray)");

        }
        
        func forInTest() {
            var evenNumbers = [Int]()
            for number in (0...100) {
                guard evenNumbers.count < 10 else {
                    break
                }

                guard number % 2 == 0 else {
                    continue
                }
                evenNumbers.append(number)
            }
            print(evenNumbers)

        }
    
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
        
    
    func countPairs(inputArray:[Int], sum:Int) {
//        var mapDic = [Int:Int]();
//        var count = 0
//        for i in 0..<inputArray.count {
//            mapDic[inputArray[i]] = i
//        }
////        twice_count += m[sum-arr[i]];
////countPairs
////        let arrayTwow = [-4, 0, 1, 2, 4, -23, 7, 6, 9, 12, 8]
//
//        print("mapDic \(mapDic)")
//        for i in 0..<inputArray.count {
//            print("mapDic \(mapDic)")
//            print("mapDic[sum-inputArray[i]]! \(mapDic[sum-inputArray[i]]!)")
//            count = count + mapDic[sum-inputArray[i]]!
//            if((sum - inputArray[i]) == inputArray[i]){
//                count = count+1;
//            }
//        }
//        print("count is \(count)")
    }

        
        // MARK - Fibonacci Function
    // DP
        func fibonacci(_ n: Int) -> Int {
            var memo = [Int:Int]()

            if n == 0 {
                return 0
            } else if n == 1 {
                return 1
            } else {
                if memo[n] == nil {
                    memo[n] = fibonacci(n - 1) + fibonacci(n - 2)
                }
                return memo[n]!
            }
        }
        
        func fib(_ n :Int)->Int
        {
            if (n <= 1) {
                return n;
            }
            return fib(n-1) + fib(n-2);
        }
       
        func printFibSeries(_ n:Int) {
            
            var t1 = 0
            var t2 = 1
            var nexTerm = 0
            
            nexTerm = t1+t2;
            
         print("Fibonacci Series \(t1), \(t2)");

            while(nexTerm<n) {
                print(nexTerm);
                t1 = t2
                t2 = nexTerm;
                nexTerm = t1+t2;
                
            }
        }


//    void isPalindromeString(char str[])
//    {
//        // Start from leftmost and rightmost corners of str
//        int l = 0;
//        int h = strlen(str) - 1;
//
//        // Keep comparing characters while they are same
//        while (h > l)
//        {
//            if (str[l++] != str[h--])
//            {
//                printf("%s is Not Palindrome", str);
//                return;
//            }
//        }
//        printf("%s is palindrome", str);
//    }
//
        
        func checkPolindromeOrNot() {
            
          print("fibvalue \(fib(9))");
            
            printFibSeries(100);
            
            var nuber = 2002
            let temp = nuber;
            var sum = 0;
            var reverse = 0;
        
            while(nuber>0){
                reverse = nuber%10;
                print("reverse:\(reverse)");

                sum = sum*10+reverse;
                print("sum:\(sum)");


                nuber = nuber/10;
                print("nuber:\(nuber)");

            }
            
            if(temp == sum){
                print("polindrome:");
            }
            else {
                print("not polindrome:");
            }
            
        }
    
    func reverseString(_ s: inout [Character]) {

        let length = s.count
        let middle = s.count / 2

        for i in (0..<middle).reversed(){
            let j = length - 1  - i
            s.swapAt(i, j)
        }
    }
    
    func reverse(_ x: Int) -> Int {
        let negative = x < 0
        var x = negative ? -x : x
        var result = 0

        while x > 0 {
            result = result * 10 + x % 10
            x = x / 10
        }

        if Int32.max < result || Int32.min > result {
            return 0
        }

        return negative ? -result : result
    }
        
    func Reversesolution(_ array:[Int]) -> [Int] {
        var reverseArray: [Int] = [Int]()
        var i = array.count - 1
        while i >= 0 {
            reverseArray.append(array[i])
            i =  i - 1
        }
        return reverseArray
    }
          
    func solutionWithSameArray(_ arr:[Int]) -> [Int] {
        var array = arr
        var start = 0
        var end = array.count - 1
        while start < end {
            let temp = array[start]
            array[start] = array[end]
            array[end] = temp
            start = start + 1
            end = end - 1
            
        }
        return array
    }
    
 
    func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array } // Recursion stop case
        
        let mIndex = array.count / 2
        
        //split left side of the array recursively
        let lArray = mergeSort(Array(array[0..<mIndex]))
        
        //split right side of the array recursively
        let rArray = mergeSort(Array(array[mIndex..<array.count]))
        
        // sort and merge the arrays together
        return merge(lSide: lArray, rSide: rArray)
    }

    func merge(lSide: [Int], rSide: [Int]) -> [Int] {
        var lIndex = 0, rIndex = 0
        
        // ordered array that will be merged in
        var mergedArray = [Int]()
        
        // compares left array elements with right array elements and order them into the array
        while lIndex < lSide.count && rIndex < rSide.count {
            if lSide[lIndex] < rSide[rIndex] {
                mergedArray.append(lSide[lIndex])
                lIndex += 1
                
            } else if lSide[lIndex] > rSide[rIndex] {
                mergedArray.append(rSide[rIndex])
                rIndex += 1
                
            } else {
                mergedArray.append(lSide[lIndex])
                lIndex += 1
                mergedArray.append(rSide[rIndex])
                rIndex += 1
            }
        }
        
        // adding the rest of the elements that dont need comparison into the merged array
        while lIndex < lSide.count {
            mergedArray.append(lSide[lIndex])
            lIndex += 1
        }
        
        while rIndex < rSide.count {
            mergedArray.append(rSide[rIndex])
            rIndex += 1
        }
        
        return mergedArray
    }


    /*
     ===================================================================
     ===================================================================
     ======================== QUICK SORT ===============================
     ===================================================================
     ===================================================================
     */

    func quicksort( arr: inout [Int], left: Int, right: Int) {
        print("quicksort called");
        if left < right {
            //partition instanciated so we can use the pivot to sort the left and right side
            let p = partition(arr: &arr, left: left, right: right)
            
            //sort left side
            print("quicksort first called");
            quicksort(arr: &arr, left: left, right: p - 1)
            print("quicksort two called");

            
            //sort right side
            quicksort(arr: &arr, left: p + 1, right: right)
            
            print("quicksort three called");

        }
    }

    func partition( arr: inout [Int], left: Int, right: Int) -> Int {
        
        print("partition called");
        let pivotValue = arr[right] //pivot here is the last element of the array
        var storeIndex = left
        
        //swaps the element with the storeIndex in case it is smalle then the pivot value
        for i in left..<right {
            if arr[i] < pivotValue {
                swap(arr: &arr, a: i, b: storeIndex)
                storeIndex += 1
            }
        }
        //after done all the swaps, we swap the right element(pivot) with the last stored element
        swap(arr: &arr, a: storeIndex, b: right)
        print("partition end");

        return storeIndex
    }

    func swap( arr: inout [Int], a: Int, b: Int) {
        let temp = arr[a]
        arr[a] = arr[b]
        arr[b] = temp
    }
    
    
    // The worst-case and average case performance of insertion sort is O(n^2)
    //         var test = [1, 8, 11, 100, 0, 6, 10, 12, 13, 101, 54, 7, 3, 2, 5, 4, 88]

    func insertionSort(_ array: [Int]) -> [Int] {
        var a = array             // 1
        for x in 1..<a.count {         // 2
            var y = x
            print("y \(y)")
            while y > 0 && a[y] < a[y - 1] { // 3
                a.swapAt(y - 1, y)
                y -= 1
                print("y-1 \(y)")

            }
        }
        return a
    }
    
    //         var test = [0, 16, 10, 12, 13, 101, 54, 7, 3, 2, 5, 4, 88]

    func OptimizeinsertionSort(_ array: [Int]) -> [Int] {
      var a = array
      for x in 1..<a.count {
        var y = x
        print("y \(y)")

        let temp = a[y]
        print("temp  for \(y) y is  \(temp)")

        while y > 0 && temp < a[y - 1] {
          a[y] = a[y - 1]                // 1
            print("running array \(a)")

          y -= 1
            print("y-1 \(y)")

        }
        a[y] = temp                      // 2
      }
      return a
    }

    
    
    //
//    Runtime:
//    Average: O(N^2)
//    Worst: O(N^2)
//    Memory:
//    O(1)
    func BubbleSort(elements:[Int]) -> [Int] {
        
        var array = elements;

       for i in 0..<array.count {
          for j in 1..<array.count-i {
            if(array[j] < array[j-1]) {
//              let tmp = array[j-1]
//              array[j-1] = array[j]
//              array[j] = tmp
                swap(arr: &array, a: j, b: j-1);
            }
          }
        }
        return array
    }
    
    func OptimizeBubbleSort(elements:[Int]) -> [Int] {
           var array = elements;
           for i in 0..<array.count {
              for j in 1..<array.count-i {
                if(array[j] < array[j-1]) {
                  let tmp = array[j-1]
                  array[j-1] = array[j]
                  array[j] = tmp
                }
              }
            }
            return array
       }
    
    /*function swaps the array's first element with last element,
    second element with last second element and so on*/
    func reverseArrayWithSwap(){
        var test = [1, 8, 11, 100, 0]
        let n = test.count
        for i in 0..<test.count/2 {
            swap(arr: &test, a: i, b: n-i-1);
        }
        print(test);

    }
    
    // The order may be LIFO(Last In First Out) or FILO(First In Last Out)
    // about recursion https://www.freecodecamp.org/news/how-recursion-works-explained-with-flowcharts-and-a-video-de61f40cb7f9/
    func factorial(n: Int) -> Int {
        print  ("I'm calculating F\(n)/n");
        if(n==0){
            return 1;
        }
        var s = factorial(n: n-1);
        print (" S result \(n) =  \(s) ");

        let f =  n*s;
        print ("Done F \(n) =  \(f) ");
        return f;
    }
    
    
}

