//
//  main.swift
//  swift-cs
//
//  Created by Alvaro Neira on 25-01-25.
//

import Foundation

print("Hello, World!")

func sortedSquares(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var result = [Int](repeating: 0, count: n)
    var left = 0
    var right = n - 1

    for i in stride(from: n - 1, through: 0, by: -1) {
        var square: Int
        if abs(nums[left]) < abs(nums[right]) {
            square = nums[right]
            right -= 1
        } else {
            square = nums[left]
            left += 1
        }
        result[i] = square * square
    }
    return result
}

sortedSquares([-4, -1, 0, 3, 10])

func duplicateZeros(_ arr: inout [Int]) {
    arr.insert(0, at: 0)
    arr.removeLast()
}

func removeDuplicates(_ nums: inout [Int]) -> Int {
    let n = nums.count
    if n == 0 {
        return 0
    }
    var last = nums[0]
    var left = 1
    var right = n - 1
    while left <= right {
        if nums[left] == last {
            nums.swapAt(left, left + 1)
            right -= 1
        } else if nums[left] < last {
            nums.swapAt(left, left + 1)
        } else {
            last = nums[left]
            left += 1
        }
    }
    return right + 1
}
var arr1: [Int] = [0,0,1,1,1,2,2,3,3,4]

removeDuplicates(&arr1)

