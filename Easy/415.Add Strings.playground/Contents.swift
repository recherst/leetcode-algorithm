/**
 Given two non-negative integers, num1 and num2 represented as string, return the sum of num1 and num2 as a string.

 You must solve the problem without using any built-in library for handling large integers (such as BigInteger). You must also not convert the inputs to integers directly.

  

 Example 1:
 Input: num1 = "11", num2 = "123"
 Output: "134"
 
 Example 2:
 Input: num1 = "456", num2 = "77"
 Output: "533"
 
 Example 3:
 Input: num1 = "0", num2 = "0"
 Output: "0"
  

 Constraints:
 - 1 <= num1.length, num2.length <= 104
 - num1 and num2 consist of only digits.
 - num1 and num2 don't have any leading zeros except for the zero itself.
 */
class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        let sample: [Character: Int] = ["0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9]
        var num1Arr: [Character] = num1.map { $0 }.reversed()
        var num2Arr: [Character] = num2.map { $0 }.reversed()
        var carryCount = 0
        var result = ""
        if num1Arr.count < num2Arr.count {
            let temp = num1Arr
            num1Arr = num2Arr
            num2Arr = temp
        }
        
        for (i, c) in num1Arr.enumerated() {
            let n1 = sample[c]!
            var number = 0
            if i <= num2Arr.count - 1 {
                let n2 = sample[num2Arr[i]]!
                number = n1 + n2
            } else {
                number = n1
            }
            if i > 0 && i == carryCount {
                number += 1
            }
            if number >= 10 {
                result.append("\(number)".last!)
                carryCount = i + 1
            } else {
                result.append("\(number)")
            }
        }
        if carryCount == num1Arr.count {
            result.append("1")
        }
        
        let arr: [String] = result.map { String($0) }.reversed()
        return arr.joined()
    }
}

let s = Solution()
let r = s.addStrings("52", "60")
print(r)
