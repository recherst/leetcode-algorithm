/**
 Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.

  

 Example 1:
 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2,2]
 
 Example 2:
 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [4,9]
 Explanation: [9,4] is also accepted.
  

 Constraints:
 - 1 <= nums1.length, nums2.length <= 1000
 - 0 <= nums1[i], nums2[i] <= 1000
  

 Follow up:
 - What if the given array is already sorted? How would you optimize your algorithm?
 - What if nums1's size is small compared to nums2's size? Which algorithm is better?
 - What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
 */
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map1 = [nums1[0]: 1]
        var map2 = [nums2[0]: 1]
        for i in 1..<nums1.count {
            if var count = map1[nums1[i]] {
                count += 1
                map1[nums1[i]] = count
            } else {
                map1[nums1[i]] = 1
            }
        }
        for i in 1..<nums2.count {
            if var count = map2[nums2[i]] {
                count += 1
                map2[nums2[i]] = count
            } else {
                map2[nums2[i]] = 1
            }
        }
        
        var result = [Int]()
        for (k1, v1) in map1 {
            for (k2, v2) in map2 {
                if k1 == k2 {
                    if v1 >= v2 {
                        for _ in 0..<v2 {
                            result.append(k1)
                        }
                    } else {
                        for _ in 0..<v1 {
                            result.append(k1)
                        }
                    }
                }
            }
        }
        return result
    }
}

let s = Solution()
let r = s.intersect([1,2,2,1], [2,2])
print(r)

