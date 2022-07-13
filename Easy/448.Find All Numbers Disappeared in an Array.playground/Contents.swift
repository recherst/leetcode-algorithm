/**
 Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.

  

 Example 1:
 Input: nums = [4,3,2,7,8,2,3,1]
 Output: [5,6]
 
 Example 2:
 Input: nums = [1,1]
 Output: [2]
  

 Constraints:
 - n == nums.length
 - 1 <= n <= 105
 - 1 <= nums[i] <= n
  

 Follow up: Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
 */
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var arr = nums
        for n in arr {
            arr[abs(n) - 1] = -abs(arr[abs(n) - 1])
        }
        var res = [Int]()
        for i in 0..<arr.count {
            if arr[i] > 0 {
                res.append(i + 1)
            }
        }
        return res
    }
}
