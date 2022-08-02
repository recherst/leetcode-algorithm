/**
 Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.

 Return the sum of the three integers.

 You may assume that each input would have exactly one solution.

  

 Example 1:
 Input: nums = [-1,2,1,-4], target = 1
 Output: 2
 Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 
 Example 2:
 Input: nums = [0,0,0], target = 1
 Output: 0
  

 Constraints:
 - 3 <= nums.length <= 1000
 - -1000 <= nums[i] <= 1000
 - -10^4 <= target <= 10^4
 */
class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sortedNums = nums.sorted(by: <)
        var closestNum = sortedNums[0] + sortedNums[1] + sortedNums[2]
        for i in 0..<sortedNums.count - 2 {
            var left = i + 1
            var right = sortedNums.count - 1
            while left < right {
                let sumThree = sortedNums[i] + sortedNums[left] + sortedNums[right]
                if abs(sumThree - target) < abs(closestNum - target) {
                    closestNum = sumThree
                }
                if sumThree > target {
                    right -= 1
                } else if sumThree < target {
                    left += 1
                } else {
                    return target
                }
            }
        }
        return closestNum
    }
}

let s = Solution()
let r = s.threeSumClosest([0, 1, 2], 3)
print(r)
