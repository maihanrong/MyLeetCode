//: [Previous](@previous)

import Foundation

/*
 给你一个字符串 s 和一个字符规律 p，请你来实现一个支持 '.' 和 '*' 的正则表达式匹配。

 '.' 匹配任意单个字符
 '*' 匹配零个或多个前面的那一个元素
 所谓匹配，是要涵盖 整个 字符串 s的，而不是部分字符串。
 
 示例 1：
 输入：s = "aa" p = "a"
 输出：false
 解释："a" 无法匹配 "aa" 整个字符串。
 
 示例 2:
 输入：s = "aa" p = "a*"
 输出：true
 解释：因为 '*' 代表可以匹配零个或多个前面的那一个元素, 在这里前面的元素就是 'a'。因此，字符串 "aa" 可被视为 'a' 重复了一次。
 
 示例 3：
 输入：s = "ab" p = ".*"
 输出：true
 解释：".*" 表示可匹配零个或多个（'*'）任意字符（'.'）。
 
 示例 4：
 输入：s = "aab" p = "c*a*b"
 输出：true
 解释：因为 '*' 表示零个或多个，这里 'c' 为 0 个, 'a' 被重复一次。因此可以匹配字符串 "aab"。
 
 示例 5：
 输入：s = "mississippi" p = "mis*is*p*."
 输出：false
 */

/*
利用递归的思想，将一个长串分解至最后的一两个字符。
递归思想为：
如果有*在字符串第二个位置，则分别判断(s,p[2..<end])和(s[1..<end],p)有一个能匹配，则表明当前这个串是匹配的。
如果没有*，s,p同时向后移动。

递归出口为：
p为空，s为空则匹配，s不空则不匹配
 
Ps：太难了，看答案都要看很久
*/

func isMatch(_ s: String, _ p: String) -> Bool {
    if p.isEmpty { // p为空，s为空则匹配，退出递归
        return s.isEmpty
    }
    let secondIndexP = p.index(p.startIndex, offsetBy: 1)
    let isFirstMatch = s.first == p.first || p.first == "."
    if p.count >= 2 && p[secondIndexP] == "*" { // 第二个字符是*的情况，s与p[2..<end],s[1..<end]与p是否匹配
        return isMatch(s, String(p[p.index(p.startIndex, offsetBy: 2)..<p.endIndex])) || (isFirstMatch && !s.isEmpty && isMatch(String(s[s.index(s.startIndex, offsetBy: 1)..<s.endIndex]), p))
    }else { // 从左到右依次匹配每个字符
        return isFirstMatch && !s.isEmpty && isMatch(String(s[s.index(s.startIndex, offsetBy: 1)..<s.endIndex]), String(p[p.index(p.startIndex, offsetBy: 1)..<p.endIndex]))
    }
}

let s = "aab", p = "c*a*b"
let s2 = "ab", p2 = ".*"
isMatch(s, p)
isMatch(s2, p2)
