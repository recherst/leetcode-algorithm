/**
 Given the root of a binary tree, return its maximum depth.

 A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

  

 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: 3
 
 Example 2:
 Input: root = [1,null,2]
 Output: 2
  

 Constraints:
 - The number of nodes in the tree is in the range [0, 104].
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
    // Recursion version
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        
        let leftDepth = maxDepth(root!.left)
        let rightDepth = maxDepth(root!.right)
        
        if leftDepth > rightDepth {
            return leftDepth + 1
        } else {
            return rightDepth + 1
        }
    }
    
    // Iteration version
    func maxDepth2(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var queue = [TreeNode?]()
        var height = 0
        queue.append(root!)
        while !queue.isEmpty {
            height += 1
            var nodeCount = queue.count
            while nodeCount > 0 {
                let newNode = queue.remove(at: 0)
                if newNode?.left != nil {
                    queue.append(newNode?.left)
                }
                if newNode?.right != nil {
                    queue.append(newNode?.right)
                }
                nodeCount -= 1
            }
        }
        return height
    }
}
