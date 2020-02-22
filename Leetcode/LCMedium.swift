//
//  LCMedium.swift
//  ArrayInDetail
//
//  Created by malikj on 04/02/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import Foundation


class LCMedium {
    
    
    //47. Permutations II
    /*
     Given a collection of numbers that might contain duplicates, return all possible unique permutations.
     
     For example,
     [1,1,2] have the following unique permutations:
     [
     [1,1,2],
     [1,2,1],
     [2,1,1]
     ]
     */
    
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        func permute(nums: [Int], index: Int) {
            if index == nums.count {
                ans.append(nums)
            }else {
                var candidate = nums
                for i in index..<candidate.count {
                    if index != i && candidate[i] == candidate[index] { continue }
                    candidate.swapAt(index, i)
                    permute(nums: candidate, index: index + 1)
                }
            }
        }
        permute(nums: nums.sorted(), index: 0)
        return ans
    }
    
    //46. Permutations
    /*
     Given a collection of distinct numbers, return all possible permutations.
     
     For example,
     [1,2,3] have the following permutations:
     [
     [1,2,3],
     [1,3,2],
     [2,1,3],
     [2,3,1],
     [3,1,2],
     [3,2,1]
     ]
     */
    
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count <= 1 {
            return [nums]
        }
        var res = [[Int]]()
        for (i, num) in nums.enumerated() {
            var tmp = nums
            tmp.remove(at: i)
            for n in permute(tmp) {
                res.append([num] + n)
            }
        }
        return res
    }
    
    static func searchInsert(arrayData:[Int], targetValue : Int) -> Int{
        if(arrayData.count<1) {
            return 0
        }
        var position = 0;
        var low = 0, high = arrayData.count - 1, mid = 0;
        while low <= high {
            print(high-low/2)
            mid = low + (high - low)/2
            if(arrayData[mid] == targetValue) {
                return mid
            }
            else if(arrayData[mid]>targetValue) { //right
                high = mid - 1;
                position = mid;
            }
            else {
                low = mid + 1;
                position = mid + 1;
            }
        }
        return position;
    }
    /*
     
     int searchInsert(int A[], int n, int target) {
         if(n < 1) {
             return 0;
         }
         
         int low = 0;
         int high = n-1;
         int mid;
         int pos;
         while(low <= high) {
             mid = low + (high-low)/2;
             
             if(A[mid] == target) {
                 return mid;
             } else if(A[mid] > target) {
                 high = mid - 1;
                 pos = mid;
             } else {
                 low = mid + 1;
                 pos = mid + 1;
             }
         }
         
         return pos;
     }
     */

}

class MeetingRoomsIISolution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        if intervals.count <= 1 {
            return intervals.count
        }
        
        var sorted = intervals.sorted { (entry1, entry2) -> Bool in
            return entry1[0] < entry2[0]
        }
        
        print("after sort \(sorted)")

        var count = 1
        var previous = sorted.removeFirst()
        print("previous previous \(previous)")

        while !sorted.isEmpty {
            var i = 0
            while i < sorted.count {
                let current = sorted[i]
                print("current current \(current)")

                if current[0] >= previous[1] {
                    previous = sorted.remove(at: i)
                } else {
                    i += 1
                }
            }
            
            if sorted.count > 0 {
                count += 1
                previous = sorted.removeFirst()
//                print("previous previous \(current)")

            }
        }
        
        return count
    }
    
    func test() -> Void {
        print(minMeetingRooms([[0, 30],[5, 10],[15, 20]]))
        print(minMeetingRooms([[7,10],[2,4]]))
        print(minMeetingRooms([[1,5],[8,9],[8,9]]))
    }
}

public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}


class CanMeetingRoomsSolution {
    
//   static func canAttendMeetings(_ intervals: [Interval]) -> Bool {
//        if intervals.count == 0 {
//            return true
//        }
//        var ints = intervals
//        ints.sort{ $0.start < $1.start }
//        for i in 1..<ints.count {
//            if ints[i].start < ints[i-1].end {
//                return false
//            }
//        }
//
//        return true
//    }
  static  func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        if intervals.count <= 1 {
            return true
        }
        
        var intervals = intervals
        intervals.sort { (i1, i2) -> Bool in
            return i1[0] < i2[0]
        }
        
    //         print(canAttendMeetings([[0,30],[5,10],[15,20]]))
    
    //         print(canAttendMeetings([[7,10],[2,4]]))


        print("after sort \(intervals)")
        
        let begin = intervals[0][0]
        print("begin \(begin)")

        var end = intervals[0][1]
        print("end \(end)")

        for i in 1..<intervals.count {
            let range = intervals[i]
            print("range \(range)")
            if range[0] >= begin && range[0] < end {
                return false
            }
            
            end = range[1]
            print("end \(end)")

        }
        
        return true
    }
    
   static func test() -> Void {
        print(canAttendMeetings([[0,30],[5,10],[15,20]]))
        print(canAttendMeetings([[7,10],[2,4]]))
    }
}

public class Medium253: NSObject {
    public static func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        if intervals.isEmpty {
            return 0
        }
        
        var starts = intervals.map { $0[0] }
        var ends = intervals.map { $0[1] }
        starts.sort()
        ends.sort()
        
