# =========================================
# Problem: Reverse a Singly Linked List
# =========================================

# Approach:
# Use three pointers:
# prev  -> previous node
# curr  -> current node
# next  -> next node
#
# Reverse links one by one.
# Move pointers forward until list ends.

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

    def reverse(self):
        prev = None
        curr = self.head

        while curr:
            next_node = curr.next

            curr.next = prev

            prev = curr
            curr = next_node

        self.head = prev

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

print("Before Reverse:")
ll.traverse()

ll.reverse()

print("After Reverse:")
ll.traverse()


# =========================================
# Output:
#
# Before Reverse:
# 10 -> 20 -> 30 -> 40 -> None
#
# After Reverse:
# 40 -> 30 -> 20 -> 10 -> None
# =========================================