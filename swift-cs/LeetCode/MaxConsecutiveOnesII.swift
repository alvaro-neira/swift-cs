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
    //dp[i] = length of blob of 1's INCLUDING this digit
    var dp = [Int](repeating: 0, count: n)
    var zeroPositions = [Int]()
    var retVal = 0
    if nums[0] == 1 {
        retVal = 1
        dp[0] = 1
    } else {
        zeroPositions.append(0)
    }
    for i in 1..<n {
        if nums[i] == 0 {
            dp[i] = 0
            zeroPositions.append(i)
        } else {
            dp[i] = dp[i - 1] + 1
        }
    }
    if dp[n - 1] == n {
        return n
    }
    var dpReverse = [Int](repeating: 0, count: n)
    dpReverse[n - 1] = nums[n - 1]
    for i in stride(from: n - 2, through: 0, by: -1) {
        if nums[i] == 0 {
            dpReverse[i] = 0
        } else {
            dpReverse[i] = dpReverse[i + 1] + 1
        }
    }
    for zeroPos in zeroPositions {
        retVal = max(
            retVal,
            (zeroPos > 0 ? dp[zeroPos - 1] : 0) + 1
                + (zeroPos < n - 1 ? dpReverse[zeroPos + 1] : 0))
    }
    return retVal
}
