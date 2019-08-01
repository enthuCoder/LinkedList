import Foundation

// Linked List algorithms: [Playlist: Linked Lists] https://www.youtube.com/channel/UCMNkvKnD3mo3Jj9eTwJllWw

// ==================================================================
// MARK: Linked List Node
// ==================================================================

public class LinkedListNode<Type>: NSObject {
    
    public var value: Type
    public var next: LinkedListNode?
    
    public init(_ newValue: Type) {
        self.value = newValue
    }
}

//extension AnyType : Hashable {
//

/*extension LinkedListNode: Comparable where Type: Comparable {
    
}*/

// ==================================================================
// MARK: Implement Linked List as a class
// ==================================================================
public class LinkedList<Type> {
    
    public typealias node = LinkedListNode<Type>
    
    public init() { }
    
    // Node references
    public var head: node?
    public var tail: node?
}

// ------------------------------------------------------------------
// MARK: Helper Functions
// ------------------------------------------------------------------
extension LinkedList {
    
    public func isEmpty() -> Bool {
        var result = true
        if let _ = head { // Head being non-nil for non-empty Linked List
            result = false
        }
        return result
    }
    
    public var first: node? {
        return head
    }
    
    public var last: node? {
        return tail
    }
    
    public var count: Int {
        var nodeCount = 0
        var tempNode = self.first
        while tempNode != nil {
            nodeCount += 1
            tempNode = tempNode?.next
        }
        return nodeCount
    }
}

// ------------------------------------------------------------------
// MARK: Node At Index
// ------------------------------------------------------------------

extension LinkedList {
    
    public func nodeAtIndex(_ index: Int) -> node? {
        
        var result: node?
        
        if self.isEmpty() || index > self.count - 1 {
            print("Invalid Linked List Node index...")
            return result
        }

        if index < self.count {
            var currentNode = self.head
            var currNodeIndex = -1
            
            while currentNode != nil {
                result = currentNode
                currNodeIndex += 1
                if currNodeIndex == index {
                    break
                }
                currentNode = currentNode?.next
            }
        }
        return result
    }
    
    public func kthNodeFromEnd(_ index: Int) -> node? {
        let nodeIndexFromStart = self.count - index - 1
        return nodeAtIndex(nodeIndexFromStart)
    }
}


// ------------------------------------------------------------------
// MARK: Human Readable Format
// ------------------------------------------------------------------
extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        var text = "["
        var tempNode = self.first
        
        while tempNode != nil {
            if tempNode == self.first {
                text = text + "\(tempNode!.value)"
            } else {
                text = text + " --> " + "\(tempNode!.value)"
            }
            tempNode = tempNode?.next
        }
        text = text + "]"
        return text
    }
}

// ------------------------------------------------------------------
// MARK: Insert into Linked List
// ------------------------------------------------------------------

extension LinkedList {
    
    public func insertAtIndex(_ index: Int, value: Type) {
        let newNode = LinkedListNode.init(value)
        if self.isEmpty() {
            if index > self.count - 1 {
                print("Invalid Linked List Node index. Can not insert new node...")
                return
            } else {
                // List was empty, insert new element
                self.head = newNode
                self.tail = newNode
            }
        } else if index > self.count - 1 {
            print("Invalid Linked List Node index. Can not insert new node...")
            return
        } else {
            // List has at-least 1 element, insert new element
            let prevNode = nodeAtIndex(index)
            newNode.next = prevNode?.next
            prevNode?.next = newNode
        }
    }
    
    public func insertAtHead(_ value: Type) {
        let newNode = LinkedListNode.init(value)

        if self.head == nil && self.tail == nil {
            self.head = newNode
            self.tail = newNode
        } else {
            let tempHeadNode = self.head
            newNode.next = tempHeadNode
            self.head = newNode
        }
    }
    
    public func insertAtTail(_ value: Type) {

        let newNode = LinkedListNode(value)
        newNode.next = nil
        self.tail?.next = newNode
        self.tail = newNode
        if self.head == nil {
            self.head = self.tail
        }
    }
    
    // TODO: More condition checks needs to be added here
    public func deleteAtIndex(_ index: Int) {
        if self.isEmpty() {
            print("Can not delete node from empty linked list")
        } else if index > self.count - 1 || index < 0 {
            print("Invalid Linked List Node index. Can not delete node...")
        } else if index == 0 {
            if self.count == 1 {
                self.head = nil
                self.tail = nil
            } else {
                self.head = head?.next
            }
        } else if index == self.count - 1 {
            self.tail = nodeAtIndex(index - 1)
        } else {
            let tempNode = nodeAtIndex(index - 1)
            tempNode?.next = nodeAtIndex(index)
        }
    }
}


// ------------------------------------------------------------------
// MARK: Detect Loop
// Explanation of Looping alorithm: https://www.youtube.com/watch?v=apIw0Opq5nk
// ------------------------------------------------------------------
extension LinkedList {
    
    public func detectLoop() -> (Bool, node?) {
        
        var loopDetected = false
        var fastPointer = self.head
        var slowPointer = self.head
        
        var loopingNode: node?
        
        while slowPointer?.next != nil {
            fastPointer = fastPointer?.next?.next
            slowPointer = slowPointer?.next
            
            if slowPointer == fastPointer {
                loopingNode = slowPointer
                loopDetected = true
                break
            }
        }
        return (loopDetected, loopingNode)
    }
}

// ------------------------------------------------------------------
// MARK: Reverse a Singly Linked List
// Recursively: https://www.youtube.com/watch?v=MRe3UsRadKw
// Iteratively: https://www.youtube.com/watch?v=XwIivDg1BlY
// ------------------------------------------------------------------

extension LinkedList {
    // O(n) time,
    // O(1) space
    public func reverseLL_Iterative() {
        var prevNode: node? // as singly linked list doesn't has link to previous node, cache it
        var currNode = self.head // Node to traverse the linked list
        var nextNode: node? // Cache next node, as during reversing the link between two nodes, connectivity to next gets lost
        
        self.tail = self.head
        
        while currNode != nil {
            nextNode = currNode?.next
            currNode?.next = prevNode
            prevNode = currNode
            currNode = nextNode
        }
        self.head = prevNode
        
        print("Reversed Linked List: \(self.description)")
    }
    
    // O(n) time,
    // O(n) space (due to recursion, each stack during recursion is cached in Stack memory)
    public func reverseLL_Recursively() {
        reverse_recursive(prev: nil, curr: self.head)
        print("Reversed Linked List: \(self.description)")
    }
    
    private func reverse_recursive(prev: node?, curr: node?) {
        if curr == nil {
            return
        }
        if curr?.next == nil {
            self.head = curr
            curr?.next = prev
            return
        }
        reverse_recursive(prev: curr, curr: curr?.next)
        curr?.next = prev
    }
}

// ------------------------------------------------------------------
// MARK: Pallindrome
// ------------------------------------------------------------------


// ------------------------------------------------------------------
// Delete Middle node of a Linked List. You don't know head or tail node
// https://www.youtube.com/watch?v=Cay6RsoIG78&index=4&list=PLamzFoFxwoNiAFTHWT-v7jtLAGbMn0Mar
// B => A => D => E => F => C
//           👆
// ------------------------------------------------------------------

extension LinkedList {
    
    public func deleteMiddleNode() {
        deleteGivenNode(nodeAtIndex(2)!)
    }

    private func deleteGivenNode(_ node: LinkedListNode<Type>) {
        let currValue = node.next?.value
        if let currVal = currValue {
            node.value = currVal
            node.next = node.next?.next
        }
    }

}


