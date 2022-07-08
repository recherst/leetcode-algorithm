/**
 Given an integer `n`, return an array `ans` of length `n + 1` such that for each `i` `(0 <= i <= n)`, `ans[i]` is the number of `1`'s in the binary representation of `i`.

  

 Example 1:
 Input: n = 2
 Output: [0,1,1]
 Explanation:
 0 --> 0
 1 --> 1
 2 --> 10
 
 Example 2:
 Input: n = 5
 Output: [0,1,1,2,1,2]
 Explanation:
 0 --> 0
 1 --> 1
 2 --> 10
 3 --> 11
 4 --> 100
 5 --> 101
  

 Constraints:
 - 0 <= n <= 105
  

 Follow up:
 It is very easy to come up with a solution with a runtime of O(n log n). Can you do it in linear time O(n) and possibly in a single pass?
 Can you do it without using any built-in function (i.e., like __builtin_popcount in C++)?
 */
class Solution {
    func countBits(_ n: Int) -> [Int] {
        var result = [Int]()
        for var i in 0...n {
            if i <= 1 {
                result.append(i)
            } else {
                var arr = [Int]()
                while i != 0 {
                    var x = 0
                    while pow(2, power: x) <= i {
                        x += 1
                    }
                    arr.append(x - 1)
                    i -= pow(2, power: x - 1)
                }
                result.append(arr.count)
            }
        }
        return result
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
let r = s.countBits(7)
print(r)
