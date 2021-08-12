@testable import DataStructures

import XCTest
import class Foundation.Bundle

final class HashTableTests: XCTestCase {
    func test_whenHashTableIsCreated_thenAddAtExistedKey() {
        let hashTable: HashTable = [
            "1": 1,
            "2": 2,
            "3": 3
        ]
        hashTable["1"] = 4
        hashTable["11"] = 11
        hashTable["11"] = 99
        XCTAssertEqual(hashTable["1"], 4)
        XCTAssertEqual(hashTable["2"], 2)
        XCTAssertEqual(hashTable["3"], 3)
        XCTAssertEqual(hashTable["11"], 99)
    }

    func test_whenHashTableIsCreated_thenAddNil() {
        let hashTable: HashTable = [
            "1": 1,
            "2": 2,
            "3": 3
        ]
        hashTable["1"] = nil
        XCTAssertEqual(hashTable["1"], nil)
    }

    func test_whenHashTableIsCreated_thenRemove() {
        let hashTable: HashTable = [
            "1": 1,
            "2": 2,
        ]
        hashTable.remove("1")
        XCTAssertEqual(hashTable["1"], nil)
        XCTAssertEqual(hashTable["2"], 2)
    }
}