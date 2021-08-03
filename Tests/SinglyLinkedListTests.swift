@testable import DataStructures

import XCTest
import class Foundation.Bundle

final class SinglyLinkedListTests: XCTestCase {
    func test_whenListIsCreated_thenListIsEmpty() {
        let list: SinglyLinkedList = []
        XCTAssertTrue(list.isEmpty())
    }

    func test_createListWithArrayLiteral() {
        let list: SinglyLinkedList = [1,2,3,4]
        XCTAssertFalse(list.isEmpty())
    }

    func test_addValueAtInvalidIndex_whenListIsCreated() {
        let list: SinglyLinkedList = [3,2,1]
        list.insert(at: -1, value: 4)
        list.insert(at: 5, value: 4)
        XCTAssertEqual(list[0], 3)
        XCTAssertEqual(list[1], 2)
        XCTAssertEqual(list[2], 1)
    }

    func test_whenListIsEmpty_thenInsertValueInFront() {
        let list: SinglyLinkedList = [1]
        list.insert(at: 0, value: 5)
        list.pushFront(value: 4)
        XCTAssertEqual(list[0], 4)
        XCTAssertEqual(list[1], 5)
        XCTAssertEqual(list[2], 1)
    }

    func test_addValue_whenListIsEmpty_thenCheckResult() {
        let list: SinglyLinkedList = [3,2,1]
        XCTAssertEqual(list[0], 3)
        XCTAssertEqual(list[1], 2)
        XCTAssertEqual(list[2], 1)
    }

    func test_deleteValue_whenListIsCreated_thenCheckResult() {
        let list: SinglyLinkedList = [5,4,3,2,1]
        list.delete(at: 1)
        XCTAssertEqual(list.popFront(), 5)
        XCTAssertEqual(list.popBack(), 1)
        XCTAssertEqual(list[0], 3)
        XCTAssertEqual(list[1], 2)
    }

    func test_whenListIsCreated_thenReverse() {
        let list: SinglyLinkedList = [3,2,1]
        list.reverse()
        XCTAssertEqual(list[0], 1)
        XCTAssertEqual(list[1], 2)
        XCTAssertEqual(list[2], 3)
    }
}