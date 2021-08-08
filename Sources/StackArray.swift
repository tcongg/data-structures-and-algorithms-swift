final class StackArray: ExpressibleByArrayLiteral {
    private var bucket = [Int]()

    init() {
    }

    init(arrayLiteral elements: Int...) {
        elements.forEach { element in
            push(value: element)
        }
    }

    // Checks if stack is empty or not
    func isEmpty() -> Bool {
        return bucket.isEmpty
    }

    // Returns the last value of stack
    func top() -> Int? {
        if isEmpty() {
            return nil
        }

        return bucket.last
    }

    // Adds a value at the last position
    func push(value: Int) {
        bucket.append(value)

    }

    // Delete recently added value
    func pop() {
        _ = bucket.popLast()
    }

}