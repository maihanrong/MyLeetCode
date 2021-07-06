//: [Previous](@previous)

import Foundation

/*
 31.下一个排列
 实现获取 下一个排列 的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
 必须 原地 修改，只允许使用额外常数空间。
 
 示例 1：
 输入：nums = [1,2,3]
 输出：[1,3,2]
 
 示例 2：
 输入：nums = [3,2,1]
 输出：[1,2,3]
 
 示例 3：
 输入：nums = [1,1,5]
 输出：[1,5,1]
 
 示例 4：
 输入：nums = [1]
 输出：[1]
 
 1 <= nums.length <= 100
 0 <= nums[i] <= 100
 */

/*
 官方思路：
 1.首先从后向前查找第一个顺序对 (i,i+1)，满足 a[i] < a[i+1]。这样「较小数」即为 a[i]。此时 [i+1,n) 必然是下降序列。
 2.如果找到了顺序对，那么在区间 [i+1,n) 中从后向前查找第一个元素 j 满足 a[i] < a[j]。这样「较大数」即为 a[j]。
 3.交换 a[i] 与 a[j]，此时可以证明区间 [i+1,n) 必为降序。我们可以直接使用双指针反转区间 [i+1,n) 使其变为升序，而无需对该区间进行排序。
 */
func nextPermutation(_ nums: inout [Int]) {
    var i = nums.count-2 // -2方便获取下标值
    while i >= 0 { // 找较小数
        if nums[i] < nums[i+1] {
            break
        }
        i -= 1
    }
    if i == -1 { // 说明原数组是降序数组
        nums.reverse()
        return
    }else {
        var j = nums.count-1
        while j > i { // 找较大数
            if nums[j] > nums[i] {
                nums.swapAt(i, j)
                break
            }
            j -= 1
        }
    }
    nums[i+1..<nums.count].sort(by: <) // 对交换后的数组进行升序，以获得较大的下一个数
}

var nums = [1,3,2]
nextPermutation(&nums)

var nums2 = [3,2,1]
nextPermutation(&nums2)

