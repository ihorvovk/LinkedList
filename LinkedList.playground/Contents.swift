import Foundation

class Node: CustomStringConvertible {

    let id: Int
    var next: Node?
    
    var description: String {
        var result = "(id = \(id))"
        if let next = next {
            result += " -> \(next.description)"
        }
        
        return result
    }
    
    init(id: Int) {
        self.id = id
    }
}

func generateLinkedList(ids: ClosedRange<Int>) -> Node {
    let headNode = Node(id: ids.lowerBound)
    var lastNode: Node? = headNode
    
    for id in ids.dropFirst() {
        lastNode?.next = Node(id: id)
        lastNode = lastNode?.next
    }
    
    return headNode
}

// Returns an array of two linked lists. First will contain only odd elements from the input, second - only even elements. Both returned lists will be in reversed order.
func divideLinkedListIntoOddAndEven(head: Node) -> [Node?] {
    var oddLinkedListHead: Node?
    var evenLinkedListHead: Node?
    
    var node: Node? = head
    var index = 0
    
    while node != nil {
        let nextNode = node?.next
        
        if index % 2 == 0 {
            node?.next = evenLinkedListHead
            evenLinkedListHead = node
        } else {
            node?.next = oddLinkedListHead
            oddLinkedListHead = node
        }
        
        node = nextNode
        index += 1
    }
    
    return [oddLinkedListHead, evenLinkedListHead]
}


let linkedList = generateLinkedList(ids: 0...10)
print("source: " + linkedList.description)

let oddAndEvenLinkedLists = divideLinkedListIntoOddAndEven(head: linkedList)

if oddAndEvenLinkedLists.count == 2, let oddLinkedList = oddAndEvenLinkedLists[0], let evenLinkedList = oddAndEvenLinkedLists[1] {
    print("odd: " + oddLinkedList.description)
    print("even: " + evenLinkedList.description)
} else {
    print("error")
}