        var rooms = 0
        // end Index
        var ei = 0
        
       // start  [0, 5, 15]
        // start  [10, 20, 30]

        for si in 0..<starts.count {
            print("starts[si] \(starts[si])")
            print("ends[ei] \(ends[ei])")

            if starts[si] >= ends[ei] {
                rooms -= 1
                ei += 1
            }
            rooms += 1
        }
        
        return rooms
    }
    
    static func test() -> Void {
        print(minMeetingRooms([[0,30],[5,10],[15,20]]))
        print(minMeetingRooms([[7,10],[2,4]]))
    }

}


class SubdomainVisitCountSolution {
  static func subdomainVisits(_ cpdomains: [String]) -> [String] {
        if cpdomains.count == 0 {
            return []
        }
        
        var ret = [String]()
        var dictionary = ([String: Int]())
        for domain in cpdomains {
            let subStrings = domain.split(separator: " ")
            print("subStrings \(subStrings)")

            let numberString = subStrings[0]
            print("numberString \(numberString)")
            let number = Int(numberString)
            let domainString = subStrings[1]
            print("domainString \(domainString)")

            let domainComponents = domainString.split(separator: ".")
            print("domainComponents \(domainComponents)")

            var i = domainComponents.count - 1
            print("i \(i)")

            var matchedString = ""
            repeat {
                let componentString = String(domainComponents[i])
                print("componentString \(componentString)")

                matchedString = componentString + matchedString
                print("matchedString \(matchedString)")

                let count = dictionary[matchedString]
                print("count \(count)")
                if count == nil {
                    dictionary[matchedString] = number!
                } else {
                    dictionary[matchedString] = count! + number!
                }
                print("matchedString \(dictionary)")

                matchedString = "." + matchedString
                print("second matchedString \(matchedString)")

                i -= 1
            } while i >= 0
        }
      print("after dictionary \(dictionary)")

        for (k, v) in dictionary {
            let str = "\(v) " + k
            ret.append(str)
        }
        print("ret ret \(ret)")
        return ret
    }
    
   static func test() -> Void {
    
//    after dictionary ["intel.mail.com": 1, "com": 951, "wiki.org": 5, "mail.com": 901, "yahoo.com": 50, "org": 5, "google.mail.com": 900]
//        print(subdomainVisits(["9001 discuss.leetcode.com"]))
        print(subdomainVisits(["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]))
        print(subdomainVisits(["2777 nak.mkw.co","654 yaw.lmm.ca","3528 jyx.arz.us","3215 bll.hoh.network","408 tdt.zfz.network","3322 xhe.team","8342 srp.team","9259 bfo.net","3875 brk.ato.network","2531 mce.ser.com","2471 czb.us","4806 xss.dfa.co","654 yls.yjt.co","767 irh.epf.us","1501 ara.ca","243 qay.network","9103 vbo.org","6890 bfo.network","4296 xtb.jre.us","2329 vva.qay.network","9846 fuw.org","4681 lwf.ytn.network","1781 lbk.ksc.co","7464 jpd.fff.co","2740 xhe.org","4602 weq.buf.team","3055 fdy.jkx.com","5705 mqa.wsv.net","6629 vdu.bfo.team","9897 lra.uyy.org","8167 ahm.jre.team","9374 jep.ato.co","3624 vmv.epf.network","6865 thk.net","6920 tlc.dfa.us","9372 hci.jia.network","7968 gjf.network","7292 zbl.ksc.net","2862 coh.sci.net","3855 yjt.network","1387 hju.gbq.org","817 sgp.htq.co","2406 hkb.ocf.co","622 wmt.cwn.net","9172 zfz.net","1523 suq.bhp.co","9581 gqi.team","2160 hsj.epf.org","32 ulz.com","1225 lmm.ca","1137 ujs.qzi.co","5041 cdf.hwu.us","4126 lir.ajl.team","3111 gdw.team","8928 arz.org","9531 hoh.co","7344 czb.com","2715 ubt.okv.us","1110 kdd.znq.us","5729 srp.com","6122 nqk.srp.org","7193 xth.fzx.ca","3496 ytn.com","3950 xuf.network","4521 weh.bfo.us","3262 mor.ixi.us","4975 okv.com","7089 ske.yls.com","4198 xfs.okv.co","2444 vks.gxz.team","1789 xcf.zqy.ca","7392 uyy.net","3449 tfm.us","5907 zfz.us","9530 omu.network","3314 ytd.hkt.net","9523 wyv.cgl.network","4439 gtu.us","8390 zqk.network","1627 bhp.ca","3609 bhp.team","8557 uai.lfn.net","2913 ret.ych.ca","2447 ksc.com","7476 cze.yvr.net","8544 xrj.bhp.com","6129 hkt.com","8274 ulz.co","9219 tfm.ca","5016 zwv.gqi.co","5738 lar.bfo.team","3377 jkx.network","2979 bhp.org","8176 ujm.gqs.ca","84 lmm.network","3090 ycc.yjt.us","7042 btv.com","2965 gxj.org","8263 cwn.org","1873 kse.gjf.ca"]))
    }
}
