//: [Previous](@previous)

import Foundation

/*
 38.外观数列
 
 给定一个正整数 n ，输出外观数列的第 n 项。
 「外观数列」是一个整数序列，从数字 1 开始，序列中的每一项都是对前一项的描述。
 你可以将其视作是由递归公式定义的数字字符串序列：
 countAndSay(1) = "1"
 countAndSay(n) 是对 countAndSay(n-1) 的描述，然后转换成另一个数字字符串。
 
 前五项如下：
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 第一项是数字 1
 描述前一项，这个数是 1 即 “ 一 个 1 ”，记作 "11"
 描述前一项，这个数是 11 即 “ 二 个 1 ” ，记作 "21"
 描述前一项，这个数是 21 即 “ 一 个 2 + 一 个 1 ” ，记作 "1211"
 描述前一项，这个数是 1211 即 “ 一 个 1 + 一 个 2 + 二 个 1 ” ，记作 "111221"

 示例 1：
 输入：n = 1
 输出："1"
 解释：这是一个基本样例。
 
 示例 2：
 输入：n = 4
 输出："1211"
 解释：
 countAndSay(1) = "1"
 countAndSay(2) = 读 "1" = 一 个 1 = "11"
 countAndSay(3) = 读 "11" = 二 个 1 = "21"
 countAndSay(4) = 读 "21" = 一 个 2 + 一 个 1 = "12" + "11" = "1211"

 提示：
 1 <= n <= 30
 */

/*
 思路：双指针法，从前向后找出第一个不同的数字，转成外观数列，以此类推，要找到第n项的外观数列，需要知道n-1项的外观数列
 */
func countAndSay(_ n: Int) -> String {
    var cur = "1" // 用来保存当前的字符串，=n时结束
    var pre = "" // 前一项字符串
    for _ in 1..<n { // 第一遍遍历找n-1项
        pre = cur // 把当前项赋值给前一项
        cur = ""
        var start = 0 // 双指针保存开始和结束的位置
        var end = 0
        while end < pre.count { // 第二遍遍历输出第n项
            let startIndex = pre.index(pre.startIndex, offsetBy: start) // 找到与开始不同的字符
            while end < pre.count && pre[startIndex] == pre[pre.index(pre.startIndex, offsetBy: end)] {
                end += 1
            }
            cur += "\(end-start)\(pre[startIndex])"
            start = end
        }
    }
    return cur
}

countAndSay(4)
countAndSay(1)
