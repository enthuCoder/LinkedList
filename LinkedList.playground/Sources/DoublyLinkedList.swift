import Foundation

// ==================================================================
// MARK: Linked List Node
// ==================================================================

public class DoublyLinkedListNode<Type>: NSObject {
    
    public var value: Type
    public var next: DoublyLinkedListNode?
    public var prev: DoublyLinkedListNode?
    
    public init(_ newValue: Type) {
        self.value = newValue
    }
}

// ==================================================================
// MARK: Implement Doubly Linked List as a class
// ==================================================================
public class DoublyLinkedList<Type> {
    
    public typealias node = DoublyLinkedListNode<Type>
    
    public init() { }
    
    // Node references
    public var head: node?
    public var tail: node?
}

// ------------------------------------------------------------------
// MARK: Helper Functions
// ------------------------------------------------------------------
extension DoublyLinkedList {
    
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

extension DoublyLinkedList {
 
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
extension DoublyLinkedList: CustomStringConvertible {
    
    public var description: String {
        var text = "["
        var tempNode = self.first
        
        while tempNode != nil {
            if tempNode == self.first {
                text = text + "\(tempNode!.value)"
            } else {
                text = text + " ←⍥→ " + "\(tempNode!.value)"
            }
            tempNode = tempNode?.next
        }
        text = text + "]"
        return text
    }
}

// ------------------------------------------------------------------
// MARK: Insert into Doubly Linked List
// ------------------------------------------------------------------

extension DoublyLinkedList {
    
    public func insertAtIndex(_ index: Int, value: Type) {
        
    }
    
    public func insertAtHead(_ value: Type) {
        
    }
    
    public func insertAtTail(_ value: Type) {
        
    }
    
    public func insertAfter(_ index: Int, value: Type) {
        
    }
    
    public func insertBefore(_ index: Int, value: Type) {
        
    }
    
    public func deleteAtIndex(_ index: Int) {
        
    }
    
}

// ------------------------------------------------------------------
// MARK: Detect Loop
// Explanation of Looping alorithm: https://www.youtube.com/watch?v=apIw0Opq5nk
// ------------------------------------------------------------------

extension DoublyLinkedList {
    
    public func detectLoop() -> (Bool, node?) {
        return (false, nil)
    }
}

// ------------------------------------------------------------------
// MARK: Reverse a Doubly Linked List
// Recursively: https://www.youtube.com/watch?v=MRe3UsRadKw
// Iteratively: https://www.youtube.com/watch?v=XwIivDg1BlY
// ------------------------------------------------------------------

extension DoublyLinkedList {
    // O(n) time,
    // O(1) space
    public func reverseLL_Iterative() {
        
    }
    
    public func reverseLL_Recursively() {
        
    }
}
