/**
 Given the roots of two binary trees p and q, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

  

 Example 1:
 Input: p = [1,2,3], q = [1,2,3]
 Output: true
 
 Example 2:
 Input: p = [1,2], q = [1,null,2]
 Output: false
 
 Example 3:
 Input: p = [1,2,1], q = [1,1,2]
 Output: false
  

 Constraints:
 - The number of nodes in both trees is in the range [0, 100].
 - -104 <= Node.val <= 104
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if p == nil || q == nil { return false }
        if p?.val != q?.val { return false }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}

let p = TreeNode(5, TreeNode(4, TreeNode(1, nil, TreeNode(1, nil, TreeNode(4, TreeNode(2), nil))), TreeNode(2)), nil)
let q = TreeNode(5, TreeNode(1, TreeNode(4, TreeNode(4, nil, TreeNode(1)), nil), nil), TreeNode(2, nil, TreeNode(2)))
let s = Solution()
let r = s.isSameTree(p, q)
print(r)
