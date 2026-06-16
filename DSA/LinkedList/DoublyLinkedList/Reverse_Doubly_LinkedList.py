# =========================================
# Problem: Reverse Doubly Linked List
# =========================================

# Approach:
# Traverse the doubly linked list.
#
# For every node:
# Swap its previous and next pointers.
#
# Move to the previous node
# (because after swapping, previous becomes next).
#
# Continue until the end.
#
# The last processed node becomes the new head.

# Time Complexity: O(n)
# Space Complexity: O(1)


class Node:
    def __init__(self, data):
        self.data = data
        self.prev = None
        self.next = None


class Solution:
    def reverseDLL(self, head):
        if not head:
            return None

        current = head
        temp = None

        while current:
            temp = current.prev
            current.prev = current.next
            current.next = temp
            current = current.prev

        return temp.prev


# =========================================
# Helper Functions
# =========================================

def build_dll(arr):
    if not arr:
        return None

    head = Node(arr[0])
    curr = head

    for val in arr[1:]:
        new_node = Node(val)
        curr.next = new_node
        new_node.prev = curr
        curr = new_node

    return head


def print_dll(head):
    curr = head
    while curr:
        print(curr.data, end=" <-> " if curr.next else "")
        curr = curr.next
    print()


# =========================================
# Example
# =========================================

head = build_dll([1, 2, 3, 4, 5])

sol = Solution()
new_head = sol.reverseDLL(head)

print("Output:")
print_dll(new_head)