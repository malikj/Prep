//
//  Group.swift
//  ArrayInDetail
//
//  Created by malikj on 13/12/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import Foundation

class Model {
    let date: Date!
    let anotherProperty: String!

    init(date: Date, _ anotherProperty: String) {
        self.date = date
        self.anotherProperty = anotherProperty
    }
}

struct GroupInt {
    var grouping: Int
    var content: String
}


class Group {
    
    // https://www.geeksforgeeks.org/group-multiple-occurrence-of-array-elements-ordered-by-first-occurrence/

    
    static func multipleOccurenceOfArrayElements(){
        
    }
    
    
    static func FlatMapEx() {
        let giraffes = [[5, 6, 9], [11, 2, 13, 20], [1, 13, 7, 8, 2]]
        let tallest = giraffes.flatMap({ $0.filter({ $0 > 10 }) })
          // [11, 13, 20, 13]

        print(tallest)
        
        let stringNumber: String? = "5"
//        let intNumber = Int(stringNumber ?? default 0)

        let intNumber = stringNumber.map { Int($0) }
        print(intNumber)
        
        
        let numbers = [1, 2, 3, 4]

        let mapped = numbers.map { Array(repeating: $0, count: $0) }
        // [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4]]

        let flatMapped = numbers.flatMap { Array(repeating: $0, count: $0) }
        // [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]


    }
    
    static func GroupBy(){
        
        let modelArray = [
            Model(date: Date(), "Original Date"),
            Model(date: Date().addingTimeInterval(86400), "+1 day"),
            Model(date: Date().addingTimeInterval(172800), "+2 days"),
            Model(date: Date().addingTimeInterval(86401), "+1 day & +1 second"),
            Model(date: Date().addingTimeInterval(172801), "+2 days & +1 second"),
            Model(date: Date().addingTimeInterval(86400), "+1 day"),
            Model(date: Date().addingTimeInterval(172800), "+2 days")
        ]
        
//        let students = ["Kofi", "Abena", "Efua", "Kweku", "Akosua"]
//
//         let studentsByLetter = Dictionary(grouping: modelArray, by: { $0.first! })
//        let studentsByLetter = Dictionary(grouping: students, by: { $0.first! })
        
        let studentsByLetter = Dictionary(grouping: modelArray, by: { $0.date })

        print("groupDic \(studentsByLetter)")

        let groupDic = Dictionary(grouping: modelArray) { (pendingCamera) -> DateComponents in

            let date = Calendar.current.dateComponents([.day], from: (pendingCamera.date)!)

            return date
        }
        
        print("groupDic \(groupDic)")
        
        
//        day: 14 isLeapMonth: false : [ArrayInDetail.Model, ArrayInDetail.Model, ArrayInDetail.Model]
        
        // print(groupSortedDesc) // [["+2 days & +1 second", "+2 days", "+2 days"], ["+1 day & +1 second", "+1 day", "+1 day"], ["Original Date"]]

        
//        groupDic [year: 2019 month: 12 day: 13 isLeapMonth: false : [ArrayInDetail.Model], year: 2019 month: 12 day: 15 isLeapMonth: false : [ArrayInDetail.Model, ArrayInDetail.Model, ArrayInDetail.Model], year: 2019 month: 12 day: 14 isLeapMonth: false : [ArrayInDetail.Model, ArrayInDetail.Model, ArrayInDetail.Model]]

        
//        let a = [(grouping: 10, content: "a"),
//                 (grouping: 20, content: "b"),
//                 (grouping: 10, content: "c")]
//
//
//        print(a.group { $0.grouping })

        
        let b = [GroupInt(grouping: 10, content: "a"),
                 GroupInt(grouping: 20, content: "b"),
                 GroupInt(grouping: 10, content: "c")]
        
    
        let ss = Dictionary(grouping: b, by: { $0.grouping })
        
        print("SS \(ss)")
        
        
//       let c =  {5, 3, 5, 1, 3, 3}
        
        let numbers = [5, 3, 5, 1, 3, 3]
        
        let sss = Dictionary(grouping: numbers) { $0
        }

        print("sss \(sss)")

        print("sss \(sss.values)")

        
        
        
//        SS [20: [ArrayInDetail.GroupInt(grouping: 20, content: "b")], 10: [ArrayInDetail.GroupInt(grouping: 10, content: "a"), ArrayInDetail.GroupInt(grouping: 10, content: "c")]]

        
        
    }
    
    static func HighOrderFunctions(){
        //
        
        let stringNumber: String? = "5"
        let intNumber = stringNumber.map { Int($0) }
        
        //  HighOrderFunc.swift
        //  SwiftImportantConcepts
        //
        //  Created by malikj on 23/11/19.
        //  Copyright © 2019 malikj. All rights reserved.
        //
                 let numbers = [1, 2, 3, 4, 3, 3]
                
                var values: [Any] = [1, 2]

                for i in 0..<values.count{
        //            values[i] = values[i] + 1
                }

                    //1. filter into [3, 3, 3], then filter into [2, 4] (even numbers)

                    var filtered = numbers.filter({return $0 % 2 == 0})
        

                //    filtered

                print(filtered);
        
                    var filteredArray = [Int]()
                    for number in numbers {
                        if number % 2 == 0 {
                            filteredArray.append(number)
                        }
                    }
        //            filteredArray
                print(filteredArray);

                    filteredArray.append(23232)
        
                    filtered.append(22);


                    //2. transform [1, 2, 3, 4] -> [2, 4, 6, 8] using map

                    let transformed = [1, 2, 3, 4].map({return $0 * 3})
        //            transformed

                print(transformed)
                    var transformedArray = [Int]()
                    for number in [1, 2, 3, 4] {
                        transformedArray.append(number * 2)
                    }
        //            transformedArray
                
                print(transformedArray)



                    //3. sum [1, 2, 3, 4] -> 10 using reduce

                    let sum = [1, 2, 3, 4].reduce(0, {sum, number in sum + number})
        //            sum

                print(sum)

                    var sumElements = 0
                    for number in [1, 2, 3, 4] {
                        sumElements += number
                    }
        //            sumElements
                
                print(sumElements)
          
    }
}
    
//    void groupRepeated(int arr[], int n)
//    {
//        unordered_map<int, int> m;
//        for (int i=0; i<n; i++) m[arr[i]]++;
//        int i=0;
//        while (i<n)
//        {
//            if (m[arr[i]])
//            {cout << arr[i] << " "; m[arr[i]]--; }
//            else i++;
//        }
//    }
//}
//}
