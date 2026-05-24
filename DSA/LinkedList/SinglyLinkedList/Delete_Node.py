# =========================================
# Problem: Delete Nodes in Singly Linked List
# =========================================

# Operations:
# 1. Delete Head Node
# 2. Delete Tail Node

# Approach:
# Delete Head:
# Move head to next node.

# Delete Tail:
# Traverse till second last node.
# Make its next = None.

# Time Complexity:
# Delete Head  -> O(1)
# Delete Tail  -> O(n)

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

    # Delete Head Node
    def delete_head(self):

        if self.head is None:
            print("Linked List is Empty")
            return

        self.head = self.head.next

    # Delete Tail Node
    def delete_tail(self):

        if self.head is None:
            print("Linked List is Empty")
            return

        if self.head.next is None:
            self.head = None
            return

        temp = self.head

        while temp.next.next:
            temp = temp.next

        temp.next = None

    # Traverse Linked List
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

print("Original Linked List:")
ll.traverse()

# Delete Head
ll.delete_head()

print("\nAfter Deleting Head:")
ll.traverse()

# Delete Tail
ll.delete_tail()

print("\nAfter Deleting Tail:")
ll.traverse()


# =========================================
# Output:
#
# Original Linked List:
# 10 -> 20 -> 30 -> 40 -> None
#
# After Deleting Head:
# 20 -> 30 -> 40 -> None
#
# After Deleting Tail:
# 20 -> 30 -> None
# =========================================