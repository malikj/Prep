//
//  StringProblems.swift
//  ArrayInDetail
//
//  Created by malikj on 24/11/19.
//  Copyright © 2019 malikj. All rights reserved.
//

import Foundation


class StringProblems {
    
    func countCharacter(_ s: String) -> [Character:Int] {
               var charCount = [Character:Int]()
               for character in s.characters {
                   if let _ = charCount[character] {
                       charCount[character]! += 1
                   } else {
                       charCount[character] = 1
                   }
               }
               return charCount
           }
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let charCountS = countCharacter(s)
        let charCountT = countCharacter(t)
        if s.characters.count != t.characters.count {
            return false
        }
        for (key, value) in charCountS {
            if let count = charCountT[key] {
                if count == value {
                    continue
                }
            }
            return false
        }
        return true
    }
    
    func longestPalindrome(_ s: String) -> Int {
        var dict = [Character : Int]()
        var res = 0
        
        for c in s.characters {
            if var i = dict[c] {
                i += 1
                if i == 2 {
                    res += 2
                    i = 0
                }
                dict[c] = i
            } else {
                dict[c] = 1
            }
        }
        
        if dict.contains(where: {$0.1 > 0 }) {
            res += 1
        }
        
        return res
    }
    
    /**
     Check the given 2 string are permutaion of each other.
      both strings has to be the same lenght
      "ABC" is permutatino of "CBA"
     
     - parameter string1:
     - parameter string2:
     
     - returns: true if string1 and string2 is permutation of each other
     */
    public func stringPermutation(string1:String,string2:String) -> Bool{
      if string1.count != string2.count {
        return false
      } else if string1 == string2 {
        return true
      }
      return string1.sorted() == string2.sorted()
    }

    /**
     This is the solution using dictionary
     
     - parameter string1:
     - parameter string2:
     
     - returns: true if string1 and string2 is permutation of each other
     */
    public func stringPermutationWithDictionary(string1:String,string2:String) -> Bool{
      let string1Chars = string1
      let string2Chars = string2
      if string1Chars.count != string2Chars.count {
        return false
      } else if string1 == string2 {
        return true
      }
      
      var dict:[Character:Int] = [:]
      
      for char in string1Chars {
        if let count =  dict[char]  {
          dict[char] = count + 1
        }else {
          dict[char] = 1
        }
      }
      
      for char in string2Chars {
        if let count =  dict[char], count != 0  {
          dict[char] = count - 1
          if (count - 1) == 0 {
            dict.removeValue(forKey: char)
          }
        }else {
          return false
        }
        
      }
      return dict.isEmpty
    }
    
    //BasicCalculator
    /*
     Implement a basic calculator to evaluate a simple expression string.
     
     The expression string may contain open ( and closing parentheses ), the plus + or minus sign -, non-negative integers and empty spaces .
     
     You may assume that the given expression is always valid.
     
     Some examples:
     "1 + 1" = 2
     " 2-1 + 2 " = 3
     "(1+(4+5+2)-3)+(6+8)" = 23
     Note: Do not use the eval built-in library function.
     */
    
    func calculateI(_ s: String) -> Int {
        let arr = (s+"#").map{String($0)}
        var sign = 1
        var ans = 0
        var num = ""
        var bracket = [Int]()
        var currentBracket = 1
        for element in arr {
            if element == " " {
                continue
            }
            let e = Int(element) ?? -1
            if e >= 0 && e <= 9 {
                num += element
            }else if element == "("{
                bracket.append(sign)
                currentBracket *= sign
                sign = 1
            }else if element == ")" {
                ans += sign * (Int(num) ?? 0) * currentBracket
                num = ""
                sign = 1
                currentBracket *= bracket.removeLast()
            }else {
                ans += sign * (Int(num) ?? 0) * currentBracket
                num = ""
                sign = element == "+" ? 1 : -1
            }
        }
        return ans
    }
    
    func isAnagramTwo(_ s: String, _ t: String) -> Bool {
        // Is t anagram of s?
        /*
         - you get two strings s and t.
         -
         - first check that s and t have the same length
         - if they are of unequal length do the following
         -
         - let sum = 0
         - convert s into list of ascii values sChars.
         - sChars is a list of integers
         
         - similarly convert t into tChars, which is again a list of integers.
         
         - for n in 0..<length(s)
         -      sum += (sChars[n] - tChars[n])
         
         - after the for loop
         - if sum == 0, s and t are anagrams
         - otherwise they are not anagrams
    */
        
        guard s.count == t.count else {
            return false
        }
        
        var letters = [Int].init(repeating: 0, count: 26)
        for ch in s.unicodeScalars {
            // Values start at 97 so need the offset
            letters[Int(ch.value) - 97] += 1
        }
    
        for ch in t.unicodeScalars {
            letters[Int(ch.value) - 97] -= 1
        }
    
        return !letters.contains { $0 != 0 }
    }
    
    /*
       https://leetcode.com/problems/longest-common-prefix/
        
        Write a function to find the longest common prefix string amongst an array of strings.
        
        If there is no common prefix, return an empty string "".
        
        Example 1:
        
        Input: ["flower","flow","flight"]
        Output: "fl"
        Example 2:
        
        Input: ["dog","racecar","car"]
        Output: ""
        Explanation: There is no common prefix among the input strings.
        Note:
        
        All given inputs are in lowercase letters a-z.
    */
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        var prefix = ""
        guard strs.count > 0 else { return prefix }

        if let shortest = strs.min() {
            for ch in shortest {
                let testPrefix = prefix + String(ch)

                if strs.lazy.filter({ $0.hasPrefix(testPrefix)}).count  == strs.count {
                    prefix = testPrefix
                } else {
                    break
                }
            }
        }

        return prefix
    }
    
    /*
    * Given a string, you need to reverse the order of characters in each word
    * within a sentence while still preserving whitespace and initial word order.
    *
    * Example 1:
    * Input: "Let's take LeetCode contest"
    * Output: "s'teL ekat edoCteeL tsetnoc"
    */
    
    func reverseWords(_ s: String) -> String {
        guard s.count > 0 else {
            return ""
        }
        var res = s.split(separator: " ").map{ $0.reversed() }.reduce(""){ $0 + " " + $1}
        res.remove(at: res.startIndex)
        return res
    }
    
    func firstNonRepeatingCharacterInString(string:String){
        
        var counts : [Character : Int] = [:]
        for character in string {
            counts[character] = (counts[character] ?? 0) + 1;
        }
        let nonRepeatingChars = string.filter({counts[$0] == 1})
        
        print("first nonRepeating is \(String(describing: nonRepeatingChars.first))")
    }
    
    /**
    Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words. You may assume the dictionary does not contain duplicate words.
    
    For example, given
    s = "leetcode",
    dict = ["leet", "code"].
    
    Return true because "leetcode" can be segmented as "leet code".
    */

    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        if s.isEmpty {
            return true
        }
        
        if wordDict.count == 0 {
            return false
        }
        
        var wordArray = Array.init(repeating: false, count: s.count + 1)
        wordArray[0] = true
        
        for i in 1...s.count {
            for j in stride(from: i-1, through: 0, by: -1) {

                if wordArray[j] && wordDict.contains(String(s[s.index(s.startIndex, offsetBy: j)..<s.index(s.startIndex, offsetBy: i)])) {
                    wordArray[i] = true
                    break
                }
            }
        }
        
        return wordArray[s.count]
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
