class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        # NOTES
        # We need to cycle with fast and slow pointers
        # fast pointer (2 steps forward) slow pointer (1 step forward)
        # when the pointers reach their intersection point we loop through the list again and find the entrance to the cycle
        
    
        # start at first item with slow pointer and fast pointer
        slowPointer = nums[0]
        fastPointer = nums[0]
        # While this is true
        while True:
        # 1 step forward based on values with slow pointer
            slowPointer = nums[slowPointer]
        # 2 steps forward based on values with the fast pointer
            fastPointer = nums[nums[fastPointer]]
        # if they have the same value then BREAK
            if slowPointer == fastPointer:
                break
        # once we break it, we know the intersections point between fast and slow pointers, thus the value
        # now we find the entry point to the cycle
        # set pointer 1 at the starting point
        pointer1 = nums[0]
        pointer2 = slowPointer
        # while pointer 1 is not equal to pointer 2
        
        while pointer1 != pointer2:
        # we move the pointers forward
            pointer1 = nums[pointer1]
            pointer2 = nums[pointer2]
        # when the 2 pointers meet at the same index then we return pointer 1
        return pointer1