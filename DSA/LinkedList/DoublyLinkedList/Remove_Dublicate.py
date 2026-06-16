# =========================================
# Problem: Remove Duplicates from Sorted Doubly Linked List
# =========================================

# Approach:
# Traverse the sorted doubly linked list.
#
# If the current node and the next node have the same value:
# Remove the next node by updating the current node's next pointer
# and the following node's previous pointer.
#
# Otherwise, move to the next node.
#
# Continue until the end of the list.

# Time Complexity: O(n)
# Space Complexity: O(1)


class Node:
    def __init__(self, data):
        self.data = data
        self.prev = None
        self.next = None


class Solution:
    def removeDuplicates(self, head):
        if not head:
            return None

        current = head

        while current and current.next:

            if current.data == current.next.data:
                duplicate = current.next

                current.next = duplicate.next

                if duplicate.next:
                    duplicate.next.prev = current

            else:
                current = current.next

        return head


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
# Example 1
# =========================================

head = build_dll([1, 2, 2, 3, 4, 4, 5])

sol = Solution()
result = sol.removeDuplicates(head)

print("Example 1 Output:")
print_dll(result)


# =========================================
# Example 2
# =========================================

head = build_dll([1, 1, 1, 2, 2, 3, 3])

result = sol.removeDuplicates(head)

print("Example 2 Output:")
print_dll(result)