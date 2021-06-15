//: [Previous](@previous)

import Foundation

/*
 16.最接近的三数之和
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。
 找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
 
 示例：
 输入：nums = [-1,2,1,-4], target = 1
 输出：2
 解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。
 */

/*
 思路：基本找三个数是要三个for循环的，时间复杂度为n3，用双指针法可以优化为n2，即左右指针
 */
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    if nums.count <= 3 {
        return nums.reduce(0, +)
    }
    let numArr = nums.sorted(by: <) // 排序数组
    var left = 1
    var right = numArr.count-1
    var result = numArr[0] + numArr[left] + numArr[right]
    for i in 0..<numArr.count {
        if i > 0 && numArr[i] == numArr[i - 1] { // 外循环跳过相同的数字
            continue
        }
        left = i + 1
        right = numArr.count - 1
        while left < right {
            let sum = numArr[i] + numArr[left] + numArr[right]
            if sum == target {
                return sum
            }
            if abs(sum - target) < abs(result - target)  { // 保存最接近的值
                result = sum
            }
            if sum > target { // 判断移动左或者右指针
                right -= 1
            }else {
                left += 1
            }
        }
    }
    return result
}

let nums = [-1,2,1,-4], target = 1
threeSumClosest(nums, target)

/*
 解法二：暴力三循环
 */
func threeSumClosest_2(_ nums: [Int], _ target: Int) -> Int {
    if nums.count <= 3 {
        return nums.reduce(0, +)
    }
    let numArr = nums.sorted(by: <)
    var result = numArr[0]+numArr[1]+numArr[2]
    var sum = 0
    for i in 0..<numArr.count-2 {
        if i>0 && numArr[i] == numArr[i-1] {
            continue
        }
        for j in i+1..<numArr.count-1 {
            for k in j+1..<numArr.count {
                sum = numArr[i] + numArr[j] + numArr[k]
                if sum == target {
                    return sum
                }
                if abs(sum-target) < abs(result-target) {
                    result = sum
                }
            }
        }
    }
    return result
}

threeSumClosest_2(nums, target)
