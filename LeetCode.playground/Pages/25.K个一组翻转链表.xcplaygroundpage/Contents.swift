//: [Previous](@previous)

import Foundation

/*
 25.K个一组翻转链表
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。
 k 是一个正整数，它的值小于或等于链表的长度。
 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

 进阶：
 你可以设计一个只使用常数额外空间的算法来解决此问题吗？
 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。
  
 示例 1：
 输入：head = [1,2,3,4,5], k = 2
 输出：[2,1,4,3,5]
 
 示例 2：
 输入：head = [1,2,3,4,5], k = 3
 输出：[3,2,1,4,5]
 
 示例 3：
 输入：head = [1,2,3,4,5], k = 1
 输出：[1,2,3,4,5]
 
 示例 4：
 输入：head = [1], k = 1
 输出：[1]
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
 差点又是给困难劝退的一天😣
 把链表分成K个链表，递归解决，一次递归解决1个翻转链表，并返回翻转完成链表的新头部，当链表数小于K时，退出递归
 */
func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    let dummyNode: ListNode? = ListNode(0)
    dummyNode?.next = head
    var currentNode = dummyNode
    for _ in 0..<k { // 获取第k个节点，即尾节点
        currentNode = currentNode?.next
        if currentNode == nil { // 当节点数小于K时，退出递归，返回头节点
            return dummyNode?.next
        }
    }
    let next = currentNode?.next // 切断尾节点，方便翻转一次链表
    currentNode?.next = nil
    let newhead = reverseListNode(dummyNode?.next) // 翻转一次链表，返回新的头节点
    dummyNode?.next?.next = reverseKGroup(next,k) // 翻转前的头节点即翻转后的尾节点，指向新翻转链表的头节点
    return newhead // 返回翻转链表的头节点
}

// 翻转链表
func reverseListNode(_ head: ListNode?) -> ListNode? { // 123
    var currentNode = head // 当前节点，每便利一次向后移一位，直到当前节点为nil
    var preNode: ListNode? = nil // 前一个节点
    while currentNode != nil {
        let next = currentNode?.next // 保存下一个节点
        currentNode?.next = preNode // 当前节点的next指向上一个节点
        preNode = currentNode // 上一个节点指向当前节点
        currentNode = next // 当前节点指向下一个节点
    }
    return preNode // 当前节点为nil，返回上一个节点
}
