//: [Previous](@previous)

import Foundation

// 2.两数相加

//给你两个非空的链表，表示两个非负的整数。它们每位数字都是按照逆序的方式存储的，并且每个节点只能存储一位数字。
//请你将两个数相加，并以相同形式返回一个表示和的链表。
//你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

//输入：l1 = [2,4,3], l2 = [5,6,4]
//输出：[7,0,8]
//解释：342 + 465 = 807
// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil && l2 == nil {
        return nil
    }
    var sum = (l1?.val ?? 0) + (l2?.val ?? 0)
    var tempNext = l1?.next
    if sum > 9 {
        tempNext = ListNode(sum / 10 + (l1?.next?.val ?? 0), l1?.next?.next)
        sum = sum % 10
    }
    return ListNode(sum, addTwoNumbers(tempNext, l2?.next))
}

func addTwoNumbers_2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    // 未遍历的表链，初始值为传参
    var listNode1 = l1
    var listNode2 = l2
    // 进位值(两个数相加大于等于10时，将十位数上的值赋给进位值，并参与下一节点的求和)
    var carry: Int = 0
    // 返回结果表链（初始new一个ListNode即可，val为任意值）
    let result: ListNode = ListNode(0)
    // 当前节点
    var currentNode: ListNode = result
    
    // 存在未遍历的表链或者进位值carry大于0的场合，继续遍历
    while listNode1 != nil || listNode2 != nil || carry > 0 {
        
        // 求和
        let sum: Int = (listNode1?.val ?? 0) + (listNode2?.val ?? 0) + carry
        // 更新未遍历的表链
        listNode1 = listNode1?.next
        listNode2 = listNode2?.next
        // 更新进位值
        carry = sum / 10
        // 保存本次遍历的节点
        currentNode.next = ListNode(sum % 10)
        // 更新当前节点
        currentNode = currentNode.next!
    }
    return result.next
}

