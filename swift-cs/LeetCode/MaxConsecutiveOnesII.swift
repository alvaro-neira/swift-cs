//
//  MaxConsecutiveOnesII.swift
//  swift-cs
//
//  Created by Alvaro Neira on 26-01-25.
//

//Given a binary array nums, return the maximum number of consecutive 1's in the array if you can flip at most one 0.
//
//
//
//Example 1:
//
//Input: nums = [1,0,1,1,0]
//Output: 4
//Explanation:
//- If we flip the first zero, nums becomes [1,1,1,1,0] and we have 4 consecutive ones.
//- If we flip the second zero, nums becomes [1,0,1,1,1] and we have 3 consecutive ones.
//The max number of consecutive ones is 4.
//Example 2:
//
//Input: nums = [1,0,1,1,0,1]
//Output: 4
//Explanation:
//- If we flip the first zero, nums becomes [1,1,1,1,0,1] and we have 4 consecutive ones.
//- If we flip the second zero, nums becomes [1,0,1,1,1,1] and we have 4 consecutive ones.
//The max number of consecutive ones is 4.
//
//
//Constraints:
//
//1 <= nums.length <= 105
//nums[i] is either 0 or 1.
//
//
//Follow up: What if the input numbers come in one by one as an infinite stream? In other words, you can't store all numbers coming from the stream as it's too large to hold in memory. Could you solve it efficiently?

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    let n = nums.count
    var longestSequence = 0
    var left = 0
    var right = 0
    var numZeroes = 0

    // While our window is in bounds
    while right < n {

        // Increase numZeroes if the rightmost element is 0
        if nums[right] == 0 {
            numZeroes += 1
        }

        //If our window is invalid, contract our window
        while numZeroes == 2 {
            if nums[left] == 0 {
                numZeroes -= 1
            }
            left += 1
        }

        // Update our longest sequence answer
        longestSequence = max(longestSequence, right - left + 1)

        // Expand our window
        right += 1
    }
    return longestSequence
}
