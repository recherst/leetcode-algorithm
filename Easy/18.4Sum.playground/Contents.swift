/**
 Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

 0 <= a, b, c, d < n
 a, b, c, and d are distinct.
 nums[a] + nums[b] + nums[c] + nums[d] == target
 You may return the answer in any order.

  

 Example 1:
 Input: nums = [1,0,-1,0,-2,2], target = 0
 Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 
 Example 2:
 Input: nums = [2,2,2,2,2], target = 8
 Output: [[2,2,2,2]]
  

 Constraints:
 - 1 <= nums.length <= 200
 - -109 <= nums[i] <= 109
 - -109 <= target <= 109
 */
class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var sortedNums = nums.sorted(by: <)
        var result = [[Int]]()
        for i in 0..<sortedNums.count {
            if sortedNums[i] > target && sortedNums[i] >= 0 && target >= 0 {
                break
            }
            
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                continue
            }
            
            for j in (i + 1)..<sortedNums.count {
                if sortedNums[i] + sortedNums[j] > target && sortedNums[i] + sortedNums[i] >= 0 && target >= 0 {
                    break
                }
                
                if j > i + 1 && sortedNums[j] == sortedNums[j - 1] {
                    continue
                }
                
                var left = j + 1
                var right = sortedNums.count - 1
                while right > left {
                    if sortedNums[i] + sortedNums[j] + sortedNums[left] + sortedNums[right] > target {
                        right -= 1
                    } else if sortedNums[i] + sortedNums[j] + sortedNums[left] + sortedNums[right] < target {
                        left += 1
                    } else {
                        result.append([sortedNums[i], sortedNums[j], sortedNums[left], sortedNums[right]])
                        
                        while right > left && sortedNums[right] == sortedNums[right - 1] {
                            right -= 1
                        }
                        while right > left && sortedNums[left] == sortedNums[left + 1] {
                            left += 1
                        }
                        right -= 1
                        left += 1
                    }
                }
            }
        }
        return result
    }
}
