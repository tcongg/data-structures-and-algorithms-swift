class Array {
    private(set) var size: Int
    private(set) var capacity: Int 
    private var bucket: [Int]
    private static let minCapacity: Int = 8

    init() {
        size = 0
        capacity = Array.minCapacity
        bucket = Swift.Array(repeating: 0, count: capacity)
    }

    subscript(index: Int) -> Int {
        get {
            return value(at: index)
        }
        set (value) {
            setValue(at: index, number: value)
        }
    }

    // Check if array is empty or not
    func isEmpty() -> Bool {
        return size == 0
    }

    // Set a new value at index. If index is out of range or array is empty, do nothing
    func setValue(at index: Int, number: Int) {
        if (isEmpty()) {
            return
        }
        if ( index < 0 || index >= size) {
            return
        }

        bucket[index] = number
    }

    // Add a value at index. If index is out of range, do nothing. If array is full, resize it then insert value
    func insert(at index: Int, value number: Int){
        resize()

        if ( index < 0 || index > size) {
            return
        }

        for i in stride(from: size, to: index, by: -1) {
            bucket[i] = bucket[i - 1] 
        }
        bucket[index] = number
        size += 1
    }

    // Add a value at the end of array
    func append(_ number: Int) {
        insert(at: size, value: number)
    }

    // Add a value at the beginning of array
    func push(_ number: Int) {
        insert(at: 0, value: number)
    }

    // Delete a value at index. If index is out of range, do nothing. If size less than or equal 1/4 capacity and not less than minimun capacity, resize array
    func remove(at index: Int) {
        if ( index < 0 || index >= size) {
            return
        }

        for i in index..<size  {
            bucket[i] = bucket[i + 1]
        }
        size -= 1

        resize()
    }

    // Delete value at last
    func removeLast() {
        remove(at: size - 1)
    }

    // Delete value at first
    func removeFirst() {
        remove(at: 0)
    }

    // Get value at index. If index is out of range or array is empty, do nothing
    private func value(at index: Int) -> Int {
        if (isEmpty()) {
            return -1
        }
        if ( index < 0 || index >= size) {
            return -1
        }

        return bucket[index]
    }

    // Change size of array
    // When array full create a new array with new capacity is 2 times larger than old array, then copy all elements of old array to the new one
    // When the size less than or equal 1/4 capacity and not less than minimun capacity, create new array with new capacity less than half old array, then copy
    private func resize() {
        var newCapacity: Int = 0
        if(size == capacity) {
            newCapacity = capacity * 2
        } else if (size <= capacity / 4 && capacity / Array.minCapacity != 1) {
            newCapacity = capacity / 2
        } else {
            return
        }

        var newBucket = Swift.Array(repeating: 0, count: newCapacity)
        for i in 0..<size {
            newBucket[i] = bucket[i]
        }

        capacity = newCapacity
        bucket = newBucket
    }

}