/**
 Implement a last-in-first-out (LIFO) stack using only two queues. The implemented stack should support all the functions of a normal stack (push, top, pop, and empty).

 Implement the MyStack class:
 - void push(int x) Pushes element x to the top of the stack.
 - int pop() Removes the element on the top of the stack and returns it.
 - int top() Returns the element on the top of the stack.
 - boolean empty() Returns true if the stack is empty, false otherwise.
 
 Notes:
 - You must use only standard operations of a queue, which means that only push to back, peek/pop from front, size and is empty operations are valid.
 - Depending on your language, the queue may not be supported natively. You may simulate a queue using a list or deque (double-ended queue) as long as you use only a queue's standard operations.
  

 Example 1:
 Input
 ["MyStack", "push", "push", "top", "pop", "empty"]
 [[], [1], [2], [], [], []]
 Output
 [null, null, null, 2, 2, false]

 Explanation
 MyStack myStack = new MyStack();
 myStack.push(1);
 myStack.push(2);
 myStack.top(); // return 2
 myStack.pop(); // return 2
 myStack.empty(); // return False
  

 Constraints:
 - 1 <= x <= 9
 - At most 100 calls will be made to push, pop, top, and empty.
 - All the calls to pop and top are valid.
  

 Follow-up: Can you implement the stack using only one queue?
 */
/**
 * Definition for singly-linked list.
 */
public class ListNode<T> {
    public var val: T
    public var next: ListNode?
    public init(_ val: T) {
        self.val = val
        self.next = nil
    }
}
class Queue<T> {
    var tail: ListNode<T>?
    var head: ListNode<T>?
    var count: Int = 0
    
    func dequeue() -> ListNode<T>? {
        guard let node = head else { return nil }
        head = head?.next
        count -= 1
        return node
    }
    
    func enqueue(_ x: T) {
        let newNode = ListNode(x)
        if let tailNode = tail {
            tailNode.next = newNode
            tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
        count += 1
    }
    
}
class MyStack {
    private var queue1: Queue<Int>
    private var queue2: Queue<Int>
    private var topValue: Int?

    init() {
        self.queue1 = Queue<Int>()
        self.queue2 = Queue<Int>()
    }
    
    func push(_ x: Int) {
        queue1.enqueue(x)
        topValue = x
    }
    
    func pop() -> Int {
        while queue1.count > 1 {
            topValue = queue1.dequeue()!.val
            queue2.enqueue(topValue!)
        }
        let val = queue1.dequeue()!.val
        queue1 = queue2
        queue2 = Queue<Int>()
        return val
    }
    
    func top() -> Int {
        return queue1.tail!.val
    }
    
    func empty() -> Bool {
        return queue1.count == 0
    }
}

let stack = MyStack()
stack.push(1)
stack.push(2)
stack.push(3)
let val1 = stack.pop()
print("val1 --", val1)
let val2 = stack.pop()
print("val2 --", val2)
let val3 = stack.pop()
print("val3 --", val3)
let empty = stack.empty()


/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
