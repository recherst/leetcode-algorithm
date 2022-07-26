/**
 You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

 Find two lines that together with the x-axis form a container, such that the container contains the most water.

 Return the maximum amount of water a container can store.

 Notice that you may not slant the container.

  

 Example 1:
 Input: height = [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
 
 Example 2:
 Input: height = [1,1]
 Output: 1
  

 Constraints:
 - n == height.length
 - 2 <= n <= 10^5
 - 0 <= height[i] <= 10^4
 */
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxArea = (right - left) * min(height[left], height[right])
        while left < right {
            left = 0
            let currentArea = (right - left) * min(height[left], height[right])
            if currentArea > maxArea {
                maxArea = currentArea
            }
            while left < right {
                if height[left] >= height[right] {
                    let currentArea = (right - left) * min(height[left], height[right])
                    if currentArea > maxArea {
                        maxArea = currentArea
                    }
                    break
                }
                let currentArea = (right - left) * min(height[left], height[right])
                if currentArea > maxArea {
                    maxArea = currentArea
                }
                left += 1
            }
            right -= 1
        }
        return maxArea
    }
}

let s = Solution()
let r = s.maxArea([10,9])
print(r)
