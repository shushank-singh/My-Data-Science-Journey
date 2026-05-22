# Problem : Insert Node At Head of Singly LinkedList

# Approach:
# Create a new node with the given data.
# Point the new node to the current head node.
# Move the head to the new node.

# Time Complexity: O(1)
#Space Complexity: O(1)


# Node class
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None


# Singly Linked List
class SinglyLinkedList:
    def __init__(self):
        self.head = None

    def insert_at_head(self, data):
        new_node = Node(data)

        new_node.next = self.head

        self.head = new_node

    def display(self):
        temp = self.head

        while temp:
            print(temp.data, end=" -> ")
            temp = temp.next

        print("None")


sll = SinglyLinkedList()

sll.insert_at_head(30)
sll.insert_at_head(20)
sll.insert_at_head(10)

sll.display()

# Output :  10 -> 20 -> 30 -> None