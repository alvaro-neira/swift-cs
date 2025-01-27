//
//  HeapArray.swift
//  swift-cs
//
//  Created by Alvaro Neira on 26-01-25.
//

//Max Heap: a node is greater than its children
//     15
//    /   \
//   5     10
//  / \   /
// 2   4 3
//If the tree root is at index 0, with valid indices 0 through n − 1, then each element a at index i has
//
//children at indices 2i + 1 and 2i + 2
//its parent at index floor((i − 1) / 2).
class HeapArray {
    private var arr: [Int]
    private var length: Int
    init(initialCapacity n: Int) {
        self.arr = Array(repeating: 0, count: n)
        self.length = 0
    }

    // Function to heapify ith node in a Heap
    // following a Bottom-up approach
    private func heapifyUp(_ i: Int) {
        // Find parent
        let parent = (i - 1) / 2

        if parent >= 0 {
            // For Max-Heap
            // If current node is greater than its parent
            // Swap both of them and call heapify again
            // for the parent
            if arr[i] > arr[parent] {

                // swap arr[i] and arr[parent]
                arr.swapAt(i, parent)

                // Recursively heapify the parent node
                heapifyUp(parent)
            }
        }
    }

    // TODO: why are there 2 heapify?
    // To heapify a subtree rooted with node i which is
    // an index in arr[]
    private func heapifyDown(_ i: Int) {
        var largest = i  // Initialize largest as root
        let l = 2 * i + 1  // left = 2*i + 1
        let r = 2 * i + 2  // right = 2*i + 2

        // If left child is larger than root
        if l < length && arr[l] > arr[largest] {
            largest = l
        }

        // If right child is larger than largest so far
        if r < length && arr[r] > arr[largest] {
            largest = r
        }

        // If largest is not root
        if largest != i {
            arr.swapAt(i, largest)

            // Recursively heapify the affected sub-tree
            heapifyDown(largest)
        }
    }

    // Function to insert a new node to the heap.
    public func add(_ key: Int) {
        // Increase the size of Heap by 1
        length += 1
        if arr.count == length {
            increaseCapacity()
        }
        // Insert the element at end of Heap
        arr[length - 1] = key

        // Heapify the new node following a
        // Bottom-up approach
        heapifyUp(length - 1)
    }

    private func increaseCapacity() {
        arr.reserveCapacity(length * 2)
    }
    public func printArr() {
        print(arr[0..<length])
    }
    public func peek() -> Int? {
        return arr.first
    }
    public func pop() -> Int? {
        // Get the last element
        let lastElement = arr[length - 1]

        // Replace root with first element
        arr[0] = lastElement

        // Decrease size of heap by 1
        length -= 1

        // heapify the root node
        heapifyDown(0)

        // return new size of Heap
        return lastElement
    }
}
