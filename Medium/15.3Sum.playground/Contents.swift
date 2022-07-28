/**
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

 Notice that the solution set must not contain duplicate triplets.

  

 Example 1:
 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 Explanation:
 nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
 nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
 nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
 The distinct triplets are [-1,0,1] and [-1,-1,2].
 Notice that the order of the output and the order of the triplets does not matter.
 
 Example 2:
 Input: nums = [0,1,1]
 Output: []
 Explanation: The only possible triplet does not sum up to 0.
 
 Example 3:
 Input: nums = [0,0,0]
 Output: [[0,0,0]]
 Explanation: The only possible triplet sums up to 0.
  

 Constraints:
 - 3 <= nums.length <= 3000
 - -10^5 <= nums[i] <= 10^5
 */
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        let sortedNums = nums.sorted(by: <)
        for i in 0..<sortedNums.count {
            if sortedNums[i] > 0 {
                break
            }
            // Remove duplicate element.
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            var left = i + 1
            var right = sortedNums.count - 1
            while left < right {
                if sortedNums[i] + sortedNums[left] + sortedNums[right] == 0 {
                    res.append([sortedNums[i], sortedNums[left], sortedNums[right]])
                    
                    // Remove duplicate element.
                    while left < right && sortedNums[right] == sortedNums[right - 1] {
                        right -= 1
                    }
                    while left < right && sortedNums[left] == sortedNums[left + 1] {
                        left += 1
                    }
                    
                    left += 1
                    right -= 1
                } else if sortedNums[i] + sortedNums[left] + sortedNums[right] > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }
        return res
    }
}

let s = Solution()
let r = s.threeSum([-1,0,1,2,-1,-4])
print(r)
