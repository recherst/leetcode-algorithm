/**
 Implement a first in first out (FIFO) queue using only two stacks. The implemented queue should support all the functions of a normal queue (`push`, `peek`, `pop`, and `empty`).

 Implement the MyQueue class:

 - `void push(int x)` Pushes element x to the back of the queue.
 - `int pop()` Removes the element from the front of the queue and returns it.
 - `int peek()` Returns the element at the front of the queue.
 - `boolean empty()` Returns true if the queue is empty, false otherwise.
 
 Notes:
 - You must use **only** standard operations of a stack, which means only push to top, peek/pop from top, size, and is empty operations are valid.
 - Depending on your language, the stack may not be supported natively. You may simulate a stack using a list or deque (double-ended queue) as long as you use only a stack's standard operations.
  

 Example 1:
 Input
 ["MyQueue", "push", "push", "peek", "pop", "empty"]
 [[], [1], [2], [], [], []]
 Output
 [null, null, null, 1, 1, false]

 Explanation
 MyQueue myQueue = new MyQueue();
 myQueue.push(1); // queue is: [1]
 myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
 myQueue.peek(); // return 1
 myQueue.pop(); // return 1, queue is [2]
 myQueue.empty(); // return false
  

 Constraints:
 - `1 <= x <= 9`
 - At most `100` calls will be made to `push`, `pop`, `peek`, and `empty`.
 - All the calls to `pop` and `peek` are valid.
  

 Follow-up: Can you implement the queue such that each operation is amortized `O(1)` time complexity? In other words, performing `n` operations will take overall `O(n)` time even if one of those operations may take longer.
 */
class LinkNode<T> {
    var value: T
    var next: LinkNode?
    init(value: T) {
        self.value = value
    }
}
class Stack<T> {
    var head: LinkNode<T>?
    
    func push(value: T) {
        let node = LinkNode<T>(value: value)
        
        if let headNode = head {
            node.next = headNode
            head = node
        } else {
            head = node
        }
    }
    
    func pop() -> LinkNode<T>? {
        guard let headNode = head else { return nil }
        let node = headNode
        head = headNode.next
        node.next = nil
        return node
    }
    
    func peek() -> LinkNode<T>? {
        return head
    }
}
class MyQueue {
    
    var stack1: Stack<Int>
    var stack2: Stack<Int>

    init() {
        self.stack1 = Stack<Int>()
        self.stack2 = Stack<Int>()
    }
    
    func push(_ x: Int) {
        while stack2.peek() != nil {
            let topNode = stack2.pop()!
            stack1.push(value: topNode.value)
        }
        stack1.push(value: x)
    }
    
    func pop() -> Int {
        if stack2.head != nil {
            return stack2.pop()!.value
        } else {
            while stack1.peek() != nil {
                let topNode = stack1.pop()!
                stack2.push(value: topNode.value)
            }
            return stack2.pop()!.value
        }
    }
    
    func peek() -> Int {
        while stack1.peek() != nil {
            let topNode = stack1.pop()!
            stack2.push(value: topNode.value)
        }
        return stack2.peek()!.value
    }
    
    func empty() -> Bool {
        return stack1.peek() == nil && stack2.peek() == nil
    }
}

let q = MyQueue()
q.push(1)
q.push(2)
let r = q.peek()
q.push(3)
let r2 = q.peek()
let r3 = q.empty()
