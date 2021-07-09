//: [Previous](@previous)

import Foundation

/*
 32.最长有效括号
 给你一个只包含 '(' 和 ')' 的字符串，找出最长有效（格式正确且连续）括号子串的长度。
 
 示例 1：
 输入：s = "(()"
 输出：2
 解释：最长有效括号子串是 "()"
 
 示例 2：
 输入：s = ")()())"
 输出：4
 解释：最长有效括号子串是 "()()"
 
 示例 3：
 输入：s = ""
 输出：0
 
 提示：
 0 <= s.length <= 3 * 104
 s[i] 为 '(' 或 ')'
 */

/*
 思路：用栈来解决，由于要求返回的是有效括号的长度，所以下标入栈比较好计算
 遇到左括号下标入栈，右括号下标出栈，为方便统计计算，【确保栈底是最后一个没有被匹配的右括号下标】，也就是长度从当前右括号开始计算
 开始的时候防止第一个是左括号，需要填入一个-1的下标开始算
 */
func longestValidParentheses(_ s: String) -> Int {
    var lenght = 0
    var maxLenght = 0
    var stack = [Int]()
    stack.append(-1)
    for (index, char) in s.enumerated() {
        if char == "(" {
            stack.append(index)
        }else {
            stack.removeLast()
            if stack.count == 0 { // 栈为空，就把当前右括号加入栈底,【确保栈底是最后一个没有被匹配的右括号下标】
                stack.append(index)
            }else { // 用下标计算有效括号的长度
                lenght = index - stack.last!
                maxLenght = max(lenght, maxLenght)
            }
        }
    }
    return maxLenght
}

longestValidParentheses(")(()())")

