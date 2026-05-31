# =========================================
# Problem: Detect Cycle in Singly Linked List
# =========================================

# Approach:
# Use Floyd's Cycle Detection Algorithm
# (Tortoise and Hare Algorithm).
#
# Move slow pointer by 1 step.
# Move fast pointer by 2 steps.
#
# If they meet, a cycle exists.
# If fast reaches None,
# no cycle exists.

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

    def detect_cycle(self):

        slow = self.head
        fast = self.head

        while fast and fast.next:

            slow = slow.next
            fast = fast.next.next

            if slow == fast:
                return True

        return False

    def traverse(self):
        temp = self.head

        while temp:
            print(temp.data, end=" -> ")
            temp = temp.next

        print("None")


# =========================================
# Example 1: Without Cycle
# =========================================

ll1 = LinkedList()

ll1.insert_at_tail(10)
ll1.insert_at_tail(20)
ll1.insert_at_tail(30)
ll1.insert_at_tail(40)
ll1.insert_at_tail(50)

print("Linked List Without Cycle:")

if ll1.detect_cycle():
    print("Cycle Detected")
else:
    print("No Cycle Detected")


# =========================================
# Example 2: With Cycle
# =========================================

ll2 = LinkedList()

ll2.insert_at_tail(10)
ll2.insert_at_tail(20)
ll2.insert_at_tail(30)
ll2.insert_at_tail(40)
ll2.insert_at_tail(50)

# Create Cycle:
# 50 -> 20

second_node = ll2.head.next

last_node = ll2.head

while last_node.next:
    last_node = last_node.next

last_node.next = second_node

print("\nLinked List With Cycle:")

if ll2.detect_cycle():
    print("Cycle Detected")
else:
    print("No Cycle Detected")


# =========================================
# Example Outputs:
#
# Linked List Without Cycle:
# No Cycle Detected
#
# Linked List With Cycle:
# Cycle Detected
# =========================================