//: [Previous](@previous)

import Foundation

/*
 33.搜索旋转排序数组
 
 整数数组 nums 按升序排列，数组中的值 互不相同 。
 在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。
 给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。

 示例 1：
 输入：nums = [4,5,6,7,0,1,2], target = 0
 输出：4
 
 示例 2：
 输入：nums = [4,5,6,7,0,1,2], target = 3
 输出：-1
 
 示例 3：
 输入：nums = [1], target = 0
 输出：-1

 提示：
 1 <= nums.length <= 5000
 -10^4 <= nums[i] <= 10^4
 nums 中的每个值都 独一无二
 题目数据保证 nums 在预先未知的某个下标上进行了旋转
 */

/*
 思路：二分法，二分后必定有一半为有序数组，根据target是否在有序数组里进行左右下标的缩进，每次循环缩进一半而且判断左右有序是互斥的，target会在有序数组里找出来，时间复杂度logn
 */
func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0 // 左右下标，确定左边还是右边缩进一半
    var right = nums.count-1
    while left <= right {
        let mid = (left + right)/2
        if target == nums[mid] {
            return mid
        }
        if nums[left] <= nums[mid] { // 左边为有序数组
            if nums[left] <= target && target < nums[mid] { // target在左边，右边缩进一半进行搜索
                right = mid - 1
            }else { // target在右边，左边缩进一半
                left = mid + 1
            }
        }else { // 右边为有序数组
            if nums[mid] < target && target <= nums[right] {
                left = mid + 1
            }else {
                right = mid - 1
            }
        }
    }
    return -1
}

let nums = [4,5,6,7,0,1,2], target = 0
search(nums, target)
