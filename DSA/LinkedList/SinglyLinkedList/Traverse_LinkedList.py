# =========================================
# Problem: Traverse Singly Linked List
# =========================================

# Approach:
# Start from the head node.
# Traverse each node one by one.
# Print node data until NULL is reached.

# Time Complexity: O(n)
# Space Complexity: O(1)

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None


class LinkedList:
    def __init__(self):
        self.head = None

    # Insert at Tail
    def insert_at_tail(self, data):
        new_node = Node(data)

        if self.head is None:
            self.head = new_node
            return

        temp = self.head

        while temp.next:
            temp = temp.next

        temp.next = new_node

    # Traverse Linked List
    def traverse(self):
        temp = self.head

        while temp:
            print(temp.data, end=" -> ")
            temp = temp.next

        print("None")


# =========================================
# Driver Code
# =========================================

ll = LinkedList()

ll.insert_at_tail(10)
ll.insert_at_tail(20)
ll.insert_at_tail(30)
ll.insert_at_tail(40)

print("Linked List:")

ll.traverse()

# =========================================
# Output :  10 -> 20 -> 30 -> 40 -> None
# =========================================