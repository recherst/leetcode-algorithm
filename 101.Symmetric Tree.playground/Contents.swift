/**
 Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

  
 Example 1:
 Input: root = [1,2,2,3,4,4,3]
 Output: true
 
 Example 2:
 Input: root = [1,2,2,null,3,null,3]
 Output: false
  

 Constraints:
 - The number of nodes in the tree is in the range [1, 1000].
 - -100 <= Node.val <= 100
  

 Follow up: Could you solve it both recursively and iteratively?
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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        return isSameTree(root!.left, root!.right)
    }
    
    private func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if q == nil || q == nil { return false }
        if p?.val != q?.val { return false }
        return isSameTree(p?.left, q?.right) && isSameTree(p?.right, q?.left)
    }
}

let s = Solution()
let t = TreeNode(1, TreeNode(2, TreeNode(2, TreeNode(2), nil), TreeNode(2)), nil)
let r = s.isSymmetric(t)
print(r)
