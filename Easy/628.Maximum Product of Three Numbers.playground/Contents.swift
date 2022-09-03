/**
 Given an integer array nums, find three numbers whose product is maximum and return the maximum product.

  

 Example 1:
 Input: nums = [1,2,3]
 Output: 6
 
 Example 2:
 Input: nums = [1,2,3,4]
 Output: 24
 
 Example 3:
 Input: nums = [-1,-2,-3]
 Output: -6
  

 Constraints:
 - 3 <= nums.length <= 104
 - -1000 <= nums[i] <= 1000
 */
class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.min
        var min1 = Int.max
        var min2 = Int.max
        
        for e in nums {
            if e < min1 {
                min2 = min1
                min1 = e
            } else if e < min2 {
                min2 = e
            }
            
            if e > max1 {
                max3 = max2
                max2 = max1
                max1 = e
            } else if e > max2 {
                max3 = max2
                max2 = e
            } else if e > max3 {
                max3 = e
            }
        }
        return max(max1 * max2 * max3, max1 * min1 * min2)
    }
}

let s = Solution()
let r = s.maximumProduct(
    
    [174,-524,-624,903,982,-219,126,876,-875,-617,-495,-621,194,-333,804,-199,-916,-88,-706,562,-293,-876,-697,975,-6,197,544,-919,-487,432,-849,512,619,44,252,-388,-177,-256,-847,-206,114,116,-827,518,-511,-511,257,-630,56,706,675,-705,-211,170,-13,684,836,-708,336,728,511,-229,-403,310,206,539,784,666,506,-252,-34,709,233,-290,633,29,-550,-412,-778,-107,-123,724,-58,-97,71,776,104,207,-381,-132,88,312,-39,478,-817,-484,-929,651,434,-911])
print(r)
