//: [Previous](@previous)

import Foundation

/*
给你一个字符串 s，找到 s 中最长的回文子串。

示例 1：
输入：s = "babad"
输出："bab"
解释："aba" 同样是符合题意的答案。
 
示例 2：
输入：s = "cbbd"
输出："bb"
 
示例 3：
输入：s = "a"
输出："a"
 
示例 4：
输入：s = "ac"
输出："a"
*/

// 中心扩散法 s[i-1] == s[i+1]
func longestPalindrome(_ s: String) -> String {
    let sArr = [Character].init(s)
    // 变量保存每一轮的左右位置
    var left = 0
    var right = 0
    // 记录开始和结束的下标
    var dic = [String: Int]()
    for (index, element) in sArr.enumerated() {
        left = index
        right = index
        // 跳过左侧相同的元素
        while left-1 >= 0 && sArr[left-1] == element {
            left -= 1
        }
        // 跳过右边相同的元素
        while right+1 <= sArr.count-1 && sArr[right+1] == element {
            right += 1
        }
        // 判断是不是回文串
        while left >= 0 && right <= sArr.count-1 {
            if sArr[left] == sArr[right] {
                // 保存左右下标和最大长度
                if dic["count"] ?? 0 < right-left+1 {
                    dic["count"] = right-left+1
                    dic["left"] = left
                    dic["right"] = right
                }
            }else { break }
            left -= 1
            right += 1
        }
    }
    // 根据字典里的值取出回文串
    left = dic["left"] ?? 0
    right = dic["right"] ?? 0
    var str = ""
    for i in left...right {
        str += String(sArr[i])
    }
    return str
}

let s = "babad"
longestPalindrome(s)
