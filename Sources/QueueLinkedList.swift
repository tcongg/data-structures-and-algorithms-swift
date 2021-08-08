private extension QueueLinkedList {
    class Node {
        var value: Int
        var next: Node?

        init(value: Int) {
            self.value = value
        }
    }
}

final class QueueLinkedList: ExpressibleByArrayLiteral {
    private var head: Node?
    private var tail: Node?

    init(arrayLiteral elements: Int...) {
        elements.forEach { element in
            enqueue(value: element)
        }
    }

    // Checks if queue is empty or not
    func isEmpty() -> Bool {
        return head == nil
    }

    // Adds value at position at tail
    func enqueue(value: Int) {
        let newNode = Node(value: value)

        if let tail = tail {
            tail.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    // Returns value and removes least recently added element (front)
    func dequeue() -> Int? {
        let curr = head
        head = head?.next
        if head == nil {
            tail = nil
        }
        return curr?.value
    }
}