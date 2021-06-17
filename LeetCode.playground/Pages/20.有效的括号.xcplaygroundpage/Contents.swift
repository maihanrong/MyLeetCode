//: [Previous](@previous)

import Foundation

/*
 20.有效的括号
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
 
 有效字符串需满足：
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 
 示例 1：
 输入：s = "()"
 输出：true
 
 示例 2：
 输入：s = "()[]{}"
 输出：true
 
 示例 3：
 输入：s = "(]"
 输出：false
 
 示例 4：
 输入：s = "([)]"
 输出：false
 
 示例 5：
 输入：s = "{[]}"
 输出：true
 */

/*
 思路：类似于入栈出栈，遇到左边的括号就加入数组最后，遇到右括号就取出数组最后的字符进行匹配，相同就删除数组最后一个字符，如果最后左数组没有元素说明全部匹配完了
 */
func isValid(_ s: String) -> Bool {
    if s.count < 2 {
        return false
    }
    let sArr = Array(s)
    var leftArr = Array<Character>()
    for char in sArr {
        if char == "(" || char == "[" || char == "{" {
            leftArr.append(char)
        }else if char == ")" {
            if leftArr.last == "(" {
                leftArr.removeLast()
            }else {
                return false
            }
        }else if char == "]" {
            if leftArr.last == "[" {
                leftArr.removeLast()
            }else {
                return false
            }
        }else if char == "}" {
            if leftArr.last == "{" {
                leftArr.removeLast()
            }else {
                return false
            }
        }
    }
    return leftArr.count == 0 ? true : false
}

isValid("()[]{}")
isValid("([)]")
isValid("{[]}")


/*
 解法二：高赞解法，利用哈希表进行括号的匹配
 为啥右括号作为key，左括号作为value，因为栈里存的都是左括号，当遇到右括号的时候，要通过右括号去取出值来跟栈顶的左括号进行匹配
 */
func isValid_2(_ s: String) -> Bool {
    let dict: [Character: Character] = [")":"(", "]":"[", "}":"{"]
    var leftArr = [Character]()
    for char in s {
        if dict.values.contains(char) { // 左括号入栈
            leftArr.append(char)
        }else if dict[char] != leftArr.popLast() { //右括号出栈匹配
            return false
        }
    }
    return leftArr.count == 0
}

isValid_2("()[]{}")
