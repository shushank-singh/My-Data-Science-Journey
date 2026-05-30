# =========================================
# Problem: Palindrome Linked List
# LeetCode: 234
# =========================================

# Approach:
# Find the middle of the linked list using
# slow and fast pointers.
#
# Reverse the second half of the list.
#
# Compare nodes from the first half and
# reversed second half.
#
# If all values match, the list is a palindrome.

# Time Complexity: O(n)
# Space Complexity: O(1)


class Node:
    def __init__(self, data):
        self.data = data
        self.next = None


class LinkedList:
    def __init__(self):
        self.head = None

    def insert_at_tail(self, data):
        new_node = Node(data)

        if self.head is None:
            self.head = new_node
            return

        temp = self.head

        while temp.next:
            temp = temp.next

        temp.next = new_node

    def reverse(self, head):

        prev = None
        curr = head

        while curr:
            nxt = curr.next
            curr.next = prev
            prev = curr
            curr = nxt

        return prev

    def is_palindrome(self):

        if self.head is None or self.head.next is None:
            return True

        slow = self.head
        fast = self.head

        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next

        second_half = self.reverse(slow)

        first_half = self.head
        temp = second_half

        while temp:

            if first_half.data != temp.data:
                return False

            first_half = first_half.next
            temp = temp.next

        return True

    def traverse(self):
        temp = self.head

        while temp:
            print(temp.data, end=" -> ")
            temp = temp.next

        print("None")


ll = LinkedList()

ll.insert_at_tail(1)
ll.insert_at_tail(2)
ll.insert_at_tail(2)
ll.insert_at_tail(1)

print("Linked List:")
ll.traverse()

if ll.is_palindrome():
    print("\nPalindrome Linked List")
else:
    print("\nNot a Palindrome Linked List")


# =========================================
# Example Outputs:
#
# 1 -> 2 -> 2 -> 1 -> None
# True
#
# 1 -> 2 -> None
# False
#
# 1 -> 2 -> 3 -> 2 -> 1 -> None
# True
#
# 1 -> None
# True
#
# Empty List
# True
# =========================================