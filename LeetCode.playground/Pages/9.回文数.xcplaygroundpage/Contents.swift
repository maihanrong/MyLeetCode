//: [Previous](@previous)

import Foundation

/*
 9. 回文数
 给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。
 回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。例如，121 是回文，而 123 不是。
 示例 1：
 输入：x = 121
 输出：true
 
 示例 2：
 输入：x = -121
 输出：false
 解释：从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 
 示例 3：
 输入：x = 10
 输出：false
 解释：从右向左读, 为 01 。因此它不是一个回文数。
 
 示例 4：
 输入：x = -101
 输出：false
 */

func isPalindrome(_ x: Int) -> Bool {
    let s = String(x)
    // 判断首字符是不是“-”
    if s.first == "-" {
        return false
    }
    // 只有一个数字的情况
    if s.count == 1 {
        return true
    }
    // 从中间数开始，判断left == right，直到首尾，否则就不是回文数
    let sArr = Array(s)
    var left = 0, right = 0
    if sArr.count%2 == 0 { // 偶数位的情况
        left = sArr.count/2 - 1
        right = sArr.count/2
    }else { // 奇数位的情况
        left = (sArr.count-1)/2 - 1
        right = (sArr.count-1)/2 + 1
    }
    while sArr[left] == sArr[right] {
        if left == 0 && right == sArr.count-1 {
            return true
        }
        left -= 1
        right += 1
    }
    return false
}

let x = 1
isPalindrome(x)

/*
 官方思路：
 直接将整数反转，与原数进行对比，相同就是回文数
 但避免反转后的整数溢出，取一半进行反转和比较即可
 
 整数反转的思路：先除10再乘10
 reserve=x%10得到最后一位数，然后x=x/10得到剩下的数，最后reserve=reserve*10+reserve得到反转的数
 */
func isPalindrome_2(_ x: Int) -> Bool {
    if x < 0 || (x%10 == 0 && x != 0) {
        return false
    }
    var reserve = 0
    var tempX = x
    while tempX > reserve {
        reserve = reserve*10 + tempX%10
        tempX = tempX/10
    }
    return tempX == reserve || tempX == reserve/10
}

isPalindrome_2(12321)


/*
简洁的解法
 */
var s = "12345"
s.removeFirst() // return 删除的元素
s

func isPalindrome_3(_ x: Int) -> Bool {
    guard x > 0 else {
        return false
    }
    var s = String(x)
    while s.count > 1 {
        guard s.removeFirst() == s.removeLast() else {
            return false
        }
    }
    return true
}

isPalindrome_3(1233321)
