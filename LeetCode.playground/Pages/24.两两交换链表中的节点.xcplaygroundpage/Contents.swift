//: [Previous](@previous)

import Foundation

/*
 24.两两交换链表中的节点
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 示例 1：
 输入：head = [1,2,3,4]
 输出：[2,1,4,3]
 
 示例 2：
 输入：head = []
 输出：[]
 
 示例 3：
 输入：head = [1]
 输出：[1]
 */

/*
 1.找整个递归的终止条件：递归应该在什么时候结束？下个节点或者下下个节点为空
 2.找返回值：应该给上一级返回什么信息？处理好交换值的链表
 3.本级递归应该做什么：在这一级递归中，应该完成什么任务？交换两个节点，让头节点指向下个递归返回的链表
 */

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

// 直觉告诉我，看到链表就是用递归来解了
func swapPairs(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    let newHead = head?.next // 拿到next，就是新的newhead
    head?.next = swapPairs(newHead?.next) // 让head.next指向处理好的链表
    newHead?.next = head // 新的head.next指向原来的head
    return newHead
}
