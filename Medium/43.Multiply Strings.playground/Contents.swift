/**
 Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

 Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

  

 Example 1:
 Input: num1 = "2", num2 = "3"
 Output: "6"
 
 Example 2:
 Input: num1 = "123", num2 = "456"
 Output: "56088"
  

 Constraints:
 - 1 <= num1.length, num2.length <= 200
 - num1 and num2 consist of digits only.
 - Both num1 and num2 do not contain any leading zero, except the number 0 itself.
 */
class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" { return "0" }
        var arr = Array(repeating: 0, count: num1.count + num2.count)
        var flagArr = arr
        for (i, c1) in num1.enumerated() {
            for (j, c2) in num2.enumerated() {
                let result = Int("\(c1)")! * Int("\(c2)")!
                if result > 9 {
                    arr[i + j] += Int("\("\(result)".first!)")!
                    arr[i + j + 1] += Int("\("\(result)".last!)")!
                } else {
                    arr[i + j + 1] += result
                }
            }
        }
        arr = arr.reversed()
        var result = ""
        for (i, e) in arr.enumerated() {
            let n = e + flagArr[i]
            if n > 9 {
                let s = "\(n)"
                flagArr[i + 1] = Int(s[s.startIndex..<s.index(s.endIndex, offsetBy: -1)])!
                result.append("\(n)".last!)
            } else {
                result.append("\(n)")
            }
        }
        result = String(result.reversed())
        if result.first == "0" { result.removeFirst() }
        return result
    }
}

let s = Solution()
let r = s.multiply("17849419788197", "877968504004372811")
print(r)
