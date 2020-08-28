/*

https://leetcode.com/problems/add-two-numbers/

You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.

*/

/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */
var addTwoNumbers = function(l1, l2) {
    const prev = new ListNode();
    let tail = prev;
    let carrier = 0;
    
    while (l1 || l2 || carrier) {
        const x1 = l1 ? l1.val : 0;
        const x2 = l2 ? l2.val : 0;
        const valueThing = x1 + x2 + carrier;
        
        tail.next = new ListNode(valueThing % 10)
        tail = tail.next;
        carrier = valueThing >= 10 ? 1 : 0;
        l1 = l1 && l1.next;
        l2 = l2 && l2.next;
    }
    return prev.next
};