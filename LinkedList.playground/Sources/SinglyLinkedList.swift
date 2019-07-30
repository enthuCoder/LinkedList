import Foundation

// Linked List algorithms: [Playlist: Linked Lists] https://www.youtube.com/channel/UCMNkvKnD3mo3Jj9eTwJllWw

// ==================================================================
// Linked List Node
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
// Implement Linked List as a class
// ==================================================================
public class LinkedList<Type> {
    
    public typealias node = LinkedListNode<Type>
    
    public init() { }
    
    // Node references
    public var head: node?
    public var tail: node?
}

// ------------------------------------------------------------------
// Helper Functions
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
// Node At Index
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
// Print Description of the Linked List - Human Readable Format
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
// Insert into Linked List
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
    
    // TODO: More condition checks can be added here
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
// Detect Loop
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
// Reverse a Singly Linked List
// Recursively: https://www.youtube.com/watch?v=MRe3UsRadKw
// Iteratively: https://www.youtube.com/watch?v=XwIivDg1BlY
// ------------------------------------------------------------------

extension LinkedList {
    
}
