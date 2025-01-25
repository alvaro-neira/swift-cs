//
//  BinarySearch.swift
//  swift-cs
//
//  Created by Alvaro Neira on 25-01-25.
//

//
// Recursive
// Doesn't stop if it finds the element
// Instead if returns the lower index that doesn't comply
//
// arr
// low INCLUSIVE
// high INCLUSIVE
// return index: Int
//
func binarySearch(arr: inout [Int], low: Int, high: Int) -> Int {
    if high >= low {
        let mid = low + (high - low) / 2
        if arr[mid] >= 0 {
            return binarySearch(arr: &arr, low: low, high: mid - 1)
        }
        return binarySearch(arr: &arr, low: mid + 1, high: high)
    }
    return high
}
