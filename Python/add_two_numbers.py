"""
https://leetcode.com/problems/add-two-numbers/

You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.

"""
# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        dummyNode = ListNode
        cur = dummyNode
        carrier = 0
        while l1 or l2 or carrier:
            x1 = l1.val if l1 else 0
            x2 = l2.val if l2 else 0
            # Comput new digit
            # edge case - if carrier is not null we need to continue the loop
            # we need to carry over the 1 
            val = x1 + x2 + carrier
            # what if carrier is a 2 digit number
            carrier = val // 10
            # We only want the ones place (mod it)
            val = val % 10
            #insert into the list (new listnode with val we just computed)
            cur.next = ListNode(val)
            #update pointers
            cur = cur.next
            # update l1 and l2 nodes if not null  else leave as null
            l1 = l1.next if l1 else None
            l2 = l2.next if l2 else None
            
        return dummyNode.next
            
            
            
        
"""
2 non empty linked lists
Digits stored in revere order

Going to need to carry numbers over for adding

Create a resulting linked list - dummynode = listnode
current pointer points at the position we are insterting new node

while li or l2 is not null - we add them together
one could be null - we have to get teh digits together from them (digits from li)  x1
if l1 is null we set it to 0
"""
        