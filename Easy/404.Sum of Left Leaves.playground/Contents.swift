/**
 Given the root of a binary tree, return the sum of all left leaves.

 A leaf is a node with no children. A left leaf is a leaf that is the left child of another node.

  

 Example 1:
 Input: root = [3,9,20,null,null,15,7]
 Output: 24
 Explanation: There are two left leaves in the binary tree, with values 9 and 15 respectively.
 
 Example 2:
 Input: root = [1]
 Output: 0
  

 Constraints:
 - The number of nodes in the tree is in the range [1, 1000].
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
class Solution {
    let totalLeft: [Int] = []
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        let left = sumOfLeftLeaves(root?.left)
        let right = sumOfLeftLeaves(root?.right)
        if root?.left != nil && root?.left?.left == nil && root?.left?.right == nil {
            return left + right + root!.left!.val
        }
        return left + right
    }
}

let s = Solution()
// [1,2,3,4,5]
let tree1 = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3))
let tree = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
let tree2 = TreeNode(0, TreeNode(2, TreeNode(1, TreeNode(5), TreeNode(1)), nil), TreeNode(4, TreeNode(3, nil, TreeNode(6)), TreeNode(-1, nil, TreeNode(8))))
let r = s.sumOfLeftLeaves(tree2)
print(r)
