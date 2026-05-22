# Problem: Insert Node At Tail of Singly LinkedList

# Approach:
# Create a new node.
# Traverse till the last node.
# Attach the new node at the end.

# Time Complexity: O(n)
# Space Complexity: O(1)

# Node class
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None


# Singly Linked List
class SinglyLinkedList:
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

    def display(self):
        temp = self.head

        while temp:
            print(temp.data, end=" -> ")
            temp = temp.next

        print("None")


sll = SinglyLinkedList()

sll.insert_at_tail(10)
sll.insert_at_tail(20)
sll.insert_at_tail(30)

sll.display()

# Output :  10 -> 20 -> 30 -> None