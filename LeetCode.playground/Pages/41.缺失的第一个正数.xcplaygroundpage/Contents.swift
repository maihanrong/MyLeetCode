//: [Previous](@previous)

import Foundation

/*
 41.缺失的第一个正数
 给你一个未排序的整数数组 nums ，请你找出其中没有出现的最小的正整数。
 请你实现时间复杂度为 O(n) 并且只使用常数级别额外空间的解决方案。
 
 示例 1：
 输入：nums = [1,2,0]
 输出：3
 
 示例 2：
 输入：nums = [3,4,-1,1]
 输出：2
 
 示例 3：
 输入：nums = [7,8,9,11,12]
 输出：1
 */

/*
 官方思路：常量的空间复杂度 -> 哈希表
 1.将数组中负数的值改为N+1，N为数组长度，因为最终的结果是在1...N+1的区间内
 2.将<N的值作为下标，在数组对应的位置的值设置为负数
 3.遍历1...N，数组中第一个正数的下标就是缺失的
 
 做困难的题真的要考虑一波时间成本🐶
 */
func firstMissingPositive(_ nums: [Int]) -> Int {
    var nums = nums
    let lenght = nums.count
    for i in 0..<lenght { // 第一遍遍历把数组改为非负数组
        if nums[i] <= 0 {
            nums[i] = lenght+1
        }
    }
    for i in 0..<lenght { // 第二遍遍历把数组中出现的值作为下标，设置下标对应的值为负数
        let num = abs(nums[i])
        if num > 0 && num <= lenght {
            nums[num-1] = -abs(nums[num-1])
        }
    }
    for i in 0..<lenght { // 第三遍遍历取第一个正数值的下标
        if nums[i] > 0 {
            return i + 1
        }
    }
    return lenght+1
}

firstMissingPositive([1])
firstMissingPositive([3,4,-1,1])
firstMissingPositive([7,8,9,11,12])
