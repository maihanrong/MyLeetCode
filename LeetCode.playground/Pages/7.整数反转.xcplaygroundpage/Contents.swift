//: [Previous](@previous)

import Foundation

/*
 7.整数反转
 给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。
 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。
 假设环境不允许存储 64 位整数（有符号或无符号）。
 
 示例 1：
 输入：x = 123
 输出：321
 
 示例 2：
 输入：x = -123
 输出：-321
 
 示例 3：
 输入：x = 120
 输出：21
 
 示例 4：
 输入：x = 0
 输出：0
 */

func reverse(_ x: Int) -> Int {
    var tempx = x
    var result = 0
    // x=0时退出循环
    while tempx != 0 {
        // 对10取余得到最后一位数
        let lastInt = tempx%10 // 3 2 1
        // 对10取商得到剩下的数
        tempx = tempx/10 // 12 1 0
        result = result*10+lastInt //3 32 321
    }
    if result > Int32.max || result < Int32.min {
        return 0
    }
    return result
}

let x = -123
reverse(x)

