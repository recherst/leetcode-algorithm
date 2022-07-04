/**
 Given the head of a singly linked list, return true if it is a palindrome.

  

 Example 1:
 Input: head = [1,2,2,1]
 Output: true
 
 Example 2:
 Input: head = [1,2]
 Output: false
  

 Constraints:
 - The number of nodes in the list is in the range [1, 105].
 - 0 <= Node.val <= 9
  

 Follow up: Could you do it in O(n) time and O(1) space?
 */
/**
 * Definition for singly-linked list.
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head != nil else { return false }
        var currNode = head
        var nodeValArr = [Int]()
        while currNode?.val != nil {
            nodeValArr.append(currNode!.val)
            currNode = currNode?.next
        }
        let midIndex = nodeValArr.count / 2
        let preArr = Array(nodeValArr.prefix(midIndex))
        let sufArr = Array(nodeValArr.suffix(midIndex))
        return preArr == sufArr.reversed()
    }
}
