import Cocoa

// ==================================================================
// Test the implementation - Singly Linked List
// ==================================================================

let myLinkedList = LinkedList<Int>()

myLinkedList.insertAtHead(1)
myLinkedList.insertAtHead(5)
myLinkedList.insertAtTail(9)


myLinkedList.insertAtIndex(1, value: 23)

print("Head: \(myLinkedList.head!.value) --  Tail: \(myLinkedList.tail!.value)")

print("\(myLinkedList.description)")

myLinkedList.deleteAtIndex(3)

print("\(myLinkedList.description)")
