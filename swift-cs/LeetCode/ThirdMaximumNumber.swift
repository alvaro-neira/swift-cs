//
//  ThirdMaximumNumber.swift
//  swift-cs
//
//  Created by Alvaro Neira on 26-01-25.
//

//Given an integer array nums, return the third distinct maximum number in this array. If the third maximum does not exist, return the maximum number.
//
//
//
//Example 1:
//
//Input: nums = [3,2,1]
//Output: 1
//Explanation:
//The first distinct maximum is 3.
//The second distinct maximum is 2.
//The third distinct maximum is 1.
//Example 2:
//
//Input: nums = [1,2]
//Output: 2
//Explanation:
//The first distinct maximum is 2.
//The second distinct maximum is 1.
//The third distinct maximum does not exist, so the maximum (2) is returned instead.
//Example 3:
//
//Input: nums = [2,2,3,1]
//Output: 1
//Explanation:
//The first distinct maximum is 3.
//The second distinct maximum is 2 (both 2's are counted together since they have the same value).
//The third distinct maximum is 1.
//
//
//Constraints:
//
//1 <= nums.length <= 104
//-231 <= nums[i] <= 231 - 1
//
//
//Follow up: Can you find an O(n) solution?

func thirdMax(_ nums: [Int]) -> Int {
    let n = nums.count
    let k = 3
    let maxHeap = HeapArray(initialCapacity: n)
    var hmSet: Set<Int> = Set()
    for i in 0..<n {
        if !hmSet.contains(nums[i]) {
            maxHeap.add(nums[i])
            hmSet.insert(nums[i])
        }
    }
    if maxHeap.getLength() < k {
        return maxHeap.peek()!
    }
    for _ in 0..<k - 1 {
        maxHeap.pop()
    }
    return maxHeap.pop()!
}

func thirdMax1(_ nums: [Int]) -> Int {
    let n = nums.count
    var max1 = nums[0]
    var secondMax: Int? = nil
    var thirdMax: Int? = nil
    for i in 1..<n {
        max1 = max(max1, nums[i])
        if let max2 = secondMax {
            if nums[i] > max2 && nums[i] < max1 {
                secondMax = nums[i]
            }
            if let max3 = thirdMax {
                if nums[i] > max3 && nums[i] < max2 {
                    thirdMax = nums[i]
                }
            } else {
                if nums[i] < max2 {
                    thirdMax = nums[i]
                }
            }
        } else {
            if nums[i] < max1 {
                secondMax = nums[i]
            }
        }
    }
    if let max3 = thirdMax {
        return max3
    } else {
        return max1
    }
}
