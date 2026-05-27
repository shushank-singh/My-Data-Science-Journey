# =========================================
# Problem: Insert at Position in Singly Linked List
# =========================================

# Approach:
# Create a new node.
# If position is 1:
#     Insert node at head.
# Else:
#     Traverse till (position - 1) node.
#     Change links to insert new node.

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

    def insert_at_position(self, position, data):
        new_node = Node(data)

        if position == 1:
            new_node.next = self.head
            self.head = new_node
            return

        temp = self.head

        for i in range(position - 2):
            temp = temp.next

        new_node.next = temp.next
        temp.next = new_node

    def traverse(self):
        temp = self.head

        while temp:
            print(temp.data, end=" -> ")
            temp = temp.next

        print("None")


ll = LinkedList()

ll.insert_at_tail(10)
ll.insert_at_tail(20)
ll.insert_at_tail(40)

print("Before Insertion:")
ll.traverse()

ll.insert_at_position(3, 30)

print("After Insertion:")
ll.traverse()


# =========================================
# Output:
#
# Before Insertion:
# 10 -> 20 -> 40 -> None
#
# After Insertion:
# 10 -> 20 -> 30 -> 40 -> None
# =========================================