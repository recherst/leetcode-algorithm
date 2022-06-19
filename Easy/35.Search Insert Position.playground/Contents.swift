/**
 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You must write an algorithm with O(log n) runtime complexity.

  
 Example 1:
 Input: nums = [1,3,5,6], target = 5
 Output: 2
 
 Example 2:
 Input: nums = [1,3,5,6], target = 2
 Output: 1
 
 Example 3:
 Input: nums = [1,3,5,6], target = 7
 Output: 4
  

 Constraints:
 - 1 <= nums.length <= 104
 - -104 <= nums[i] <= 104
 - nums contains distinct values sorted in ascending order.
 - -104 <= target <= 104
 */

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(nums, 0, nums.count - 1, target)
    }
    
    func binarySearch(_ nums: [Int], _ fromIndex: Int, _ toIndex: Int, _ target: Int) -> Int {
        var low = fromIndex
        var high = toIndex
        let mid = (fromIndex + toIndex) / 2
        let element = nums[mid]
        if element == target {
            return mid
        } else if element > target {
            high = mid - 1
        } else {
            low = mid + 1
        }
        if low > high {
            return low
        }
        return binarySearch(nums, low, high, target)
    }
}

let s = Solution()
let r = s.searchInsert([1, 3, 5, 6], 7)
print(r)
