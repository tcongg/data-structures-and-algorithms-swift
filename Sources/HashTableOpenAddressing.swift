private extension HashTableOpenAddressing {
    class Node {
        var key: String
        var value: Int

        init(key: String, value: Int) {
            self.key = key
            self.value = value
        }
    }
}

final class HashTableOpenAddressing: ExpressibleByDictionaryLiteral {
    private static let capacity = 11
    private var bucket: [Node?] = Swift.Array(repeating: nil, count: HashTableOpenAddressing.capacity)

    required init(dictionaryLiteral elements: (String, Int)...) {
        for (key, value) in elements {
            add(value, with: key)
        }
    }

    subscript(_ key: String) -> Int? {
        get {
            return get(key)
        }
        set (value) {
            if let value = value {
                add(value, with: key)
            } else {
                remove(key)
            }
        }
    }

    // Djb2 hash
    private func hash(_ key: String) -> Int {
        let unicodeScalars = key.unicodeScalars.map { $0.value }
            let hashValue = unicodeScalars.reduce(5381) {
                ($0 << 5) &+ $0 &+ Int($1) 
            }
        return hashValue % HashTableOpenAddressing.capacity
    }

    private func hash2(_ value: Int) -> Int {
        return (value + 1) % HashTableOpenAddressing.capacity
    }

    func add(_ value: Int, with key: String) {
        var index = hash(key)
        let newNode = Node(key: key, value: value)

        while bucket[index] != nil && bucket[index]?.key != key {
            index = hash2(index)
        }

        if bucket[index]?.key == key {
            bucket[index]?.value = value
        }

        if bucket[index] == nil || bucket[index]?.key == "deleted" {
            bucket[index] = newNode
        }
    }

    func get(_ key: String) -> Int? {
        var index = hash(key)

        while bucket[index] != nil   {
            if bucket[index]?.key == key {
                return bucket[index]?.value
            }
            index = hash2(index)
        }

        return nil
    }

    func remove(_ key: String) {
        let node = Node(key: "deleted", value: -1)
        var index = hash(key)
        while bucket[index] != nil {
            if bucket[index]?.key == key {
                bucket[index] = node
                return
            }
            index = hash2(index)
        }
    }
}