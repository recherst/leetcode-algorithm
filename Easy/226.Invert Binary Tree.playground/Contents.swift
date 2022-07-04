/**
 Given the root of a binary tree, invert the tree, and return its root.

  

 Example 1:
 Input: root = [4,2,7,1,3,6,9]
 Output: [4,7,2,9,6,3,1]
 
 Example 2:
 Input: root = [2,1,3]
 Output: [2,3,1]
 
 Example 3:
 Input: root = []
 Output: []
  

 Constraints:
 - The number of nodes in the tree is in the range [0, 100].
 - -100 <= Node.val <= 100
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let left = root.left
        root.left = invertTree(root.right)
        root.right = invertTree(left)
        return root
    }
}
