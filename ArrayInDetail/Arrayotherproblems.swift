

protocol Item {
    init(filename: String)
}

//protocol Screen {
//    associatedtype ItemType : Item
//    var items: [ItemType] { get set }
//}

//protocol Screen {
//    associatedtype ItemType: Item
//    var items: [ItemType] { get set }
//}

protocol Screen {
    associatedtype ItemType: Item
    associatedtype ChildScreen: Screen
//    associatedtype ChildScreen: Screen where ChildScreen.ItemType == ItemType
    var items: [ItemType] { get set }
    var childScreens: [ChildScreen] { get set }
}



struct Movie: Item {
    var filename: String
}

struct Song: Item {
    var filename: String
}

//class MainScreen: Screen {
//    var items = [Movie]()
//    var childScreens = [MainScreen]()
//
//}

class MainScreen<T:Item>: Screen {
    var items = [T]()
    var childScreens = [CategoryScreen]()
}

class CategoryScreen: Screen {
    var items = [Song]()
    var childScreens = [DetailScreen]()
}

class DetailScreen: Screen {
    var items = [Movie]()
    var childScreens = [DetailScreen]()
}
//struct Stack<Element>: Container {
//    // original Stack<Element> implementation
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//    // conformance to the Container protocol
//    mutating func append(_ item: Element) {
//        self.push(item)
//    }
//    var count: Int {
//        return items.count
//    }
//    subscript(i: Int) -> Element {
//        return items[i]
//    }
//}


protocol Row {
    /// PAT Placeholder for unknown Concrete Type `Model`
    associatedtype Model
    /// Recieves a parameter of Concrete Type `Model`
    func configure(with model: Model)
}

struct AnyRow<I>: Row {
    private let configureClosure: (I) -> Void
    /// Initialiser guaratees that `Model`
    /// should be a `Type` of `I`
    init<T: Row>(_ row: T) where T.Model == I {
        /// Matches the row `configure` func
        /// to the private the `configureClosure`
        configureClosure = row.configure
    }
    /// Conforming to `Row` protocol
    func configure(with model: I) {
        configureClosure(model)
    }
}

protocol Storage {
  associatedtype Item
  var items: [Item] { set get }
  var size: Int { get }
  mutating func add(item: Item)
  mutating func remove() -> Item
  func showCurrentInventory() -> [Item]
  associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
  func makeIterator() -> Iterator
}

class Dollor {
    
}

protocol Money {
    associatedtype Currency : Dollor
  var currency: Currency { get }
  var amount: Float { get }
  func sum<M: Money>(with money: M) -> M where M.Currency == Currency
}

