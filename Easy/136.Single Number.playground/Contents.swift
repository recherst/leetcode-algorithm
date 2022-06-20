/**
 Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.

 You must implement a solution with a linear runtime complexity and use only constant extra space.

  

 Example 1:
 Input: nums = [2,2,1]
 Output: 1
 
 Example 2:
 Input: nums = [4,1,2,1,2]
 Output: 4
 
 Example 3:
 Input: nums = [1]
 Output: 1
  

 Constraints:
 - 1 <= nums.length <= 3 * 104
 - -3 * 104 <= nums[i] <= 3 * 104
 - Each element in the array appears twice except for one element which appears only once.
 */
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        let newArr = nums.sorted(by: <)
        if newArr.count == 1 { return newArr[0] }
        var i = 0
        while i < newArr.count {
            if i == newArr.count - 1 {
                return newArr[i]
            }
            if newArr[i] != newArr[i + 1] {
                return newArr[i]
            }
            i += 2
        }
        return -1
    }
}

let s = Solution()
// [1,3,1,-1,3]
let r = s.singleNumber([4,1,2,1,2])
print(r)
