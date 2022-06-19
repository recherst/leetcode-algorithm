/**
 Given a binary tree, determine if it is height-balanced.

 For this problem, a height-balanced binary tree is defined as:

 a binary tree in which the left and right subtrees of every node differ in height by no more than 1.

  
  
 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: true
 
 Example 2:
 Input: root = [1,2,2,3,3,null,null,4,4]
 Output: false
 
 Example 3:
 Input: root = []
 Output: true
  

 Constraints:
 - The number of nodes in the tree is in the range [0, 5000].
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
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        let leftHeight = height(of: root.left)
        let rightHeight = height(of: root.right)
        let delta = abs(leftHeight - rightHeight)
        if delta <= 1 && isBalanced(root.left) && isBalanced(root.right) {
            return true
        }
        return false
    }
    
    private func height(of node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        return 1 + max(height(of: node.left), height(of: node.right))
    }
}

let s = Solution()
let node = TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4), nil), nil), TreeNode(5))
let r = s.isBalanced(node)
print(r)
