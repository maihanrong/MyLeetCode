import UIKit

// 1.两数之和
//输入：nums = [2,7,11,15], target = 9
//输出：[0,1]
//解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for (i, value_i) in nums.enumerated() {
        for j in i+1...nums.count-1 {
            if value_i + nums[j] == target {
                return [i, j]
            }
        }
    }
    return []
}

let nums = [2,7,11,15], target = 9
twoSum(nums, target)

func twoSum_2(_ nums: [Int], _ target: Int) -> [Int] {
    var set = Set<Int>()
    for (i, value) in nums.enumerated() {
        let result = target - value
        if set.contains(result) {
            let index = nums.firstIndex(of: result)!
            return [i, index]
        }
        set.insert(value)
    }
    return []
}

twoSum_2(nums, target)
