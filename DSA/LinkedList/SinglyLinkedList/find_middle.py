# =========================================
# Problem: Find Middle of a Singly Linked List
# (LeetCode 876 - Middle of the Linked List)
# =========================================

# Approach:
# Use Slow and Fast Pointer.
#
# slow -> moves 1 step at a time
# fast -> moves 2 steps at a time
#
# When fast reaches the end,
# slow will be at the middle node.

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

    def find_middle(self):
        if self.head is None:
            return None

        slow = self.head
        fast = self.head

        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next

        return slow

    def traverse(self):
        temp = self.head

        while temp:
            print(temp.data, end=" -> ")
            temp = temp.next

        print("None")


ll = LinkedList()

ll.insert_at_tail(10)
ll.insert_at_tail(20)
ll.insert_at_tail(30)
ll.insert_at_tail(40)
ll.insert_at_tail(50)

print("Linked List:")
ll.traverse()

middle = ll.find_middle()

print("\nMiddle Node:")
print(middle.data)


# =========================================
# Output:
#
# Linked List:
# 10 -> 20 -> 30 -> 40 -> 50 -> None
#
# Middle Node:
# 30
# =========================================