private extension HashTable {
    class Node {
        var key: String
        var value: Int
        var next: Node?

        init(key: String, value: Int) {
            self.key = key
            self.value = value
        }
    }
}

final class HashTable: ExpressibleByDictionaryLiteral {
    private static let capacity = 11
    private var bucket: [Node?] = Swift.Array(repeating: nil, count: HashTable.capacity)

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

    required init(dictionaryLiteral elements: (String, Int)...) {
        for (key, value) in elements {
            add(value, with: key)
        }
    }

    // Djb2 hash
    private func hash(_ key: String) -> Int {
        let unicodeScalars = key.unicodeScalars.map { $0.value }
            let hashValue = unicodeScalars.reduce(5381) {
                ($0 << 5) &+ $0 &+ Int($1) 
            }
        return hashValue % HashTable.capacity
    }

    // Adds an item to hashtable
    func add(_ value: Int, with key: String) {
        let index = hash(key)
        let newNode = Node(key: key, value: value)

        guard var node = bucket[index] else {
            bucket[index] = newNode
            return
        }

        if node.key == key {
            node.value = value
            return
        }

        while let next = node.next {
            if next.key == key {
                next.value = value
                return
            }
            node = next
        }
        node.next = newNode
    }
    // Returns value of given key. If item do not exists then returns nil
    func get(_ key: String) -> Int? {
        let index = hash(key)
        var node = bucket[index]

        while let curr = node {
            if curr.key == key {
                return curr.value
            }
            node = curr.next
        }

        return nil
    }
    // Removes item from hashtable
    func remove(_ key: String) {
        let index = hash(key)
        guard var node = bucket[index] else {
            return
        }

        if node.key == key {
            bucket[index] = node.next
            return
        }

        while let next = node.next {
            if next.key == key {
                node.next = next.next
                break
            }
            node = next
        }
    }
}