class DynamicArray {
	var _size : Int = 0
	var _capacity : Int = 8
	var _array = [Int]()

	init() {	
		self._array = Array(repeating: 0, count: self._capacity)
	}

	func size() -> Int {
        //Number of items
		return self._size
	}

	func capacity() -> Int {
        //Number of items it can hold
		return self._capacity
	}

	func isEmpty() -> Bool {
        //Check if array is empty or not
		return self._size == 0
	}

	func atIndex(_ index: Int) -> Int{
        //Returns item at given index, return -1 if index out of bounds
		if (index < 0 || index >= self._size) {
			return -1
		}

		return self._array[index]
	}

	func push(_ value: Int) -> Void {
        //Add an item at the end of array
		self.insertValue(value, self._size)
	}

	func insertValue(_ value: Int, _ index: Int) -> Void {
        //Inserts item at index
		if (index < 0 || index >= self._size) {
			return -1
		}

		self.resize()
		for i in stride(from: self._size, to: index, by: -1) {
			self._array[i] = self._array[i - 1]
		}
		self._array[index] = value
		self._size += 1
	}

	func prependValue(_ value: Int) -> Void {
        //Insert item at index 0
		self.insertValue(value, 0)
	}

	func pop() -> Int {
        //Remove from end, return value or -1 if not exist
		if self._size == 0 {
			return -1
		}

		let popValue = self._array[self._size - 1]
		self.delete(self._size - 1)
		return popValue
	}

	func delete(_ index: Int) -> Void {
        //Delete item at index
		if (index < 0 || index >= self._size) {
			return -1
		}

		for i in index..<self._size {
			self._array[i] = self._array[i + 1]
		}
		self._size -= 1
		self.resize()
	}

	func remove(_ value: Int) -> Void {
        //Looks for value and removes index holding it, even if in multiple places
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
        //Look for value and return the first index of it in array
		for i in 0..<self._size {
			if self._array[i] == value {
				return i
			}
		}

		return -1
	}

	func resize() -> Void {
        //when you reach capacity, resize to double the size
        //when popping an item, if size is 1/4 of capacity, resize to half
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
