//: [Previous](@previous)

import Foundation

/*
 39.组合总和
 给定一个无重复元素的正整数数组 candidates 和一个正整数 target ，找出 candidates 中所有可以使数字和为目标数 target 的唯一组合。
 candidates 中的数字可以无限制重复被选取。如果至少一个所选数字数量不同，则两种组合是唯一的。
 对于给定的输入，保证和为 target 的唯一组合数少于 150 个。

 示例 1：
 输入: candidates = [2,3,6,7], target = 7
 输出: [[7],[2,2,3]]
 
 示例 2：
 输入: candidates = [2,3,5], target = 8
 输出: [[2,2,2,2],[2,3,3],[3,5]]
 
 示例 3：
 输入: candidates = [2], target = 1
 输出: []
 
 示例 4：
 输入: candidates = [1], target = 1
 输出: [[1]]
 
 示例 5：
 输入: candidates = [1], target = 2
 输出: [[1,1]]
 */

/*
 递归+回溯，有点抽象
  1.找整个递归的终止条件：递归应该在什么时候结束？  <=target
  2.找返回值：应该给上一级返回什么信息？   寻找target的candidates组成的路径path
  3.本级递归应该做什么：在这一级递归中，应该完成什么任务？ 把当前路径加入path数组
 */
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var result = [[Int]]()
    if candidates.count == 0 {
        return result
    }
    dfs(candidates: candidates, target: target, begin: 0, path: [Int](), result: &result)
    return result
}


/// dfs
/// - Parameters:
///   - candidates: 原数组
///   - target: 目标值
///   - begin: 开始的位置
///   - path: 组成target的路径
///   - result: 结果
func dfs(candidates: [Int], target: Int, begin: Int, path: [Int], result: inout [[Int]]) {
    if target == 0 {
        result.append(path)
        return
    }
    if target < 0 {
        return
    }
    for i in begin..<candidates.count {
        var path = path
        path.append(candidates[i])
        dfs(candidates: candidates, target: target-candidates[i], begin: i, path: path, result: &result)
        path.removeLast() //回溯
    }
}

let candidates = [2,3,6,7], target = 7
combinationSum(candidates, target)
