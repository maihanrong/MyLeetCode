//: [Previous](@previous)

import Foundation

/*
 34.在排序数组中查找元素的第一个和最后一个位置
 
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
 如果数组中不存在目标值 target，返回 [-1, -1]。

 进阶：
 你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？

 示例 1：
 输入：nums = [5,7,7,8,8,10], target = 8
 输出：[3,4]
 
 示例 2：
 输入：nums = [5,7,7,8,8,10], target = 6
 输出：[-1,-1]
 
 示例 3：
 输入：nums = [], target = 0
 输出：[-1,-1]
  
 提示：
 0 <= nums.length <= 105
 */

/*
 官方思路：二分查找
 二分查找中，寻找 leftIdx 即为在数组中寻找第一个大于等于 target 的下标，寻找 rightIdx 即为在数组中寻找第一个大于 target 的下标，然后将下标减一。
 */
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count == 0 {
        return [-1, -1]
    }
    let left = binarySearch(nums, target, true)
    let right = binarySearch(nums, target, false) - 1
    if left <= right && right < nums.count && nums[left] == target && nums[right] == target {
        return [left, right]
    }
    return [-1, -1]
}

func binarySearch(_ nums: [Int], _ target: Int, _ isLeft: Bool) -> Int {
    var left = 0
    var right = nums.count-1
    var result = nums.count
    while left <= right {
        let mid = (left + right)/2
        if (isLeft && nums[mid] >= target) || nums[mid] > target { // 查找leftIdx || rightIdx
            right = mid - 1
            result = mid
        }else {
            left = mid + 1
        }
    }
    return result
}

/*
 不完全二分查找🐶
 */
func searchRange_2(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.count == 0 {
        return [-1, -1]
    }
    var left = 0
    var right = nums.count - 1
    while left <= right { // 二分查找
        let mid = (left + right)/2
        if nums[mid] == target {
            left = mid
            right = mid
            while left > 0 && nums[left] == nums[left-1] { // 左右扩散依次查找🐶
                left -= 1
            }
            while right < nums.count-1 && nums[right] == nums[right+1] {
                right += 1
            }
            return [left, right]
        }
        if nums[mid] > target {
            right = mid - 1
        }else {
            left = mid + 1
        }
    }
    return [-1, -1]
}

let nums = [5,7,7,8,8,10], target = 8
searchRange(nums, target)

searchRange([1], 1)
searchRange_2([1], 1)
