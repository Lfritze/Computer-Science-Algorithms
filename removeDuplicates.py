# Given a linked list of integers, remove any nodes from the linked list that have
# values that have previously occurred in the linked list. Your function should
# return a reference to the head of the updated linked list.
# Example:
# Input: (3) -> (4) -> (3) -> (2) -> (6) -> (1) -> (2) -> (6) -> N
# Output: (3) -> (4) -> (2) -> (6) -> (1) -> N
# Explanation: The input list contains redundant nodes (3), (6), and (2), so those
# should be removed from the list.
# Solution (main.py3):
# Singly-linked lists are already defined with this interface:

class ListNode(object):
def __init__(self, x):
self.value = x
self.next = None

def condense_linked_list(node):
  if node is None:
    return None
  curr = node
while curr is not None:
  inner = curr
  while inner.next is not None:
    if inner.next.value == curr.value:
      inner.next = inner.next.next
    else:
      inner = inner.next
  curr = curr.next
return node

def condense_linked_list(node):
  # iterate through the list
  # make a node initially equal to the head of the list
  # as we go along in this list current node pointer (cur = node.head) will be updated as we move along in the list
  cur = node.head

  # we are also going to keep track of the previous node as well
  # this is so that when we stumble upon a duplicate and we know that it is a node we need to delete...we will still need information
  # on the previous node and where it is pointing to so we can point to the next node beyond the duplicate
  # so we make a previous node and initially set it equal to NONE and we will update it as we go through the list
  prev = None

  # We are also keeping track of the data values we encounter and to do so we will be using a dictionary object
  dup_values = dict()

  # we need a while loop to iterate through the list
  # while the current node is not NONE we keep going through the list
  while cur:
    # if the data element for the node that we are on is already in the dup_value dictionary
    if cur.data in dup_values:
      # thus we need to remove the node from the list
      # to do this we .... look at example (prev.next is an arrow)
      # 1 -> 5 -> 1 -> 4 -> 3 -> 3 -> 4
      # so we are essentially removing the arrow between 5 -> 1 (because 1 is a duplicate)
      # and then pointing to current.next to make it look like the  1 -> 5 -> 4
      # we move the arrow to point to cur.next and eliminate the duplicate node
      prev.next = cur.next
      # the duplicate node is then just kinda hanging out in space with nothing pointing to it
      # SO now we need to go ahead and remove that node from the list with current = NONE
      cur = None


    # otherwise (else) if we have not encountered the current node, we will add it to the dictionary
    else:
      #we are set the data entry in the dictionary to a COUNT of 1
      # this is the case if we have not yet encountered that node's value 
      dup_values[cur.data] = 1
      # then we update the previous node equal to the current node
      prev = cur
    # then no matter what (if or else condition is hit) - we say current is qual to the previous node's next node
    cur = prev.next


  


# General approach is to loop through (iterate) the list 1 time
# and in doing so we are going to keep track of the data held at each of the nodes
# We are going to use a hash table (dictionary) to keep track of the data elements we found
# we go through each item in the list and add it to the dictionary. If it is already in the dictionary, we remove it from the list


