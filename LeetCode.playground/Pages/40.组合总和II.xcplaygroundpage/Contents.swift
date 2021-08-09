//: [Previous](@previous)

import Foundation

/*
 40.组合总和II
 给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 candidates 中的每个数字在每个组合中只能使用一次。
 注意：解集不能包含重复的组合。
 
 示例 1:
 输入: candidates = [10,1,2,7,6,1,5], target = 8,
 输出:
 [
 [1,1,6],
 [1,2,5],
 [1,7],
 [2,6]
 ]
 
 示例 2:
 输入: candidates = [2,5,2,1,2], target = 5,
 输出:
 [
 [1,2,2],
 [5]
 ]
 
 提示:
 1 <= candidates.length <= 100
 1 <= candidates[i] <= 50
 1 <= target <= 30
 */

/*
 还是递归+回溯
 把数组排序后，在数组中找与target相等的数字，如果当前数字小于target，求的与target的差值后，继续在数组中找与target相等的数字
 */
func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    let candidates = candidates.sorted()
    dfs(candidates: candidates, target: target, begin: 0, path: [Int](), result: &result)
    return result
}

/// dfs
/// - Parameters:
///   - candidates: 原数组
///   - target: 每一轮的target
///   - begin: 开始寻找的数组下标
///   - path: 存储路径的数组
///   - result: 结果
func dfs(candidates: [Int], target: Int, begin: Int, path: [Int], result: inout [[Int]]) {
    if target == 0 {
        result.append(path)
        return
    }
    for i in begin..<candidates.count {
        if candidates[i] > target { // 数组排序后说明后面的值都比target大
            break
        }
        if i>begin && candidates[i] == candidates[i-1] { // 跳过重复的值
            continue
        }
        var path = path
        path.append(candidates[i]) // 加入路径
        dfs(candidates: candidates, target: target-candidates[i], begin: i+1, path: path, result: &result)
        path.removeLast() // 回溯
    }
}

let candidates = [10,1,2,7,6,1,5], target = 8
combinationSum2(candidates, target)

let candidates2 = [2,5,2,1,2], target2 = 5
combinationSum2(candidates2, target2)

