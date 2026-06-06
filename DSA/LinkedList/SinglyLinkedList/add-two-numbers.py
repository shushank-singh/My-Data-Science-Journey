# =========================================
# Problem: 2. Add Two Numbers
# =========================================

# Approach:
# Elementary math addition using a carry-over variable.
#
# Iterate through both linked lists simultaneously.
# At each step, calculate the sum of the current digits and the carry.
# Create a new node with the value of (sum % 10).
# Update the carry to (sum // 10).
# Move the pointers forward.
#
# If one list is shorter, treat its missing values as 0.
# If a carry remains at the end, append a final node with value 1.

# Time Complexity: O(max(m, n)) - where m and n are lengths of the two lists.
# Space Complexity: O(max(m, n)) - for the new output list.


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        dummy_head = ListNode(0)
        current = dummy_head
        carry = 0

        while l1 or l2 or carry:
            val1 = l1.val if l1 else 0
            val2 = l2.val if l2 else 0

            # Calculate sum and carry
            total = val1 + val2 + carry
            carry = total // 10
            current.next = ListNode(total % 10)

            # Move pointers forward
            current = current.next
            if l1:
                l1 = l1.next
            if l2:
                l2 = l2.next

        return dummy_head.next


# Helper functions to convert list to LinkedList and print results
def build_linked_list(arr):
    dummy = ListNode(0)
    curr = dummy
    for val in arr:
        curr.next = ListNode(val)
        curr = curr.next
    return dummy.next


def print_linked_list(head):
    curr = head
    while curr:
        print(curr.val, end=" -> " if curr.next else "")
        curr = curr.next
    print()


# =========================================
# Example 1: l1 = [2,4,3], l2 = [5,6,4]
# =========================================

l1 = build_linked_list([2, 4, 3])
l2 = build_linked_list([5, 6, 4])

sol = Solution()
result1 = sol.addTwoNumbers(l1, l2)

print("Example 1 Output:")
print_linked_list(result1)
