final class QueueArray: ExpressibleByArrayLiteral {
    private static let capacity = 8
    private var bucket: [Int?] = Swift.Array(repeating: nil, count: QueueArray.capacity)
    private var read = 0
    private var write = 0

    init() {
    }

    init(arrayLiteral elements: Int...) {
        elements.forEach { element in
            enqueue(value: element)
        }
    }

    // Checks if queue is empty or not
    func isEmpty() -> Bool {
        return read == write
    }

    // Checks if queue is full of not
    func isFull() -> Bool {
        return (write + 1) % QueueArray.capacity == read
    }

    // Adds item at end of available storage
    func enqueue(value: Int) {
        if isFull() {
            return
        }

        bucket[write] = value
        write = (write + 1) % QueueArray.capacity
    }

    // Returns value and removes least recently added element
    func dequeue() -> Int? {
        if isEmpty() {
            return nil
        }

        let value = bucket[read]
        bucket[read] = nil
        read = (read + 1) % QueueArray.capacity
        return value
    }
}