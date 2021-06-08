//: [Previous](@previous)

import Foundation

/*
 11. 盛最多水的容器
 给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。

 说明：你不能倾斜容器。

 示例 1：
 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 解释：图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
 
 示例 2：
 输入：height = [1,1]
 输出：1
 
 示例 3：
 输入：height = [4,3,2,1,4]
 输出：16
 
 示例 4：
 输入：height = [1,2,1]
 输出：2
 */

// 双循环暴力解法，依次从左到右取出两个数，求面积，最大的存下来，时间复杂度n的平方
func maxArea(_ height: [Int]) -> Int {
    var max = 0
    for i in 0..<height.count { // 从下标0开始取
        for j in (i+1)..<height.count { // 从下标i+1开始取
            let current = min(height[i], height[j]) * (j-i) // 取两数的最小值（y值）* 下标的差值（x值）
            if current > max {
                max = current
            }
        }
    }
    return max
}

let height = [1,8,6,2,5,4,8,3,7]
maxArea(height)

let height2 = [4,3,2,1,4]
maxArea(height2)

// 官方思路，双指针法，时间复杂度为n
func maxArea_2(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count-1
    var maxResult = 0
    while left != right { // 左右指针相等，退出循环
        maxResult = max(maxResult, (right-left)*min(height[left], height[right])) // 当前的面积和最大面积比较
        if height[left] < height[right] { // 移动值小的指针
            left += 1
        }else {
            right -= 1
        }
    }
    return maxResult
}

maxArea_2(height)
maxArea_2(height2)
