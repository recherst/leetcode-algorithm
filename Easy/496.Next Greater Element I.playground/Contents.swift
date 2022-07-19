/**
 The next greater element of some element x in an array is the first greater element that is to the right of x in the same array.

 You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2.

 For each 0 <= i < nums1.length, find the index j such that nums1[i] == nums2[j] and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is -1.

 Return an array ans of length nums1.length such that ans[i] is the next greater element as described above.

  

 Example 1:
 Input: nums1 = [4,1,2], nums2 = [1,3,4,2]
 Output: [-1,3,-1]
 Explanation: The next greater element for each value of nums1 is as follows:
 - 4 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
 - 1 is underlined in nums2 = [1,3,4,2]. The next greater element is 3.
 - 2 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
 
 Example 2:
 Input: nums1 = [2,4], nums2 = [1,2,3,4]
 Output: [3,-1]
 Explanation: The next greater element for each value of nums1 is as follows:
 - 2 is underlined in nums2 = [1,2,3,4]. The next greater element is 3.
 - 4 is underlined in nums2 = [1,2,3,4]. There is no next greater element, so the answer is -1.
  

 Constraints:
 - 1 <= nums1.length <= nums2.length <= 1000
 - 0 <= nums1[i], nums2[i] <= 104
 - All integers in nums1 and nums2 are unique.
 - All the integers of nums1 also appear in nums2.
 */
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var keyToIndexMap = [Int: Int]()
        var indexToKeyMap = [Int: Int]()
        for (i, e) in nums2.enumerated() {
            keyToIndexMap[e] = i
            indexToKeyMap[i] = e
        }
        
        var res = [Int]()
        for e in nums1 {
            let index = keyToIndexMap[e]!
            if index == nums2.count - 1 {
                res.append(-1)
            } else {
                var found = false
                for i in (index + 1)..<nums2.count {
                    let nextGreaterElement = indexToKeyMap[i]!
                    if nextGreaterElement > e {
                        res.append(nextGreaterElement)
                        found = true
                        break
                    }
                }
                if !found {
                    res.append(-1)
                }
            }
        }
        return res
    }
    
    
    func nextGreaterElement2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var n = nums2
        var stack = [n.remove(at: 0)]
        var map = [Int: Int]()
        
        for e in n {
            while !stack.isEmpty && stack.last! < e {
                map[stack.popLast()!] = e
            }
            stack.append(e)
        }
        
        var res = [Int]()
        for e in nums1 {
            if let nextGreaterElement = map[e] {
                res.append(nextGreaterElement)
            } else {
                res.append(-1)
            }
        }
        return res
    }
}

let s = Solution()
let r = s.nextGreaterElement([1,3,5,2,4], [6,5,4,3,2,1,7])
print(r)
