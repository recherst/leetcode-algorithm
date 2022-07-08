/**
 Given an integer n, return true if it is a power of four. Otherwise, return false.

 An integer n is a power of four, if there exists an integer x such that n == 4x.

  

 Example 1:
 Input: n = 16
 Output: true
 
 Example 2:
 Input: n = 5
 Output: false
 
 Example 3:
 Input: n = 1
 Output: true
  

 Constraints:
 - -231 <= n <= 231 - 1
  

 Follow up: Could you solve it without loops/recursion?
 */
class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        if n <= 0 { return false }
        let max = pow(2, power: 31) - 1
        var x = 0
        var powerOfFourArr = [Int]()
        while pow(4, power: x) <= max {
            powerOfFourArr.append(pow(4, power: x))
            x += 1
        }
        // 1073741824
        print(powerOfFourArr)
        return powerOfFourArr.contains(n)
    }
    
    private func pow(_ base: Int, power: Int) -> Int {
        if base == 0 { return 0 }
        var result = 1
        for _ in 0..<power {
            result *= base
        }
        return result
    }
}

let s = Solution()
let r = s.isPowerOfFour(8)
print(r)
