//: [Previous](@previous)

import Foundation

/*
 43.字符串相乘
 给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。

 示例 1:
 输入: num1 = "2", num2 = "3"
 输出: "6"
 
 示例 2:
 输入: num1 = "123", num2 = "456"
 输出: "56088"
 说明：

 num1 和 num2 的长度小于110。
 num1 和 num2 只包含数字 0-9。
 num1 和 num2 均不以零开头，除非是数字 0 本身。
 不能使用任何标准库的大数类型（比如 BigInteger）或直接将输入转换为整数来处理。
 */

/*
 思路：用两个数组保存两个字符串，由低位到高位，便利两组数组，依次得到每一位对应的乘值
 一个数组保存相乘的结果，数组大小是n1.length+n2.length，通过取余和取模得到当前的数和要进位的数
 */
func multiply(_ num1: String, _ num2: String) -> String {
    guard num1 != "0" && num2 != "0" else {
        return "0"
    }
    let n1count = num1.count
    let n2count = num2.count
    let n1Arr = Array(num1.reversed()).map{ Int(String($0))! } // 通过字符串创建整形数组
    let n2Arr = Array(num2.reversed()).map{ Int(String($0))! }
    var result = Array(repeating: 0, count: n1count+n2count)
    for (i, n) in n1Arr.enumerated() {
        for (j, m) in n2Arr.enumerated() {
            let index = i + j // 乘积的下标
            let s = n * m + result[index] // 当前下标的乘积 + 之前的值
            result[index] = s % 10 // 当前数
            result[index+1] += s / 10 // 进位数 + 之前的值
        }
    }
    while result.last == 0 { // 去掉最高位是0的数
        result.removeLast()
    }
    return result.reversed().map{ String($0) }.joined()
}

let num1 = "123", num2 = "456"
multiply(num1, num2)
