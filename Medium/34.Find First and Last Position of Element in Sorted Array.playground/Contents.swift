/**
 Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

 If target is not found in the array, return [-1, -1].

 You must write an algorithm with O(log n) runtime complexity.

  

 Example 1:
 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 
 Example 2:
 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 
 Example 3:
 Input: nums = [], target = 0
 Output: [-1,-1]
  

 Constraints:
 - 0 <= nums.length <= 10^5
 - -10^9 <= nums[i] <= 10^9
 - nums is a non-decreasing array.
 - -10^9 <= target <= 10^9
 */
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.isEmpty { return [-1, -1] }
        if nums.count == 1 {
            if nums.first == target {
                return [0, 0]
            } else {
                return [-1, -1]
            }
        } else {
            var left = 0
            var right = nums.count - 1
            while left <= right {
                let middle = (left + right) / 2
                if nums[middle] == target {
                    var i = middle
                    var j = middle
                    while i >= 0 && nums[i] == target {
                        i -= 1
                    }
                    while j < nums.count && nums[j] == target {
                        j += 1
                    }
                    return [i + 1, j - 1]
                } else if nums[middle] > target {
                    right = middle - 1
                } else {
                    left = middle + 1
                }
            }
            return [-1, -1]
        }
    }
}

let s = Solution()
let r = s.searchRange([3, 3, 3], 3)
print(r)
