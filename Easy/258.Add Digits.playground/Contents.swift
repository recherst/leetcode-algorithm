/**
 Given an integer num, repeatedly add all its digits until the result has only one digit, and return it.

  

 Example 1:
 Input: num = 38
 Output: 2
 Explanation: The process is
 38 --> 3 + 8 --> 11
 11 --> 1 + 1 --> 2
 Since 2 has only one digit, return it.
 
 Example 2:
 Input: num = 0
 Output: 0
  

 Constraints:
 - 0 <= num <= 231 - 1
  

 Follow up: Could you do it without any loop/recursion in O(1) runtime?
 */
class Solution {
    func addDigits(_ num: Int) -> Int {
        if num < 9 { return num }
        var result = num
        while result > 9 {
            result = sum(of: "\(result)")
        }
        return result
    }
    
    private func sum(of numStr: String) -> Int {
        var res: Int = 0
        for c in numStr {
            res += Int(String(c))!
        }
        return res
    }
    
    func addDigits2(_ num: Int) -> Int {
        return num == 0 ? 0 : (num - 1) % 9 + 1
    }
}
