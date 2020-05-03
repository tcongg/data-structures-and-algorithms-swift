class SwiftArray {
	var _size : Int = 0
	var _capacity : Int = 8
	var _array = [Int]()

	init() {	
		self._array = Array(repeating: 0, count: self._capacity)
	}

	func size() -> Int {
		return self._size
	}

	func capacity() -> Int {
		return self._capacity
	}

	func isEmpty() -> Bool {
		return self._size == 0
	}

	func atIndex(_ index: Int) -> Int {
		return self._array[index]
	}

	func push(_ value: Int) -> Void {
		self.insertValue(value, self._size)
	}

	func insertValue(_ value: Int, _ index: Int) -> Void {
		self.resize()
		for i in stride(from: self._size, to: index, by: -1) {
			self._array[i] = self._array[i - 1]
		}
		self._array[index] = value
		self._size += 1
	}

	func prependValue(_ value: Int) -> Void {
		self.insertValue(value, 0)
	}

	func pop() -> Int {
		let popValue = self._array[self._size - 1]
		self.delete(self._size - 1)
		return popValue
	}

	func delete(_ index: Int) -> Void {
		for i in index..<self._size {
			self._array[i] = self._array[i + 1]
		}
		self._size -= 1
		self.resize()
	}

	func remove(_ value: Int) -> Void {
		var move: Int = 0

		for i in 0..<self._size {
			if self._array[i] != value {
				self._array[move] = self._array[i]
				move += 1
			}
		}

		self._size = move
		self.resize()
	}

	func find(_ value: Int) -> Int {
		for i in 0..<self._size {
			if self._array[i] == value {
				return i
			}
		}

		return -1
	}

	func resize() -> Void {
		var newCapacity: Int
		if self._size == self._capacity {
			newCapacity = self._capacity * 2
		} else if (self._size > 0 && self._size <= self._capacity / 4 && self._capacity > 8) {
			newCapacity = self._capacity / 2
		} else {
			return
		}

		var newArray = Array(repeating: 0, count: newCapacity)

		for i in 0..<self._size {
			newArray[i] = self._array[i]
		}

		self._array.removeAll()

		self._array = newArray
		self._capacity = newCapacity
	}
}