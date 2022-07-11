/**
 Given an integer array nums, return the third distinct maximum number in this array. If the third maximum does not exist, return the maximum number.

  

 Example 1:
 Input: nums = [3,2,1]
 Output: 1
 Explanation:
 The first distinct maximum is 3.
 The second distinct maximum is 2.
 The third distinct maximum is 1.
 
 Example 2:
 Input: nums = [1,2]
 Output: 2
 Explanation:
 The first distinct maximum is 2.
 The second distinct maximum is 1.
 The third distinct maximum does not exist, so the maximum (2) is returned instead.
 
 Example 3:
 Input: nums = [2,2,3,1]
 Output: 1
 Explanation:
 The first distinct maximum is 3.
 The second distinct maximum is 2 (both 2's are counted together since they have the same value).
 The third distinct maximum is 1.
  

 Constraints:
 - 1 <= nums.length <= 104
 - -231 <= nums[i] <= 231 - 1
  

 Follow up: Can you find an O(n) solution?
 */
class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        if nums.count == 2 { return max(nums[0], nums[1]) }
        var a = Int.min
        var b = Int.min
        var c = Int.min
        let arr = Array(Set(nums))
        for e in arr {
            if e > a {
                c = b
                b = a
                a = e
            } else if a > e && e > b {
                c = b
                b = e
            } else if b > e && e > c {
                c = e
            }
        }
        return c == Int.min ? a : c
    }
}

let s = Solution()
let r = s.thirdMax([3, 2, 1])
print(r)

