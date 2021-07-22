@testable import DataStructures

import XCTest
import class Foundation.Bundle

final class ArrayTests: XCTestCase {
    func test_whenArrayIsCreated_thenArrayisEmpty() {
        let array = Array()
        XCTAssertTrue(array.isEmpty())
    }

    func test_findValue_whenArrayIsEmpty_theThrowError() {
        let array = Array()
        XCTAssertEqual(array[0], -1)
    }

    func test_findInvalidIndex_whenArrayIsNotEmpty_thenThrowError() {
        let array = Array()
        array.append(1)
        XCTAssertEqual(array[1], -1)
        XCTAssertEqual(array[-1], -1)
    }

    func test_findValueAtValidIndex_whenArrayIsNotEmpty_thenReturnResult() {
        let array = Array()
        array.append(1)
        array.append(2)
        array.append(3)
        array.append(4)
        array.append(5)
        array.append(6)
        XCTAssertEqual(array[0], 1)
    }

    func test_setValueAtInvalidIndex_whenArrayIsCreated_thenNothingChange() {
        let array = Array()
        array.append(1)
        array.append(2)
        array[3] = 3
        array[-1] = 4
        XCTAssertEqual(array[0], 1)
        XCTAssertEqual(array[1], 2)
    }

    func test_whenArrayIsCreated_thenSetValueAtValidIndex() {
        let array = Array()
        array.append(1)
        array.append(2)
        array[0] = 3
        array[1] = 4
        XCTAssertEqual(array[0], 3)
        XCTAssertEqual(array[1], 4)
    }

    func test_insertAtInvalidIndex_whenArrayIsCreated_thenNothingChange () {
        let array = Array()
        array.append(1)
        array.append(2)
        array.insert(at: 99, value: 3)
        array.insert(at: -1, value: 4)
        XCTAssertEqual(array.size, 2)
    }

    func test_whenArrayIsCreated_thenInsertNumberWithValidIndex() {
        let array = Array()
        array.insert(at: 0, value: 1)
        array.insert(at: 1, value: 2)
        array.insert(at: 2, value: 3)
        array.insert(at: 1, value: 4)

        XCTAssertEqual(array[0], 1)
        XCTAssertEqual(array[1], 4)
        XCTAssertEqual(array[2], 2)
        XCTAssertEqual(array[3], 3)
        XCTAssertEqual(array.size, 4)
    }

    func test_insert_whenArrayIsFull_thenResizeUp() {
        let array = Array()
        array.insert(at: 0, value: 1)
        array.insert(at: 1, value: 2)
        array.insert(at: 2, value: 3)
        array.insert(at: 3, value: 4)
        array.insert(at: 4, value: 5)
        array.insert(at: 5, value: 6)
        array.insert(at: 6, value: 7)
        array.insert(at: 7, value: 8)
        array.insert(at: 8, value: 9)
        XCTAssertEqual(array[0], 1)
        XCTAssertEqual(array[7], 8)
        XCTAssertEqual(array[8], 9)
        XCTAssertEqual(array.capacity, 16)
    }

    func test_whenArrayIsCreated_thenAddAValidNumberAtTheBeginning() {
        let array = Array()
        array.push(1)
        array.push(2)
        array.push(3)
        XCTAssertEqual(array[0], 3)
        XCTAssertEqual(array[1], 2)
        XCTAssertEqual(array[2], 1)
    }

    func test_whenArrayIsCreated_thenAddAValidNumberAtTheEnd() {
        let array = Array()
        array.append(1)
        array.append(2)
        array.append(3)
        XCTAssertEqual(array[0], 1)
        XCTAssertEqual(array[1], 2)
        XCTAssertEqual(array[2], 3)
    }

    func test_removeAtInvalidIndex_whenArrayIsCreated_thenNothingChange() {
        let array = Array()
        array.append(1)
        array.append(2)
        array.append(3)
        array.append(4)

        array.remove(at: -1)
        array.remove(at: 4)
        XCTAssertEqual(array[0], 1)
        XCTAssertEqual(array[1], 2)
    }

    func test_removeAtValidIndex_whenArrayIsValidAnd_thenReturnResult() {
        let array = Array()
        array.append(1)
        array.append(2)
        array.append(3)
        array.append(4)

        array.remove(at: 1)
        array.remove(at: 2)
        XCTAssertEqual(array[0], 1)
        XCTAssertEqual(array[1], 3)
    }

    func test_whenArrayisValid_hasManyEmptyElement_thenResizeDown () {
        let array = Array()
        array.append(1)
        array.append(2)
        array.append(3)
        array.append(4)
        array.append(5)
        array.append(6)
        array.append(7)
        array.append(8)
        array.append(9)
        XCTAssertEqual(array.capacity, 16)
        
        array.remove(at: 1)
        array.remove(at: 2)
        array.remove(at: 2)
        array.remove(at: 2)
        array.remove(at: 2)
        array.remove(at: 2)
        array.remove(at: 2)
        XCTAssertEqual(array[0], 1)
        XCTAssertEqual(array[1], 3)
        XCTAssertEqual(array.capacity, 8)
    }

    func test_whenArrayIsValid_thenRemoveAtFirst() {
        let array = Array()
        array.append(1)
        array.append(2)
        array.append(3)
        array.append(4)

        array.removeFirst()
        XCTAssertEqual(array[0], 2)
        XCTAssertEqual(array[1], 3)
        XCTAssertEqual(array[2], 4)
    }

    func test_whenArrayIsValid_thenRemoveAtLast() {
        let array = Array()
        array.append(1)
        array.append(2)
        array.append(3)
        array.append(4)

        array.removeLast()
        XCTAssertEqual(array[0], 1)
        XCTAssertEqual(array[1], 2)
        XCTAssertEqual(array[2], 3)
    }
}