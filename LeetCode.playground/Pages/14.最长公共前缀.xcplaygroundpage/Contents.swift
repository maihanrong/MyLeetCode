//: [Previous](@previous)

import Foundation

/*
 14.最长公共前缀
 
 编写一个函数来查找字符串数组中的最长公共前缀。
 如果不存在公共前缀，返回空字符串 ""。
 
 示例 1：
 输入：strs = ["flower","flow","flight"]
 输出："fl"
 
 示例 2：
 输入：strs = ["dog","racecar","car"]
 输出：""
 解释：输入不存在公共前缀。
 */

/*
 横向扫描思路：比较前面的两个字符串，取出相同的部分，依次和后面的字符串比较，如果相同字符串为空，就提前退出
 */
func longestCommonPrefix(_ strs: [String]) -> String {
    guard var prefix = strs.first else {
        return ""
    }
    for i in 1..<strs.count {
        prefix = twoCommonPrefix(prefix, strs[i])
        if prefix.count == 0 { // 两两之间没有共同前缀，提前退出
            break
        }
    }
    return prefix
}

// 获取两两之间的共同前缀
func twoCommonPrefix(_ str1: String, _ str2: String) -> String {
    var index = 0 //相同前缀的下标
    while index < min(str1.count, str2.count) {
        if str1[str1.index(str1.startIndex, offsetBy: index)] == str2[str2.index(str2.startIndex, offsetBy: index)] {
            index += 1
        }else {
            break
        }
    }
    return String(str1.prefix(index))
}

let strs = ["flower","flow","flight"]
longestCommonPrefix(strs)


/*
 纵向扫描：依次取第一个字符串的字符依次跟数组里的字符串去比较，不相同就就返回前一个下标之前的字符串
 */
func longestCommonPrefix_2(_ strs: [String]) -> String {
    guard let prefix = strs.first else {
        return ""
    }
    for i in 0..<prefix.count { // 遍历取出第一个字符串的字符
        let char = prefix[prefix.index(prefix.startIndex, offsetBy: i)]
        for j in 1..<strs.count { // 遍历字符串数组里的其他字符串，依次取出每个对应的字符进行比较
            if i == strs[j].count || char != strs[j][strs[j].index(strs[j].startIndex, offsetBy: i)] { // 这两个条件的顺序很重要，反过来会导致数组越界
                return String(prefix.prefix(i))
            }
        }
    }
    return prefix
}

let arr2 = ["ab", "a"]
longestCommonPrefix_2(arr2)


/*
 高赞思路：把字符串进行升序排序，取第一个和最后一个的共同字符串
 */
