/**
 Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.

 A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.

  

 Example 1:
 Input: nums = [-10,-3,0,5,9]
 Output: [0,-3,9,-10,null,5]
 Explanation: [0,-10,5,null,-3,null,9] is also accepted:

 Example 2:
 Input: nums = [1,3]
 Output: [3,1]
 Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.
  

 Constraints:
 - 1 <= nums.length <= 104
 - -104 <= nums[i] <= 104
 - nums is sorted in a strictly increasing order.
 */
/**
 * Definition for a binary tree node.
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else { return nil }
        let midIndex = (0 + nums.count) / 2
        let middleElement = nums[midIndex]
        let root = TreeNode(middleElement)
        let leftHalf = Array(nums.prefix(midIndex))
        let righthalf = Array(nums.suffix(from: midIndex + 1))
        root.left = sortedArrayToBST(leftHalf)
        root.right = sortedArrayToBST(righthalf)
        return root
    }
}

let s = Solution()
let n = s.sortedArrayToBST([1, 2, 3, 4, 5, 6])
print(n)
