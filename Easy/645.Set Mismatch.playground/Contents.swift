/**
 You have a set of integers s, which originally contains all the numbers from 1 to n. Unfortunately, due to some error, one of the numbers in s got duplicated to another number in the set, which results in repetition of one number and loss of another number.

 You are given an integer array nums representing the data status of this set after the error.

 Find the number that occurs twice and the number that is missing and return them in the form of an array.

  

 Example 1:
 Input: nums = [1,2,2,4]
 Output: [2,3]
 
 Example 2:
 Input: nums = [1,1]
 Output: [1,2]
  

 Constraints:
 - 2 <= nums.length <= 10^4
 - 1 <= nums[i] <= 10^4
 */
class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        let sortedNums = nums.sorted(by: <)
        var set = Set((1...nums.count).map { $0 })
        var result = [0, 0]
        for (i, e) in sortedNums.enumerated() {
            if set.contains(e) {
                set.remove(e)
            }
            if i == 0 {
                if e == sortedNums[i + 1] {
                    result[0] = e
                    set.remove(e)
                }
            } else if i < sortedNums.count - 1 {
                if e == sortedNums[i + 1] || e == sortedNums[i - 1] {
                    result[0] = e
                    set.remove(e)
                }
            } else {
                if e == sortedNums[i - 1] {
                    result[0] = e
                    set.remove(e)
                }
            }
        }
        result[1] = set.first!
        return result
    }
}

let s = Solution()
let r = s.findErrorNums([1,5,3,2,2,7,6,4,8,9])
print(r)
