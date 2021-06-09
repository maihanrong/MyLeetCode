//: [Previous](@previous)

import Foundation

/*
 罗马数字包含以下七种字符： I， V， X， L，C，D 和 M。

 字符          数值
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。

 通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：

 I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
 X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。
 C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
 
 给你一个整数，将其转为罗马数字。
 示例 1:
 输入: num = 3
 输出: "III"
 
 示例 2:
 输入: num = 4
 输出: "IV"
 
 示例 3:
 输入: num = 9
 输出: "IX"
 
 示例 4:
 输入: num = 58
 输出: "LVIII"
 解释: L = 50, V = 5, III = 3.
 
 示例 5:
 输入: num = 1994
 输出: "MCMXCIV"
 解释: M = 1000, CM = 900, XC = 90, IV = 4.
 */

/*
暴力解法，直男解法，从num通过相除得到最高位开始匹配字符串，取余得到余下的数字继续匹配
把数字的情况分为 =4，=9，>5，<5这几种情况讨论
*/
func intToRoman(_ num: Int) -> String {
    if num > 3999 {
        return ""
    }
    var romanStr = ""
    var tempNum = num
    if tempNum >= 1000 {
        let n = tempNum/1000
        romanStr = romanStr + String(repeating: "M", count: n)
        tempNum = tempNum%1000
    }
    if tempNum >= 100 {
        let n = tempNum/100
        if n == 4 {
            romanStr = romanStr + "CD"
        }else if n == 9 {
            romanStr = romanStr + "CM"
        }else if n >= 5 {
            romanStr = romanStr + "D" + String(repeating: "C", count: n-5)
        }else {
            romanStr = romanStr + String(repeating: "C", count: n)
        }
        tempNum = tempNum%100
    }
    if tempNum >= 10 {
        let n = tempNum/10
        if n == 4 {
            romanStr = romanStr + "XL"
        }else if n == 9 {
            romanStr = romanStr + "XC"
        }else if n >= 5 {
            romanStr = romanStr + "L" + String(repeating: "X", count: n-5)
        }else {
            romanStr = romanStr + String(repeating: "X", count: n)
        }
        tempNum = tempNum%10
    }
    if tempNum >= 0 {
        let n = tempNum/1
        if n == 4 {
            romanStr = romanStr + "IV"
        }else if n == 9 {
            romanStr = romanStr + "IX"
        }else if n >= 5 {
            romanStr = romanStr + "V" + String(repeating: "I", count: n-5)
        }else {
            romanStr = romanStr + String(repeating: "I", count: n)
        }
    }
    return romanStr
}

let num = 1994
intToRoman(num)
intToRoman(58)


/*
 高赞思路：从大到小列出每一位数字所有可能出现的方案，匹配一个就减去相对应的值，直到num=0, 罗马数字是优先匹配最高位的
 */
func intToRoman_2(_ num: Int) -> String {
    let arr: Array<(Int, String)> = [(1000,"M"), (900,"CM"), (500,"D"), (400,"CD"), (100,"C"), (90,"XC"), (50,"L"), (40,"XL"), (10,"X"), (9,"IX"), (5,"V"), (4,"IV"), (1,"I")]
    var tempNum = num
    var result = ""
    for i in arr {
        while tempNum >= i.0 {
            result += i.1
            tempNum -= i.0
        }
    }
    return result
}

intToRoman_2(num)
