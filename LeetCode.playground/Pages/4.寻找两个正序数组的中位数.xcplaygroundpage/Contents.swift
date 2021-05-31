//: [Previous](@previous)

import Foundation

// 4. 寻找两个正序数组的中位数
// 给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。
//    示例 1：
//    输入：nums1 = [1,3], nums2 = [2]
//    输出：2.00000
//    解释：合并数组 = [1,2,3] ，中位数 2

//    示例 2：
//    输入：nums1 = [1,2], nums2 = [3,4]
//    输出：2.50000
//    解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let mergeArr = (nums1 + nums2).sorted(by: <)
    var index = 0
    if mergeArr.count%2 == 0 {
        index = mergeArr.count/2
        return (Double)(mergeArr[index] + mergeArr[index-1])/2
    }else {
        index = (mergeArr.count-1)/2
        return (Double)(mergeArr[index])
    }
}

let num1 = [1, 2, 3], num2 = [4, 5]
findMedianSortedArrays(num1, num2)
