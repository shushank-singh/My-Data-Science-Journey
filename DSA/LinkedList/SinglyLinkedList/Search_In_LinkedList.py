# =========================================
# Problem: Search in Singly Linked List
# =========================================

# Approach:
# Start from head node.
# Traverse node one by one.
# Compare each node data with target value.
# If found return True else False.

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

    # Search Element
    def search(self, key):
        temp = self.head

        while temp:
            if temp.data == key:
                return True

            temp = temp.next

        return False


ll = LinkedList()

ll.insert_at_tail(10)
ll.insert_at_tail(20)
ll.insert_at_tail(30)
ll.insert_at_tail(40)

key = 30

if ll.search(key):
    print(f"{key} found in linked list")
else:
    print(f"{key} not found in linked list")


# =========================================
# Output :   " 30 found in linked list "
# =========================================