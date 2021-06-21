//: [Previous](@previous)

import Foundation

/*
 23.合并K个升序链表
 给你一个链表数组，每个链表都已经按升序排列。
 请你将所有链表合并到一个升序链表中，返回合并后的链表。
 
 示例 1：
 输入：lists = [[1,4,5],[1,3,4],[2,6]]
 输出：[1,1,2,3,4,4,5,6]
 解释：链表数组如下：
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 将它们合并到一个有序链表中得到。
 1->1->2->3->4->4->5->6
 
 示例 2：
 输入：lists = []
 输出：[]
 
 示例 3：
 输入：lists = [[]]
 输出：[]
 */

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

/*
 超时解法🐶
 思路：当成k-1次合并两个有序链表来处理
 */
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard lists.count > 0 else {
        return nil
    }
    var resultNode = lists.first!
    for i in 1..<lists.count {
        resultNode = mergeTwoLists(resultNode, lists[i])
    }
    return resultNode
}

// 合并两个有序链表
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1Node = l1
    var l2Node = l2
    let dummyNode = ListNode(0)
    var tempNode = dummyNode
    while l1Node != nil && l2Node != nil {
        if l1Node!.val < l2Node!.val {
            tempNode.next = l1Node
            l1Node = l1Node!.next
        }else {
            tempNode.next = l2Node
            l2Node = l2Node!.next
        }
        tempNode = tempNode.next!
    }
    if l1Node == nil {
        tempNode.next = l2Node
    }else {
        tempNode.next = l1Node
    }
    return dummyNode.next
}


/*
 解法二：转数组再排序生序链表
 */
func mergeKLists_2(_ lists: [ListNode?]) -> ListNode? {
    guard lists.count > 0 else {
        return nil
    }
    var valueArr = [Int]()
    for l in lists { // 链表数组转整形数组
        var templ = l
        while templ != nil {
            valueArr.append(templ!.val)
            templ = templ!.next
        }
    }
    valueArr.sort(by: <) // 排序
    let dummyNode = ListNode(0) // 定义一个哑节点保存头节点
    var tempNode = dummyNode
    for value in valueArr { // 数组转链表
        tempNode.next = ListNode(value)
        tempNode = tempNode.next!
    }
    return dummyNode.next
}
