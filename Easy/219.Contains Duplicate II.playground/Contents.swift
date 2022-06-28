/**
 Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.

  

 Example 1:
 Input: nums = [1,2,3,1], k = 3
 Output: true
 
 Example 2:
 Input: nums = [1,0,1,1], k = 1
 Output: true
 
 Example 3:
 Input: nums = [1,2,3,1,2,3], k = 2
 Output: false
  

 Constraints:
 - 1 <= nums.length <= 105
 - -109 <= nums[i] <= 109
 - 0 <= k <= 105
 */
class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var map = [nums[0]:[0]]
        for (i, e) in nums.enumerated() {
            if i > 0 {
                if var arr = map[e] {
                    arr.append(i)
                    map[e] = arr
                } else {
                    map[e] = [i]
                }
            }
        }
        let duplicateElementArr = map.filter { $1.count > 1 }.map { $1 }
        print(duplicateElementArr)
        for arr in duplicateElementArr {
            for (i, element) in arr.enumerated() {
                if i < arr.count - 1 {
                    if arr[i + 1] - element <= k {
                        return true
                    }
                }
                
            }
        }
        return false
    }
}

let s = Solution()
let r = s.containsNearbyDuplicate([1,2,3,1,2,3], 2)
print(r)
