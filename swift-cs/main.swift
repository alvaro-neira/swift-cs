//
//  main.swift
//  swift-cs
//
//  Created by Alvaro Neira on 25-01-25.
//

import Foundation

// Array representation of Max-Heap
// 10
//    /  \
// 5    3
//  / \
// 2   4

// maximum size of the array
let MAX = 1000
var heap = HeapArray(initialCapacity: MAX)

//        // initializing some values
//        arr[0] = 10;
//        arr[1] = 5;
//        arr[2] = 3;
//        arr[3] = 2;
//        arr[4] = 4;

// The function inserts the new element to the heap and
// returns the new size of the array
heap.add(10)
heap.add(5)
heap.add(3)
heap.add(2)
heap.add(4)
heap.add(15)

heap.printArr()
// Final Heap will be:
// 15
//    /   \
// 5     10
//  / \   /
// 2   4 3

var heap2 = HeapArray(initialCapacity: MAX)

//        // initializing some values
//        arr[0] = 10;
//        arr[1] = 5;
//        arr[2] = 3;
//        arr[3] = 2;
//        arr[4] = 4;

// The function inserts the new element to the heap and
// returns the new size of the array
heap2.add(10)
heap2.add(5)
heap2.add(3)
heap2.add(2)
heap2.add(4)

heap2.pop()
heap2.printArr()

let swa = thirdMax([1,2,2,5,3,5])
print (swa)
