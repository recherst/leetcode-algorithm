/**
 Given a binary tree, find its minimum depth.

 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

 Note: A leaf is a node with no children.

  

 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: 2
 
 Example 2:
 Input: root = [2,null,3,null,4,null,5,null,6]
 Output: 5
  

 Constraints:
 - The number of nodes in the tree is in the range [0, 105].
 - -1000 <= Node.val <= 1000
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

public class DepthOfNode {
    public var node: TreeNode
    public var height: Int
    init(node: TreeNode, height: Int) {
        self.node = node
        self.height = height
    }
}

class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let leftNode = root.left
        let rightNode = root.right
        if leftNode == nil && rightNode == nil { return 1 }
        if leftNode == nil {
            return 1 + minDepth(rightNode)
        }
        if rightNode == nil {
            return 1 + minDepth(leftNode)
        }
        return 1 + min(minDepth(leftNode), minDepth(rightNode))
    }
    
    // Iterate
    func minDepth2(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue = [DepthOfNode]()
        queue.append(DepthOfNode(node: root, height: 1))
        var totalHeight = 1
        while !queue.isEmpty {
            let firstItem = queue.remove(at: 0)
            let node = firstItem.node
            let height = firstItem.height
            let leftNode = node.left
            let rightNode = node.right
            if leftNode == nil && rightNode == nil {
                return height
            }
            if leftNode != nil {
                totalHeight = height + 1
                let newItem = DepthOfNode(node: leftNode!, height: height + 1)
                queue.append(newItem)
            }
            if rightNode != nil {
                totalHeight = height + 1
                let newItem = DepthOfNode(node: rightNode!, height: height + 1)
                queue.append(newItem)
            }
        }
        return totalHeight
    }
}
