//: [Previous](@previous)

import Foundation

/*
 22.括号生成
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
 
 示例 1：
 输入：n = 3
 输出：["((()))","(()())","(())()","()(())","()()()"]
 
 示例 2：
 输入：n = 1
 输出：["()"]
 */

/*
 思路：n对括号，就是左右括号都有n个，递归得到所有符合条件的括号
 */

var result = [String]()

func generateParenthesis(_ n: Int) -> [String] {
    generateAllParen(str: "", left: n, right: n)
    return result
}

// left，right：剩余左右括号的数量
func generateAllParen(str: String, left: Int, right: Int) {
    if left == 0 && right == 0 { //左右括号都枚举完了，退出递归，加入结果
        result.append(str)
        return
    }
    if left > right { // 剩余左括号大于右括号，肯定不符合
        return
    }
    if left > 0 {
        generateAllParen(str: str+"(", left: left-1, right: right)
    }
    if right > 0 {
        generateAllParen(str: str+")", left: left, right: right-1)
    }
}

generateParenthesis(3)
