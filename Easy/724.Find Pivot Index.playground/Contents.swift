/**
 Given an array of integers nums, calculate the pivot index of this array.

 The pivot index is the index where the sum of all the numbers strictly to the left of the index is equal to the sum of all the numbers strictly to the index's right.

 If the index is on the left edge of the array, then the left sum is 0 because there are no elements to the left. This also applies to the right edge of the array.

 Return the leftmost pivot index. If no such index exists, return -1.

  

 Example 1:
 Input: nums = [1,7,3,6,5,6]
 Output: 3
 Explanation:
 The pivot index is 3.
 Left sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11
 Right sum = nums[4] + nums[5] = 5 + 6 = 11
 
 Example 2:
 Input: nums = [1,2,3]
 Output: -1
 Explanation:
 There is no index that satisfies the conditions in the problem statement.
 
 Example 3:
 Input: nums = [2,1,-1]
 Output: 0
 Explanation:
 The pivot index is 0.
 Left sum = 0 (no elements to the left of index 0)
 Right sum = nums[1] + nums[2] = 1 + -1 = 0
  

 Constraints:
 - 1 <= nums.length <= 10^4
 - -1000 <= nums[i] <= 1000
 */
class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        if nums.count == 1 { return -1 }
        var middle = nums.count / 2
        var leftSum = nums[0..<middle].reduce(0, +)
        var rightSum = nums[(middle + 1)...(nums.count - 1)].reduce(0, +)
        var leftForward = false
        var rightForward = false
        while leftSum != rightSum {
            print("L --->", leftSum, "R --->", rightSum)
            if leftSum > rightSum {
                if middle > 0 && rightForward == false {
                    middle -= 1
                    leftForward = true
                } else {
                    return -1
                }
            } else {
                if middle < nums.count - 1 && leftForward == false {
                    middle += 1
                    rightForward = true
                } else {
                    return -1
                }
            }
            
            if middle > 0 && middle < nums.count - 1 {
                leftSum = nums[0..<middle].reduce(0, +)
                rightSum = nums[(middle + 1)...(nums.count - 1)].reduce(0, +)
            } else {
                if middle == 0 {
                    leftSum = 0
                    rightSum = nums[(middle + 1)...(nums.count - 1)].reduce(0, +)
                } else if middle == nums.count - 1 {
                    leftSum = nums[0..<middle].reduce(0, +)
                    rightSum = 0
                }
            }
        }
        return middle
    }
}

let s = Solution()
let r = s.pivotIndex([-1,-1,-1,-1,-1,0])
print(r)
