/**
 We define a harmonious array as an array where the difference between its maximum value and its minimum value is exactly 1.

 Given an integer array nums, return the length of its longest harmonious subsequence among all its possible subsequences.

 A subsequence of array is a sequence that can be derived from the array by deleting some or no elements without changing the order of the remaining elements.

  

 Example 1:
 Input: nums = [1,3,2,2,5,2,3,7]
 Output: 5
 Explanation: The longest harmonious subsequence is [3,2,2,2,3].
 
 Example 2:
 Input: nums = [1,2,3,4]
 Output: 2
 
 Example 3:
 Input: nums = [1,1,1,1]
 Output: 0
  

 Constraints:
 - 1 <= nums.length <= 2 * 10^4
 - -10^9 <= nums[i] <= 10^9
 */
class Solution {
    func findLHS(_ nums: [Int]) -> Int {
        if nums.count == 1 { return 0 }
        let sortedNums = nums.sorted(by: <)
        print(sortedNums)
        var result = [Int]()
        var maxCount = 0
        var flag = false
        var i = 0
        while i < sortedNums.count {
            if i < sortedNums.count - 1 {
                if sortedNums[i + 1] - sortedNums[i] == 0 {
                    result.append(sortedNums[i])
                } else if sortedNums[i + 1] - sortedNums[i] == 1 {
                    result.append(sortedNums[i])
                    flag = true
                    if result.count > maxCount {
                        maxCount = result.count
                    }
                    if !result.isEmpty {
                        var newResult = [Int]()
                        for e in result {
                            if e >= sortedNums[i] {
                                newResult.append(e)
                            }
                        }
                        result = newResult
                    }
                } else {
                    if i > 0 {
                        if sortedNums[i] - sortedNums[i - 1] <= 1 {
                            result.append(sortedNums[i])
                        }
                    }
                    if flag == true {
                        if result.count > maxCount {
                            maxCount = result.count
                        }
                    }
                    result.removeAll()
                    result.append(sortedNums[i])
                    flag = false
                }
            } else {
                if sortedNums[i] - sortedNums[i - 1] == 0 {
                    result.append(sortedNums[i])
                } else if sortedNums[i] - sortedNums[i - 1] == 1 {
                    result.append(sortedNums[i])
                    flag = true
                    if result.count > maxCount {
                        maxCount = result.count
                    }
                    if !result.isEmpty {
                        var newResult = [Int]()
                        for e in result {
                            if e >= sortedNums[i - 1] {
                                newResult.append(e)
                            }
                        }
                        result = newResult
                    }
                    
                } else {
                    if sortedNums[i] - sortedNums[i - 1] <= 1 {
                        result.append(sortedNums[i])
                    }
                    if flag == true {
                        if result.count > maxCount {
                            maxCount = result.count
                        }
                    }
                    result.removeAll()
                    result.append(sortedNums[i])
                    flag = false
                }
            }
            i += 1
        }
        if result.last != result.first && result.count > maxCount {
            maxCount = result.count
        }
        return maxCount
    }
}

let s = Solution()
let r = s.findLHS([1,1,1,1])
print(r)
