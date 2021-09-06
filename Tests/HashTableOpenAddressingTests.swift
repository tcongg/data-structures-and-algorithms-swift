@testable import DataStructures

import XCTest
import class Foundation.Bundle

final class HashTableOpenAddressingTests: XCTestCase {
func test_whenHashTableIsCreated_thenAdd() {
        let hashTable: HashTableOpenAddressing = [
            "1": 1,
            "2": 2,
            "3": 3
        ]
        hashTable["4"] = 4
        XCTAssertEqual(hashTable["4"], 4)
    }

    func test_whenHashTableIsCreated_thenAddExistedKey() {
        let hashTable: HashTableOpenAddressing = [
            "1": 1,
            "2": 2,
            "3": 3
        ]
        hashTable["1"] = 4
        XCTAssertEqual(hashTable["1"], 4)
        XCTAssertEqual(hashTable["2"], 2)
        XCTAssertEqual(hashTable["3"], 3)
    }

    func test_whenHashTableIsCreated_thenAddExistedIndex() {
        let hashTable: HashTableOpenAddressing = [
            "1": 1,
            "2": 2,
            "3": 3
        ]
        hashTable["11"] = 11
        hashTable["21"] = 21
        hashTable["11"] = 99  
        XCTAssertEqual(hashTable["1"], 1)
        XCTAssertEqual(hashTable["2"], 2)
        XCTAssertEqual(hashTable["3"], 3)
        XCTAssertEqual(hashTable["11"], 99)
        XCTAssertEqual(hashTable["21"], 21)
    }

    func test_whenHashTableIsCreated_thenAddNil() {
        let hashTable: HashTableOpenAddressing = [
            "1": 1,
            "2": 2,
            "3": 3
        ]
        hashTable["1"] = nil
        XCTAssertEqual(hashTable["1"], nil)
    }

    func test_whenHashTableIsCreated_thenRemove() {
        let hashTable: HashTableOpenAddressing = [
            "1": 1,
            "2": 2,
        ]
        hashTable["1"] = nil
        XCTAssertEqual(hashTable["1"], nil)
        XCTAssertEqual(hashTable["2"], 2)
    }

    func test_whenHashTableIsCreated_thenRemoveExistedKey() {
        let hashTable: HashTableOpenAddressing = [
            "1": 1,
            "2": 2,
            "11":11,
            "21":21,
        ]
        hashTable["1"] = nil
        hashTable["31"] = 31
        XCTAssertEqual(hashTable["1"], nil)
        XCTAssertEqual(hashTable["11"], 11)
        XCTAssertEqual(hashTable["21"], 21)
        XCTAssertEqual(hashTable["31"], 31)
    }
}