/**
 Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val, and return the new head.

  

 Example 1:
 Input: head = [1,2,6,3,4,5,6], val = 6
 Output: [1,2,3,4,5]
 
 Example 2:
 Input: head = [], val = 1
 Output: []
 
 Example 3:
 Input: head = [7,7,7,7], val = 7
 Output: []
  

 Constraints:
 - The number of nodes in the list is in the range [0, 104].
 - 1 <= Node.val <= 50
 - 0 <= val <= 50
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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let header = ListNode(-1)
        header.next = head
        var currNode: ListNode? = header
        while currNode?.next != nil {
            if currNode?.next?.val == val {
                currNode?.next = currNode?.next?.next
            } else {
                currNode = currNode?.next
            }
        }
        return header.next
    }
}

let s = Solution()
let n1 = ListNode(1)
let n2 = ListNode(2)
let n3 = ListNode(6)
let n4 = ListNode(3)
let n5 = ListNode(4)
let n6 = ListNode(5)
let n7 = ListNode(6)
n1.next = n2
n2.next = n3
n3.next = n4
n4.next = n5
n5.next = n6
n6.next = n7
let r = s.removeElements(n1, 6)
print(r)
