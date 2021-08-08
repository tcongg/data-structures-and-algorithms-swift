@testable import DataStructures

import XCTest
import class Foundation.Bundle

final class QueueArrayTests: XCTestCase {
    func test_whenQueueIsCreated_thenQueueIsEmpty() {
        let queue: QueueArray = []
        XCTAssertTrue(queue.isEmpty())
    }

    func test_whenQueueIsCreated_thenEnqueue() {
        let queue: QueueArray = []
        queue.enqueue(value: 1)
        XCTAssertFalse(queue.isEmpty())
    }

    func test_enqueue_whenQueueIsCreated_thenQueueIsFull() {
        let queue: QueueArray = [1,2,3,4,5,6]
        queue.enqueue(value: 7)
        XCTAssertTrue(queue.isFull())
    }

    func test_whenQueueIsCreated_thenDequeue() {
        let queue: QueueArray = [1,2,3,4,5,6]
        XCTAssertEqual(queue.dequeue(), 1)
    }

    func test_whenQueueIsCreated_thenDequeueAllElement() {
        let queue: QueueArray = [1,2,3,4,5,6]
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.dequeue(), 3)
        XCTAssertEqual(queue.dequeue(), 4)
        XCTAssertEqual(queue.dequeue(), 5)
        XCTAssertEqual(queue.dequeue(), 6)
        XCTAssertTrue(queue.isEmpty())
    }

    func test_whenDequeueAllElement_thenEnqueue() {
        let queue: QueueArray = [1,2,3,4,5,6]
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.dequeue(), 3)
        XCTAssertEqual(queue.dequeue(), 4)
        XCTAssertEqual(queue.dequeue(), 5)
        XCTAssertEqual(queue.dequeue(), 6)
        queue.enqueue(value: 9)
        queue.enqueue(value: 10)
        queue.enqueue(value: 11)
        XCTAssertEqual(queue.dequeue(), 9)
        XCTAssertEqual(queue.dequeue(), 10)
        XCTAssertEqual(queue.dequeue(), 11)
        XCTAssertTrue(queue.isEmpty())
    }
}