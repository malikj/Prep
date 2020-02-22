//
//  StringProblems.swift
//  ArrayInDetail
//
//  Created by malikj on 24/11/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import Foundation


class StringProblems {
    
    func firstNonRepeatingCharacterInString(string:String){
        
        var counts : [Character : Int] = [:]
        for character in string {
            counts[character] = (counts[character] ?? 0) + 1;
        }
        let nonRepeatingChars = string.filter({counts[$0] == 1})
        
        print("first nonRepeating is \(String(describing: nonRepeatingChars.first))")
    }
}

public class NumberToWords {
  
  static let lessThanTwenty = ["","One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Eleven","Tweleve","Thirteen","Fourteen","Fifteen","Sixteen","Seventeen","Eighteen","Nineteen"]
  static let tens = ["","Twenty","Thirty","Fourty","Fifty","Sixty","Seventy","Eighty","Nenety"]
  static let thousands = ["","Thousand","Million","Billion"]
  
  public class func numberToWords(number:Int) -> String{
    if number == 0 {
      return "Zero"
    }
    var num = number
    var result = ""
    var i = 0
    while num > 0 {
      if num % 1_000 != 0 {
        result = helper(n: num % 1_000) + thousands[i] + " " + result
      }
      num /= 1_000
      i += 1
    }
    return result.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines)
  }
  
  private class func helper(n:Int) -> String {
    if n == 0 {
      return ""
    }else if n < 20 {
      return lessThanTwenty[n]
    }else if n < 1_00 {
      return tens[n/10]  + helper(n: n%10)
    }else {
      return lessThanTwenty[n/1_00] + "Hundred" + helper(n: n%1_00)
    }
  }
  
}

private extension String {
    /*
     Ref: http://oleb.net/blog/2014/07/swift-strings/
     "Because of the way Swift strings are stored, the String type does not support random access to its Characters via an integer index — there is no direct equivalent to NSStringʼs characterAtIndex: method. Conceptually, a String can be seen as a doubly linked list of characters rather than an array."
     
     By creating and storing a seperate array of the same sequence of characters,
     we could hopefully achieve amortized O(1) time for random access.
     */
    func randomAccessCharactersArray() -> [Character] {
        return Array(self)
    }
}




extension String{
    
    public func countWords () -> Int{
        if self.count == 0
        {
            return 0
        }
        var countWotds:Int = 1
        for char in self{
            if char == "\n" || char == "\t" || char  == " "
            {
                countWotds+=1
            }
          }
        return countWotds
    }
    
    
    public func realCoutnWords () -> Int{
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        let countWotds = components.count
        return countWotds
    }
    
    

}
class strProblems {
    
   // https://www.geeksforgeeks.org/naive-algorithm-for-pattern-searching/
    
    
    func URLify(inputString : String, stringSize : Int) -> String {
        var newString : String = "";
        for letter in inputString {
            if(letter == " "){
                newString+="%20";
            } else {
                newString+=String(letter);
            }
            
        }
        return newString;
    }

//    let string1 : String = "Mr John Smith";
//    print(URLify(inputString: string1, stringSize: 13));
    // https://oj.leetcode.com/problems/longest-substring-without-repeating-characters/
    
    // t = O(N), s = O(1)
    static func longest(_ s: String) -> Int {
        let charArr = s.randomAccessCharactersArray()
        let len = charArr.count
        if len <= 1 {
            return len
        } else {
            var tmpMaxLen = 1
            var maxLen = 1
            var hashMap = Dictionary<Character, Int>()
            hashMap[charArr[0]] = 0
            for i in 1..<len {
                if let lastPosition = hashMap[charArr[i]] {
                    if lastPosition < i - tmpMaxLen {
                        tmpMaxLen += 1
                    } else {
                        tmpMaxLen = i - lastPosition
                    }
                } else {
                    tmpMaxLen += 1
                }
                hashMap[charArr[i]] = i
                if tmpMaxLen > maxLen {
                    maxLen = tmpMaxLen
                }
            }
            return maxLen
        }
    }
    
    // https://oj.leetcode.com/problems/longest-palindromic-substring/

    // t = O(N^2), s = O(1)
    static func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        var startIndex: Int = 0
        var maxLen: Int = 1
        var i = 0
        let charArr = s.randomAccessCharactersArray()
        while i < s.count {
            guard s.count - i > maxLen / 2 else {
                break
            }
            var j = i
            var k = i
            while k < s.count - 1 && charArr[k+1] == charArr[k] {
                k += 1
            }
            i = k + 1
            while k < s.count - 1 && j > 0 && charArr[k+1] == charArr[j-1] {
                k += 1
                j -= 1
            }
            let newLen = k - j + 1
            if newLen > maxLen {
                startIndex = j
                maxLen = newLen
            }
        }
        return String(charArr[startIndex ..< (startIndex + maxLen)])
    }
    
    static func patternSearch(pattern:String, text:String) {
        
        let patternCharactrer = Array(pattern)
        let textCharacters = Array(text)
        
        let M = patternCharactrer.count;
        let N = textCharacters.count;
        
        for i in 0..<N-M {
            for j in 0..<M {
                if(textCharacters[i+j] != patternCharactrer[j]){
                    break;
                }
                if(j == M) {
                    print("pattern found at index \(i)")
                }
            }
        }
    }
    
    /*
     def search(pattern, text):
     i, j, k = 0, 0, 0
     n = len(text)
     m = len(pattern)
     flag = 0
     while(i < n):
     if text[i] == pattern[j]:
     i += 1
     j += 1
     else:
     i += 1
     j = 0
     if j == m:
     j = 0
     i -= 1
     print(f'index found at {i-m+1}')
     flag += 1

     if(not flag):
     print('no match found !')

     search('ab', 'abracadabra')
     
     */
    
//    1. Traverse the input string with  two varaibles l and r where l =0 and r = n-1, n is the length of the input string
//
//    2.  while l < r
//
//        a. if s[l] is not a alphabet, then do l++
//        b. else if s[r] is not a alphabet, then do r--
//        c. else swap the characters in s[l] and s[r] and so l++, r--
    
    static func ReverseStringWithoutSpecialChar(_ characters:[Character]) {
        var chars = characters;
        var r = chars.count - 1;
        var l = 0;

        while (l < r)
        {
            if(!isAlphabet(x: chars[l])) {
                l = l+1;
            }
            else if(!isAlphabet(x: chars[l])) {
                r = r+1;
            }
            else {
                chars.swapAt(l, r);
                l = l+1;
                r = r-1;
            }
        }
        
        print("Reverse str \(chars)")
    }
    
    static func isAlphabet(x : Character) -> Bool{
        return ( (x >= "A" &&  x <= "Z") ||
                         (x >= "a" &&  x <= "z") );
    }

}