////
///
///
////  Arrayotherproblems.swift
////  ArrayInDetail
////
////  Created by malikj on 28/10/19.
////  Copyright © 2019 malikj. All rights reserved.
////
//
//import Foundation
////
////Skip to content
////Search or jump to…
////
////Pull requests
////Issues
////Marketplace
////Explore
////
////@malikj
////Learn Git and GitHub without any code!
////Using the Hello World guide, you’ll start a branch, write comments, and open a pull request.
////
////
////1
////00khawajafarooq/tech-rhyme
//// Code Issues 0 Pull requests 0 Projects 0 Wiki Security Insights
////tech-rhyme/TechRhyme.playground/Pages/Array.xcplaygroundpage/Contents.swift
////@khawajafarooq khawajafarooq Remove duplicates
////b839925 on 7 Oct 2018
////476 lines (353 sloc)  10.1 KB
//  
////: [Previous](@previous)
//import Foundation
//
//
//func duplicate(_ array: [Int]) -> [Int] {
//    
//    guard !array.isEmpty else { return [] }
//    
//    var result: [Int] = []
//    var dictionary: [Int: Int] = [:]
//    
//    for item in array {
//        
//        if let number = dictionary[item],
//            !result.contains(number) {
//            result.append(number)
//        } else {
//            dictionary[item] = item
//        }
//    }
//    
//    return result
//}
//
////func duplicate([0,1,2,5,3,1,3,0])
//
//func duplicate(_ array: [Int], _ k: Int) -> Int {
//    
//    var dict: [Int: Int] = [:]
//    
//    for item in array {
//        
//        if let count = dict[item] {
//            dict[item] = count + 1
//        } else {
//            dict[item] = 1
//        }
//    }
//    
//    for (item, count) in dict {
//        if count == k {
//            return item
//        }
//    }
//    
//    return -1
//}
//
////duplicate([0,1,2,5,3,1,1,1,3], 4)
//
//// Reverse an array
//// Input: A = [2, 6, 3, 1, 7]
//// Output: A = [7, 1, 3, 6, 2]
//let A = [2, 6, 3, 1, 7]
//func reverser<T>(_ array: [T]) -> [T] {
//    
//    guard array.count > 1 else { return array }
//    
//    var a = array
//    
//    var result: [T] = []
//    array.forEach { _ in
//        result.append(a.removeLast())
//    }
//    
//    return result
//}
//
////reverser(A)
//
//// Array left rotation
//// Input: A = [2, 6, 3, 1, 7], d = 2
//// Output: A = [3, 1, 7, 2, 6]
//func leftRotation<T>(_ array:[T], d: Int) -> [T] {
//    var result = array
//    
//    guard array.count > 1 else { return array }
//    
//    for _ in 1...d {
//        result.append(result.removeFirst())
//    }
//    
//    return result
//}
//
////leftRotation(A, d: 2)
//
//// Rotation with index
//// expected index: 2, 3, 4, 0, 1
//// index = d + i % size
//// 2, 3, 4, 0, 1
//func leftRotationMod<T>(_ array:[T], d: Int) -> [T] {
//    var result: [T] = []
//    
//    for i in 0..<array.count {
//        let index = d + i % array.count
//        result[i] = array[index]
//    }
//    
//    return result
//}
//
////leftRotation(A, d: 2)
//
//// Array right rotation
//// Input: A = [2, 6, 3, 1, 7], d = 2
//// Output: A = [1, 7, 2, 6, 3]
//// Rotation with index
//// expected index: 3, 4, 0, 1, 2
//// index = d + i + 1 % size
//// 3, 4, 0, 1, 2
//func rightRotationMod<T>(_ array:[T], d: Int) -> [T] {
//    var result: [T] = []
//    
//    for i in 0..<array.count {
//        let index = (d + i + 1) % array.count
//        result.append(array[index])
//    }
//    
//    return result
//}
//
////rightRotationMod(A, d: 2)
//// shuffle an array
////func shuffle<T:Comparable>(_ a:[T]) -> [T] {
////    var array = a
////    guard !array.isEmpty else { return array }
////
////    // loop throughout the array
////    // get random index
////    // swap current index with random index
////    var last = array.count - 1
////    while (last > 0) {
////        let rand = Int.random(in: 0..<last)
////        array.swapAt(last, rand)
////        last -= 1
////    }
////
////    return array
////}
////shuffle(["A", "B", "C", "D", "F", "M", "P"])
////shuffle([1,4,3,6,8,10])
//
//var m = [1,4,3,6,8,10]
////m.shuffle() // swift 4.2
//// Find two maximum from array
//func findTwoMax(_ array: [Int]) -> (Int, Int)? {
//    guard array.count > 1 else {
//        return nil
//    }
//    
//    var max = Int.min
//    var secondMax = Int.min
//    
//    for i in 0..<array.count {
//        
//        if max < array[i] {
//            secondMax = max
//            max = array[i]
//        }
//        else if secondMax < array[i] {
//            secondMax = array[i]
//        }
//    }
//    
//    return (max, secondMax)
//}
//
////findTwoMax([1,12,3,7,6,5,8,14])
//
//func twoMax(_ array: [Int]) -> (Int, Int)? {
//    guard array.count > 1 else { return nil }
//    
//    let max = array.max()!
//    var secondMax = Int.min
//
//    array.forEach { element in
//        if secondMax < element &&
//            element < max {
//            secondMax = element
//        }
//    }
//    
//    return (max, secondMax)
//}
//
//let p = [1,12,3,7,6,5,8,14]
////twoMax(p)
//
//
//// Add a number to array
///* Test Cases
// Input: [1, 2, 3, 4]
// Output: [1, 2, 3, 5]
// 
// Input: [1, 2, 9, 9]
// Output: [1, 3, 0, 0]
// 
// Input: [9, 9, 9, 9]
// Output: [1, 0, 0, 0]
// 
// Input: []
// Output: [1]
// */
//
//// if 9 then carry
//// otherwise add 1
//// if complete number is greater than add array
//func addOneNumber(_ array: [Int]) -> [Int] {
//    
//    // if empty input
//    guard !array.isEmpty else { return [1] }
//    
//    var carry = 1
//    var result: [Int] = array.reversed().map {
//        let sum = $0 + carry
//        
//        if sum == 10 {
//            carry = 1
//            return 0
//        } else {
//            carry = 0
//            return sum
//        }
//    }
//    // Corner Case:
//    // if all of the values are 9
//    if carry != 0 {
//        result.append(carry)
//    }
//    
//    return result.reversed()
//}
//
////A = [1, 2, 9, 9]
////addOneNumber([9,9,9,9,1,2])
//
//
//// Two sum problem
//// Input: A = [0,9,5,2], target = 7
//// Output: [5,2]
//// brute-force
//func twoSum1(_ nums: [Int], target: Int) -> [Int] {
//
//    var times = 0
//    
//    for idx1 in 0..<nums.count {
//        for idx2 in 0..<nums.count where idx2 != idx1  {
//            times += 1
//            if nums[idx1] + nums[idx2] == target {
//                return [idx1, idx2]
//            }
//        }
//    }
//    
//    return []
//}
////twoSum1([0,5,2,9], target: 10)
//
//func twoSum2(_ array: [Int], target: Int) -> [Int] {
//    return array.filter { array.contains(target-$0) }
//}
//
////twoSum2([0,5,2,9], target: 7)
//
//func twoSum(_ nums: [Int], target: Int) -> [Int] {
//
//    var dict: [Int: Int] = [:]
//    
//    for idx in 0..<nums.count {
//        let diff = target - nums[idx]
//        if let value = dict[idx] {
//            return [value, idx]
//        } else {
//            dict[diff] = idx
//        }
//    }
//
//    return []
//}
//
////twoSum([0,9,5,2,1], target: 10)
//
////func duplicate(_ a1: [Int], _ a2: [Int]) -> [Int] {
////    return a1.filter{ return a2.contains($0) }
////}
////duplicate([0,9,5,2,1,33], [5,7,0,10,12,33])
//func duplicate(_ a1: [Int], _ a2: [Int]) -> [Int] {
//    return Set(a1).intersection(Set(a2)).map { $0 }
//}
//
//func removeDuplicates(_ nums: inout [Int]) -> Int {
//    
//    nums = nums.sorted()
//    var result: [Int] = []
//    for num in nums {
//        
//        if !result.contains(num) {
//            result.append(num)
//        }
//    }
//
//    nums.removeAll()
//    nums = result
//    return nums.count
//}
////
//////[1,2,0]
////
////var nums = [-999,-999,-998,-998,-997,-997,-996,-996,-995,-995,-994,-994,-993,-993,-992,-992,-991,-991,-990,-990,-989,-989,-988,-988,-987,-987,-986,-986,-985,-985,-984,-984,-983,-983,-982,-982,-981,-981,-980,-980,-979,-979,-978,-978,-977,-977,-976,-976,-975,-975,-974,-974,-973,-973,-972,-972,-971,-971,-970,-970,-969,-969,-968,-968,-967,-967,-966,-966,-965,-965,-964,-964,-963,-963,-962,-962,-961,-961,-960,-960,-959,-959,-958,-958,-957,-957,-956,-956,-955,-955,-954,-954,-953,-953,-952,-952,-951,-951,-950,-950,-949,-949,-948,-948,-947,-947,-946,-946,-945,-945,-944,-944,-943,-943,-942,-942,-941,-941,-940,-940,-939,-939,-938,-938,-937,-937,-936,-936,-935,-935,-934,-934,-933,-933,-932,-932,-931,-931,-930,-930,-929,-929,-928,-928,-927,-927,-926,-926,-925,-925,-924,-924,-923,-923,-922,-922,-921,-921,-920,-920,-919,-919,-918,-918,-917,-917,-916,-916,-915,-915,-914,-914,-913,-913,-912,-912,-911,-911,-910,-910,-909,-909,-908,-908,-907,-907,-906,-906,-905,-905,-904,-904,-903,-903,-902,-902,-901,-901,-900,-900]
////nums.count
////var n2 = [1,1,2]
////removeDuplicates(&n2)
////n2
////
//////let DS1 = Array(0...100000).filter { $0 % 2 == 0 }
//////let DS2 = Array(0...100000).filter { $0 % 2 == 0 }
//////duplicate(DS1, DS2)
////
////struct Interval {
////    let start: Int
////    let end: Int
////    init(_ start: Int, _ end: Int) {
////        self.start = start
////        self.end = end
////    }
////}
////
////extension Interval: Equatable {
////    static func == (lhs: Interval, rhs: Interval) -> Bool {
////        return lhs.start == rhs.start && lhs.end == rhs.end
////    }
////}
////
////extension Interval: CustomStringConvertible {
////    var description: String {
////        return """
////        (\(start),\(end))
////        """
////    }
////}
////
////// Merge intervals
////func mergeIntervals(_ a:[Interval]) -> [Interval] {
////
////    var array = a.sorted(by: { $0.start < $1.start })
////    var stack: [Interval] = []
////    stack.append(array[0])
////    for interval in array where interval != array[0] {
////
////        let top = stack.last!
////        if top.end < interval.start {
////            // push
////            stack.append(interval)
////        } else if top.end < interval.end {
////            // update
////            stack.removeLast()
////            stack.append(Interval(top.start, interval.end))
////        }
////    }
////
////    return stack
////}
////
////let intervals = [
////    Interval(1,3),
////    Interval(6,8),
////    Interval(5,7),
////    Interval(5,7),
////    Interval(2,4)
////]
////
//////let intervals = [
//////    Interval(6,8),
//////    Interval(1,9),
//////    Interval(2,4),
//////    Interval(2,4),
//////    Interval(4,7)
//////]
////print(mergeIntervals(intervals))
////
////
////struct Category {
////    let id: Int
////    let name: String
////}
////
////struct Subcategory {
////    let parentId: Int
////    let name: String
////}
////
////let countries: [Category] = [
////    Category(id: 1, name: "PAKISTAN"),
////    Category(id: 2, name: "INDIA"),
////    Category(id: 3, name: "GERMANY")
////]
////
////let cities: [Subcategory] = [
////    Subcategory(parentId: 1, name: "LAHORE"),
////    Subcategory(parentId: 1, name: "ISLAMABAD"),
////    Subcategory(parentId: 1, name: "KARACHI"),
////    Subcategory(parentId: 2, name: "MUMBAI"),
////    Subcategory(parentId: 2, name: "PUNE"),
////    Subcategory(parentId: 2, name: "CHENNAI"),
////    Subcategory(parentId: 3, name: "MUNIC"),
////    Subcategory(parentId: 3, name: "BERLIN")
////]
////
////func searching() {
////    
////    var result: [String] = []
////    
////    for city in cities {
////        for country in countries {
////            if city.parentId == country.id {
////                result.append(city.name)
////            }
////        }
////    }
////    
////    print(result)
////}
////
////searching()
////
//////Given a 2D array, where there are 0s and 1s (1 representing island) count how many islands are there, for example, [[0,1,1], [1,0,0], [0,1,0]] there are 3 islands there (because in the first row 2 of 1s are connected so they created a bigger island.
////
////let islands = [
////    [0,2,0,0],
////    [1,0,0],
////    [0,1,0]
////]
////
////func findIslands() {
////    let a = islands.filter{ $0.contains(1) }
////    print(a.count)
////}
////
////findIslands()
////
////
//////struct Business {
//////    let id: Int
//////    let reviewCount: Int
//////}
//////
//////func mergeSortedBusinesses(trendy: [Business], favorite: [Business]) -> [Business] {
//////    // TODO: COMPLETE ME
//////
//////    return Array(trendy + favorite).sorted(by: $0.reviewCount > $1.reviewCount)
//////
//////}
////
////
////
//////: [Next](@next)
//////© 2019 GitHub, Inc.
//////Terms
//////Privacy
//////Security
//////Status
//////Help
//////Contact GitHub
//////Pricing
//////API
//////Training
//////Blog
//////About
