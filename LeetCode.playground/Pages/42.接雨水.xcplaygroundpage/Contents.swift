//: [Previous](@previous)

import Foundation

/*
 42.接雨水
 
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
 示例 1：
 输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
 输出：6
 解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。
 
 示例 2：
 输入：height = [4,2,0,3,2,5]
 输出：9
 */

/*
 最直接的思路：每个位置的储水量 = min(maxleft, maxright) - height[i]
 提交超时了😂时间复杂度为O(n2)
 换一种说法就是超时都检测不出错误，说明没错误🐶
 */
func trap(_ height: [Int]) -> Int {
    if height.count <= 2 {
        return 0
    }
    var result = 0
    for i in 1..<height.count-1 {
        var maxleft = 0
        var maxright = 0
        for j in 0...i {
            maxleft = max(maxleft, height[j])
        }
        for j in i..<height.count {
            maxright = max(maxright, height[j])
        }
        result += min(maxleft, maxright) - height[i]
    }
    return result
}

let height = [0,1,0,2,1,0,1,3,2,1,2,1]
//trap(height)
//
//trap([4,2,0,3,2,5])


/*
 动态规划
 定义两个数组，分别保存每个位置到左边和右边的最大值，然后计算每个位置的储水量
 时间复杂度为O(n)
 */
func trap_2(_ height: [Int]) -> Int {
    if height.count <= 2 {
        return 0
    }
    var maxLeftArr = [Int](repeating: 0, count: height.count)
    var maxRightArr = [Int](repeating: 0, count: height.count)
    maxLeftArr[0] = height[0]
    var result = 0
    for i in 1..<height.count {
        maxLeftArr[i] = max(height[i], maxLeftArr[i-1])
    }
    maxRightArr[height.count-1] = height.last!
    for i in stride(from: height.count-2, through: 0, by: -1) {
        maxRightArr[i] = max(height[i], maxRightArr[i+1])
    }
    for i in 0..<height.count {
        result += min(maxLeftArr[i], maxRightArr[i]) - height[i]
    }
    return result
}

trap_2(height)
