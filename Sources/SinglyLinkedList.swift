private extension SinglyLinkedList {
    class Node {
        var value: Int
        var next: Node?

        init(value: Int) {
            self.value = value
        }
    }
}

final class SinglyLinkedList: ExpressibleByArrayLiteral {
    private var head: Node?
    private var size = 0

    init(arrayLiteral elements: Int...) {
        elements.forEach { element in
            pushBack(value: element)
        }
    }

    subscript(index: Int) -> Int? {
        get {
            return node(at: index).value
        }
    }

    // Check if list is empty or not
    func isEmpty() -> Bool {
        return head == nil
    }

    // Get value of the first element in list
    func first() -> Int? {
        if let head = head {
            return head.value
        }

        return nil
    }

    // Get value of the last element in list
    func last() -> Int? {
        guard !isEmpty() else {
            return nil
        }
        return value(at: size - 1)
    }

    // Insert a value at the end of list. If list is empty, insert to head
    func pushBack(value: Int) {
        let newNode = Node(value: value)
        if isEmpty() {
            head = newNode
        } else {
            let nextNode = node(at: size-1)   
            nextNode!.next = newNode
        }

        size += 1
    }

    // Insert a value at the beginning of list
    func pushFront(value: Int) {
        let newHead = Node(value: value)
        let node = head
        head = newHead
        head!.next = node
        size += 1
    }

    // Insert a value at given index. If given index is invalid then nothing change
    func insert(at index: Int, value: Int) {
        if !isValid(index) {
            return
        }

        let newNode = Node(value: value)
        if (index == 0 || isEmpty()) {
            pushFront(value: value)
        } else {
            let nextNode = node(at: index)
            newNode.next = nextNode!.next
            nextNode?.next = newNode
        }

        size += 1
    }

    // Delete the last element and return it's value. If list is empty, return -1
    func popBack() -> Int? {
        if isEmpty() {
            return nil
        }

        var node = node(at: size-1)
        let value = node!.value
        node = nil
        size -= 1
        return value
    }

    // Delete the first element and return it's value. If list is empty, return -1
    func popFront() -> Int? {
        if isEmpty() {
            return nil
        }

        let value = head!.value
        head = head!.next
        size -= 1
        return value
    }

    // Delete element at given index. If given index is invalid then nothing change
    func delete(at index: Int) {
        if !isValid(index) {
            return
        }
        
        if (index == 0) {
            head = head!.next
        } else {
            let node = node(at: index-1) 
            node!.next = node!.next!.next
        }

        size -= 1
    }

    // Reverse list
    func reverse() {
        if size <= 1 {
            return
        }

        var next = head
        var prev: Node?
        while next != nil {
            let curr = next!.next
            next!.next = prev
            prev = next
            next = curr
        }

        head = prev
    }

    // Check given index is valid or not
    private func isValid(_ index: Int) -> Bool {
        if index < 0 || index > size {
            return false
        }

        return true
    }

    // Return a node after traverse from start index to end index
    private func node(at index:Int) -> Node! {
        var node = head
        for _ in 0..<index {
            node = node!.next
        }

        return node
    }
}