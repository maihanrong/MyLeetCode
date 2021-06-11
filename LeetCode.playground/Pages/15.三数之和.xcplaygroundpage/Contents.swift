//: [Previous](@previous)

import Foundation

/*
 15.三数之和
 
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
 注意：答案中不可以包含重复的三元组。
 
 示例 1：
 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 
 示例 2：
 输入：nums = []
 输出：[]
 
 示例 3：
 输入：nums = [0]
 输出：[]
 */

/*
 排序+双指针法思路：
 
 1.对数组进行排序。
 2.遍历排序后数组，若 nums[i]>0：因为已经排序好，所以后面不可能有三个数加和等于0，直接返回结果。
 对于重复元素：跳过，避免出现重复解
 3.令左指针 L=i+1，右指针 R=n-1，当 L<R 时，执行循环：
 当 nums[i]+nums[L]+nums[R]==0，执行循环，判断左界和右界是否和下一位置重复，去除重复解。并同时将 L,R 移到下一位置，寻找新的解
 若和大于 0，说明 nums[R]太大，R 左移
 若和小于 0，说明 nums[L] 太小，L 右移
 */

func threeSum(_ nums: [Int]) -> [[Int]] {
    if nums.count < 3 {
        return []
    }
    var result = Array<[Int]>()
    let numArr = nums.sorted(by: <)
    for i in 0..<numArr.count {
        if numArr[i] > 0 { // 已排序的数组num[i]>0,说明后面的数之和一直都是大于0
            return result
        }
        if i>0 && numArr[i] == numArr[i-1] { // 跳过重复的数字和排除i=0的情况
            continue
        }
        // 双指针
        var left = i+1
        var right = numArr.count-1
        while left < right { // 左右相等退出循环
            if numArr[i] + numArr[left] + numArr[right] == 0 {
                result.append([numArr[i], numArr[left], numArr[right]])
                while left < right && numArr[left] == numArr[left+1] { // 跳过重复的数字
                    left += 1
                }
                while left < right && numArr[right] == numArr[right-1] {
                    right -= 1
                }
                left += 1 // 左右同时调整一位继续查找
                right -= 1
            }else if numArr[i] + numArr[left] + numArr[right] > 0 { // num[i]固定，三数之和大于0优先调整右指针
                right -= 1
            }else {
                left += 1
            }
        }
    }
    return result
}

let nums = [-1,0,1,2,-1,-4]
threeSum(nums)

threeSum([])

