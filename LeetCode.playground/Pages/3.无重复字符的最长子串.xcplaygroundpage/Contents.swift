//: [Previous](@previous)

import Foundation

//3. 无重复字符的最长子串
//给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
//示例 1:
//输入: s = "abcabcbb"
//输出: 3
//解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。

func lengthOfLongestSubstring(_ s: String) -> Int {
    var currentStr = ""
    var maxStr = ""
    for char in s {
        while currentStr.contains(char) {
            // 删除相同字符之前的所有字符串
            currentStr.removeSubrange(currentStr.startIndex...currentStr.firstIndex(of: char)!)
        }
        currentStr.append(char)
        if currentStr.count > maxStr.count {
            maxStr = currentStr
        }
    }
    print("maxStr:\(maxStr)")
    return maxStr.count
}

lengthOfLongestSubstring("adcbabcbb")
