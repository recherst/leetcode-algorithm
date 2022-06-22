/**
 Given the root of a binary tree, return the inorder traversal of its nodes' values.

  

 Example 1:
 Input: root = [1,null,2,3]
 Output: [1,3,2]
 
 Example 2:
 Input: root = []
 Output: []
 
 Example 3:
 Input: root = [1]
 Output: [1]
  

 Constraints:
 - The number of nodes in the tree is in the range [0, 100].
 - -100 <= Node.val <= 100
  

 Follow up: Recursive solution is trivial, could you do it iteratively?
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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        return Array(inorderTraversal(root.left)) + [root.val] + Array(inorderTraversal(root.right))
    }
    
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var stack = [TreeNode?]()
        var r = [Int]()
        var currNode: TreeNode? = root
        while currNode !== nil || !stack.isEmpty {
            if currNode != nil {
                stack.append(currNode)
                currNode = currNode?.left
            } else {
                if let node = stack.popLast()! {
                    r.append(node.val)
                    currNode = node.right
                }
            }
        }
        return r
    }
}
