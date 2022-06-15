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
        var inOrderTraversal = [Int]()
        var stack = [TreeNode]()
        var currentNode: TreeNode? = root
        while currentNode?.val != nil || !stack.isEmpty {
            if let curNode = currentNode {
                stack.append(curNode)
                currentNode = curNode.left
            } else {
                let node = stack.popLast()!
                inOrderTraversal.append(node.val)
                currentNode = node.right
            }
        }
        return inOrderTraversal
    }
}
