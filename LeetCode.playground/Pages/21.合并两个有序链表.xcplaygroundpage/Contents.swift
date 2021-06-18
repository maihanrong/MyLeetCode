//: [Previous](@previous)

import Foundation

/*
 21.合并两个有序链表
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 示例 1：
 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 
 示例 2：
 输入：l1 = [], l2 = []
 输出：[]
 
 示例 3：
 输入：l1 = [], l2 = [0]
 输出：[0]
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
 解法一：循环
 
一点疑惑的解答：一开始dummy和temp指向同一个对象，tempNode.next = l1;即dummyNode.next = l1;，dummyNode对象所在地址的next被赋值了。tempNode = tempNode.next;，这句让tempNode这个对象名指向了新的地址，但是dummyNode指向的还是最初的地址，所以最后能用dummyNode.next还可以返回头结点，不能用tempNode，因为tempNode已经移动到l1或者l2的末尾去了。大抵就是对象名和内存地址的关系
 */
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummyNode = ListNode(0)
    var tempNode = dummyNode
    var l1Node = l1
    var l2Node = l2
    while l1Node != nil && l2Node != nil { //排序l1和l2
        if l1Node!.val < l2Node!.val {
            tempNode.next = l1Node
            l1Node = l1Node!.next
        }else {
            tempNode.next = l2Node
            l2Node = l2Node?.next
        }
        tempNode = tempNode.next!
    }
    if l1Node == nil { // 串联l1或者l2剩下的链表
        tempNode.next = l2Node
    }else {
        tempNode.next = l1Node
    }
    return dummyNode.next
}


/*
 解法二：递归
 */
func mergeTwoLists_2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let l1Node = l1
    let l2Node = l2
    if l1Node == nil {
        return l2Node
    }else if l2Node == nil {
        return l1Node
    }else if l1Node!.val < l2Node!.val {
        l1Node!.next = mergeTwoLists_2(l1Node!.next, l2Node)
        return l1Node
    }else {
        l2Node!.next = mergeTwoLists_2(l1Node, l2Node!.next)
        return l2Node
    }
}
