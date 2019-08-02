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

myLinkedList.insertAtTail(15)
print("\(myLinkedList.description)")

print("Head: \(myLinkedList.head!.value) --  Tail: \(myLinkedList.tail!.value)")


// ---------------------------------
// Detecting loop in the linked list
// ---------------------------------
print("\n == Detecting Loops in Linked List == \n")

let loopingList = LinkedList<Int>()

loopingList.insertAtTail(8)
loopingList.insertAtTail(1)
loopingList.insertAtTail(9)
loopingList.insertAtTail(4)
loopingList.insertAtTail(2)

loopingList.insertAtTail(3)
loopingList.insertAtTail(7)
loopingList.insertAtTail(2)
loopingList.insertAtTail(9)

print("Head: \(loopingList.head!.value) --  Tail: \(loopingList.tail!.value)")

// Create loop in the Linked List
loopingList.tail?.next = loopingList.head?.next?.next?.next?.next

//print("Looping List: \(loopingList.description)")

// Check if the linked list has loop. If yes, print the value of the node at which the loop starts
let result = loopingList.detectLoop()
if result.0 == true, let value = result.1?.value {
    print("Found Loop at node= \(String(describing: value))\n")
} else {
    print("No Loop found\n")
}

// ---------------------------------
// Detecting loop in the linked list
// ---------------------------------
print("After Reversing Linked List Iteratively\n")
myLinkedList.reverseLL_Iterative()
print("Head: \(myLinkedList.head!.value) --  Tail: \(myLinkedList.tail!.value)")

print("After Reversing Linked List Recursively\n")
myLinkedList.reverseLL_Recursively()
print("Head: \(myLinkedList.head!.value) --  Tail: \(myLinkedList.tail!.value)")


print("Delete Middle Node, head or tail not known")

let deleteTestLinkedList = LinkedList<Character>()
var newChar = Character.init("A")
deleteTestLinkedList.insertAtTail(newChar)
newChar = Character.init("B")
deleteTestLinkedList.insertAtTail(newChar)
newChar = Character.init("C")
deleteTestLinkedList.insertAtTail(newChar)
newChar = Character.init("B")
deleteTestLinkedList.insertAtTail(newChar)
newChar = Character.init("A")
deleteTestLinkedList.insertAtTail(newChar)

print("NewList b4 Delete: \(deleteTestLinkedList.description) \n")

print("Is this list Pallindrome: \(deleteTestLinkedList.isPallindrome()) \n")

deleteTestLinkedList.deleteMiddleNode()
print("NewList after Delete: \(deleteTestLinkedList.description)")

print("Is this list Pallindrome: \(deleteTestLinkedList.isPallindrome()) \n")
