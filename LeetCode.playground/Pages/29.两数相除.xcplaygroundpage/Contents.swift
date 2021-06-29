//: [Previous](@previous)

import Foundation

/*
 29.两数相除
 给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。
 返回被除数 dividend 除以除数 divisor 得到的商。
 整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2
 
 示例 1:
 输入: dividend = 10, divisor = 3
 输出: 3
 解释: 10/3 = truncate(3.33333..) = truncate(3) = 3
 
 示例 2:
 输入: dividend = 7, divisor = -3
 输出: -2
 解释: 7/-3 = truncate(-2.33333..) = -2
 
 提示：
 被除数和除数均为 32 位有符号整数。
 除数不为 0。
 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231,  231 − 1]。本题中，如果除法结果溢出，则返回 231 − 1。
 */

/*
 思路：二分+递归，二分拆解被除数，直到被除数小于除数返回递归结果
 */
func divide(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == 0 {
        return 0
    }
    if divisor == 1 {
        return dividend
    }
    if divisor == -1 {
        if dividend > Int(Int32.min) {
            return -dividend
        }
        return Int(Int32.max)
    }
    // 先确定符号，再统一取正号去求商
    let sign = (dividend > 0 && divisor > 0) || (dividend < 0 && divisor < 0)
    let x = dividend > 0 ? dividend : -dividend
    let y = divisor > 0 ? divisor : -divisor
    let result = div(x: x, y: y)
    return sign ? result : -result
}

/*
 1.找整个递归的终止条件：递归应该在什么时候结束？下个节点或者下下个节点为空
 2.找返回值：应该给上一级返回什么信息？处理好交换值的链表
 3.本级递归应该做什么：在这一级递归中，应该完成什么任务？交换两个节点，让头节点指向下个递归返回的链表
 */

/*
 大神总结： 60/8 = (60-32)/8 + 4 = (60-32-16)/8 + 2 + 4 = 1 + 2 + 4 = 7
 */
func div(x: Int, y: Int) -> Int {
    if x < y {
        return 0
    }
    var result = 1 // 来到这里商最小都是1
    var temp_y = y
    while temp_y + temp_y < x {
        result += result
        temp_y += temp_y
    }
    let temp_x = x - temp_y // 整除后剩下的被除数
    return result + div(x: temp_x, y: y)
}



let dividend = 10, divisor = 3
divide(dividend, divisor)

