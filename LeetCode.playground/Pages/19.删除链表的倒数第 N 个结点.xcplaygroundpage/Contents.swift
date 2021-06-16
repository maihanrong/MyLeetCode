//: [Previous](@previous)

import Foundation

/*
 19.删除链表的倒数第 N 个结点
 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
 进阶：你能尝试使用一趟扫描实现吗？
 示例 1：
 输入：head = [1,2,3,4,5], n = 2
 输出：[1,2,3,5]
 
 示例 2：
 输入：head = [1], n = 1
 输出：[]
 
 示例 3：
 输入：head = [1,2], n = 1
 输出：[1]
 */

/*
 在对链表进行操作时，一种常用的技巧是添加一个哑节点（dummy node），它的next 指针指向链表的头节点。这样一来，我们就不需要对头节点进行特殊的判断了。

 例如，在本题中，如果我们要删除节点 y，我们需要知道节点 y 的前驱节点 x，并将 x 的指针指向 y 的后继节点。但由于头节点不存在前驱节点，因此我们需要在删除头节点时进行特殊判断。但如果我们添加了哑节点，那么头节点的前驱节点就是哑节点本身，此时我们就只需要考虑通用的情况即可。
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
 解题思路：快慢指针，让快指针比慢指针快n个节点，遍历完快指针的时候，慢指针的下一个节点就是要删除的节点
 为方便头节点的操作，增加一个哑节点dummy node
 */
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummyNode = ListNode(0, head)
    var fastNode = dummyNode
    var slowNode = dummyNode
    for _ in 0..<n {
        fastNode = fastNode.next!
    }
    while fastNode.next != nil {
        fastNode = fastNode.next!
        slowNode = slowNode.next!
    }
    slowNode.next = slowNode.next!.next
    return dummyNode.next
}
