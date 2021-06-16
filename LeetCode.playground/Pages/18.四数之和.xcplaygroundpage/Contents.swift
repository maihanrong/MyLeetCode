//: [Previous](@previous)

import Foundation

/*
 18.四数之和
 给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。
 注意：答案中不可以包含重复的四元组。
 示例 1：
 输入：nums = [1,0,-1,0,-2,2], target = 0
 输出：[[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
 
 示例 2：
 输入：nums = [], target = 0
 输出：[]
 */

/*
 排序+双指针法：两层循环确定前两个数，双指针确定最后两个数
 */
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.count < 4 {
        return []
    }
    var result = [[Int]]()
    let numArr = nums.sorted(by: <)
    for i in 0..<numArr.count-3 {
        if i > 0 && numArr[i] == numArr[i-1] { // 跳过相同的数字
            continue
        }
        if numArr[i]+numArr[i+1]+numArr[i+2]+numArr[i+3] > target { // 判断边界，快速跳出循环
            break
        }
        if numArr[i]+numArr[numArr.count-1]+numArr[numArr.count-2]+numArr[numArr.count-3] < target {
            continue
        }
        for j in i+1..<numArr.count-2 {
            if j>i+1 && numArr[j] == numArr[j-1] {
                continue
            }
            if numArr[i]+numArr[j]+numArr[j+1]+numArr[j+2] > target {
                break
            }
            if numArr[i]+numArr[j]+numArr[numArr.count-1]+numArr[numArr.count-2] < target {
                continue
            }
            var left = j+1
            var right = numArr.count-1
            while left < right {
                if numArr[i]+numArr[j]+numArr[left]+numArr[right] == target {
                    result.append([numArr[i],numArr[j],numArr[left],numArr[right]])
                    while left < right && numArr[left] == numArr[left+1] { // 跳过相同的数字
                        left += 1
                    }
                    while left < right && numArr[right] == numArr[right-1] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                }else if numArr[i]+numArr[j]+numArr[left]+numArr[right] > target {
                    right -= 1
                }else {
                    left += 1
                }
            }
        }
    }
    return result
}

/*
 对数组排序后，暴力四循环，一层循环找到一个数
 */
func fourSum_2(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.count < 4 {
        return []
    }
    var result = [[Int]]()
    let numArr = nums.sorted(by: <)
    for i in 0..<numArr.count-3 {
        if i > 0 && numArr[i] == numArr[i-1] { // 跳过相同的数
            continue
        }
        for j in i+1..<numArr.count-2 {
            if j > i+1 && numArr[j] == numArr[j-1] { // 跳过相同的数
                continue
            }
            for k in j+1..<numArr.count-1 {
                if k > j+1 && numArr[k] == numArr[k-1] { // 跳过相同的数
                    continue
                }
                for l in k+1..<numArr.count {
                    if l > k+1 && numArr[l] == numArr[l-1] { // 跳过相同的数
                        continue
                    }
                    if numArr[i]+numArr[j]+numArr[k]+numArr[l] == target {
                        result.append([numArr[i],numArr[j],numArr[k],numArr[l]])
                    }
                }
            }
        }
    }
    return result
}

let nums = [1,0,-1,0,-2,2], target = 0
fourSum(nums, target)

fourSum([2,2,2,2,2], 8)
fourSum([-2,-1,-1,1,1,2,2], 0)
