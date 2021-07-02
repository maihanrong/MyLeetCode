//: [Previous](@previous)

import Foundation

/*
 30.串联所有单词的子串
 给定一个字符串 s 和一些 长度相同 的单词 words 。找出 s 中恰好可以由 words 中所有单词串联形成的子串的起始位置。
 注意子串要与 words 中的单词完全匹配，中间不能有其他字符 ，但不需要考虑 words 中单词串联的顺序。
 
 示例 1：
 输入：s = "barfoothefoobarman", words = ["foo","bar"]
 输出：[0,9]
 解释：
 从索引 0 和 9 开始的子串分别是 "barfoo" 和 "foobar" 。
 输出的顺序不重要, [9,0] 也是有效答案。
 
 示例 2：
 输入：s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
 输出：[]
 
 示例 3：
 输入：s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]
 输出：[6,9,12]
 */

/*
 思路：滑动窗口+双哈希表，words里的元素作为key，次数作为value存入哈希表1，然后遍历s，从i的位置开始每次取出一个key的长度与哈希表里的key进行匹配，能匹配就保存在新的哈希表2里，直到哈希表1里的元素全部匹配完说明字符串完全匹配，否则退出当前循环进入下一个i开始的匹配，然后超时了，考虑优化为一次移动一个key的长度
 */
func findSubstring(_ s: String, _ words: [String]) -> [Int] {
    let count = words.count // 字符串数组的长度
    let lenght = words.first!.count // 一个key的长度
    if s.count < count*lenght {
        return []
    }
    var result = [Int]()
    var allWords = [String:Int]()
    for word in words { // words数组里的元素作为key，次数作为value存入哈希表
        let count = allWords[word] ?? 0
        allWords[word] = count + 1
    }
    for i in 0...s.count-count*lenght { // 遍历s，从i开始依次去除一个key的长度进行匹配
        var hasWords = [String: Int]() // 定义一个新的哈希表保存已经匹配的key和次数
        var num = 0 // 已经匹配的key个数，总数应该是字符串数组的count
        while num < count {
            let startIndex = s.index(s.startIndex, offsetBy: i+num*lenght)
            let endIndex = s.index(startIndex, offsetBy: lenght)
            let key = String(s[startIndex..<endIndex]) // 取出key
            if allWords.keys.contains(key) { // 把key和次数写入新的哈希表
                let count = hasWords[key] ?? 0
                hasWords[key] = count + 1
                if hasWords[key]! > allWords[key]! { // 如果新的哈希表里的次数多于原来哈希表的次数，就退出
                    break
                }
            }else {
                break
            }
            num += 1
        }
        if num == count { // 说明两个哈希表相同
            result.append(i)
        }
    }
    return result
}

let s = "barfoothefoobarman", words = ["foo","bar"]
findSubstring(s, words)

findSubstring("barfoofoobarthefoobarman", ["bar","foo","the"])

