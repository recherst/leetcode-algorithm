/**
 Given an integer array nums of size n, return the minimum number of moves required to make all array elements equal.

 In one move, you can increment n - 1 elements of the array by 1.

  

 Example 1:
 Input: nums = [1,2,3]
 Output: 3
 Explanation: Only three moves are needed (remember each move increments two elements):
 [1,2,3]  =>  [2,3,3]  =>  [3,4,3]  =>  [4,4,4]
 
 Example 2:
 Input: nums = [1,1,1]
 Output: 0
  

 Constraints:
 - n == nums.length
 - 1 <= nums.length <= 105
 - -109 <= nums[i] <= 109
 - The answer is guaranteed to fit in a 32-bit integer.
 */
class Solution {
    func minMoves(_ nums: [Int]) -> Int {
        let newNums = nums.sorted()
        if newNums.first! == newNums.last! {
            return 0
        }
        let mini = newNums.first!
        var sum = 0
        for (i, e) in newNums.enumerated() {
            if i > 0 {
                sum += (e - mini)
            }
        }
        return sum
    }
}

let s = Solution()
let r = s.minMoves([2, 4, 5, 7])
print(r)
