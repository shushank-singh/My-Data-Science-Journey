# =========================================
# Problem: Find Nth Node From End
# =========================================

# Approach:
# Use Two Pointers.
#
# Move first pointer n steps ahead.
# Then move both pointers together.
#
# When first reaches the end,
# second will be at the nth node from end.

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

    def nth_node_from_end(self, n):

        if self.head is None:
            return None

        if n <= 0:
            return None

        first = self.head
        second = self.head

        for _ in range(n):

            if first is None:
                return None

            first = first.next

        while first:
            first = first.next
            second = second.next

        return second

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

n = 2

result = ll.nth_node_from_end(n)

if result:
    print(f"\n{n}th Node From End:")
    print(result.data)
else:
    print("\nInvalid value of n or empty list")


# =========================================
# Example Outputs:
#
# n = 1  -> 50
# n = 2  -> 40
# n = 5  -> 10
# n = 6  -> Invalid
# n = 0  -> Invalid
# n = -1 -> Invalid
# Empty List -> Invalid
# =========================================