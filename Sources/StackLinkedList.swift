private extension StackLinkedList {
    class Node {
        var value: Int
        var next: Node?

        init(value: Int) {
            self.value = value
        }
    }
}

final class StackLinkedList: ExpressibleByArrayLiteral {
    private var head: Node?

    init(arrayLiteral elements: Int...) {
        elements.forEach { element in
            push(value: element)
        }
    }

    // Checks if stack is empty or not
    func isEmpty() -> Bool {
        return head == nil
    }

    // Return value at position at head
    func top() -> Int? {
        if isEmpty() {
            return nil
        }

        return head?.value
    }

    // Adds value at position at head
    func push(value: Int) {
        let newNode = Node(value: value)
        if isEmpty() {
            head = newNode
        } else {
            let node = head
            head = newNode
            head!.next = node
        }  
    }

    // Delete recently added value
    func pop() {
        if isEmpty() {
            return
        }
        head = head!.next
    }
}