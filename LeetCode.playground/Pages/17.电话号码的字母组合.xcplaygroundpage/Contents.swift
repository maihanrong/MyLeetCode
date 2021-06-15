//: [Previous](@previous)

import Foundation

/*
 17.电话号码的字母组合
 
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。
 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。

 示例 1：=
 输入：digits = "23"
 输出：["ad","ae","af","bd","be","bf","cd","ce","cf"]
 
 示例 2：
 输入：digits = ""
 输出：[]
 
 示例 3：
 输入：digits = "2"
 输出：["a","b","c"]
 */

/*
 暴力n次循环
 */
func letterCombinations(_ digits: String) -> [String] {
    if digits == "" {
        return []
    }
    let dict: [Character: [String]] = ["2":["a","b","c"], "3":["d","e","f"], "4":["g","h","i"], "5":["j","k","l"], "6":["m","n","o"], "7":["p","q","r","s"], "8":["t","u","v"], "9":["w","x","y","z"]]
    var result: [String] = [""]
    for char in digits { // 依次取出字符
        let arr = dict[char]!
        var tempArr = [String]()
        for i in result { // 将result中的字符依次和下一个进行拼接
            for str in arr {
                tempArr.append(i+str)
            }
        }
        result = tempArr
    }
    return result
}

letterCombinations("2")


/*
 解法二：递归
 */
let dict: [Character: [String]] = ["2":["a","b","c"], "3":["d","e","f"], "4":["g","h","i"], "5":["j","k","l"], "6":["m","n","o"], "7":["p","q","r","s"], "8":["t","u","v"], "9":["w","x","y","z"]]
var result: [String] = [String]()

func letterCombinations_2(_ digits: String) -> [String] {
    if digits == "" {
        return []
    }
    allStrings(digits: digits, index: 0, resultStr: "")
    return result
}

// 定义递归函数，每展开一轮都把上一轮的结果和下一个字符的坐标作为参数传递
func allStrings(digits: String, index: Int, resultStr: String) {
    if digits.count == index { // 字符已经遍历完成，退出递归
        result.append(resultStr)
        return
    }
    let charArr = dict[digits[digits.index(digits.startIndex, offsetBy: index)]]!
    for i in 0..<charArr.count {
        allStrings(digits: digits, index: index+1, resultStr: resultStr+charArr[i])
    }
}

letterCombinations_2("27")
