//: [Previous](@previous)

import Foundation

/*
 35.搜索插入位置
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
 你可以假设数组中无重复元素。

 示例 1:
 输入: [1,3,5,6], 5
 输出: 2
 
 示例 2:
 输入: [1,3,5,6], 2
 输出: 1
 
 示例 3:
 输入: [1,3,5,6], 7
 输出: 4
 
 示例 4:
 输入: [1,3,5,6], 0
 输出: 0
 */

/*
 二分法，找到第一个大于等于target的值的下标
 */
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 {
        return 0
    }
    if nums.first! >= target {
        return 0
    }
    if nums.last! < target {
        return nums.count
    }
    var left = 0
    var right = nums.count-1
    while left <= right {
        let mid = (left + right)/2
        if nums[mid] == target {
            return mid
        }
        if nums[mid] < target {
            left = mid + 1
            if nums[left] >= target {
                return left
            }
        }else {
            right = mid - 1
            if nums[right] < target {
                return mid
            }
        }
    }
    return 0
}

/*
简洁的写法
 */
func searchInsert_3(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count-1
    var mid = 0
    while left <= right {
        mid = (left + right)/2
        if nums[mid] < target {
            left = mid + 1
        }else if nums[mid] > target {
            right = mid - 1
        }else {
            return mid
        }
    }
    return nums[mid] > target ? mid : (mid + 1)
}

/*
 暴力解法，一次循环
 */
func searchInsert_2(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 {
        return 0
    }
    if nums.first! >= target {
        return 0
    }
    if nums.last! < target {
        return nums.count
    }
    for (index, element) in nums.enumerated() {
        if element >= target {
            return index
        }
    }
    return 0
}

searchInsert([1,3,5,6], 5)
searchInsert_3([1,3,5,6], 2)
searchInsert([1,3,5,6], 7)
