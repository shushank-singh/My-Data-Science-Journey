# =========================================
# Problem: Implement Stack using Queues
# =========================================

# Approach:
# Use a single queue to simulate stack operations.
#
# For push(x):
# - Add the element to the back of the queue.
# - Rotate the previous elements to the back so that
#   the newly added element comes to the front.
#
# For pop():
# - Remove and return the front element.
#
# For top():
# - Return the front element without removing it.
#
# For empty():
# - Return True if the queue is empty; otherwise False.

# Time Complexity:
# push()  -> O(n)
# pop()   -> O(1)
# top()   -> O(1)
# empty() -> O(1)

# Space Complexity: O(n)

from collections import deque


class MyStack:

    def __init__(self):
        self.queue = deque()

    def push(self, x: int) -> None:

        self.queue.append(x)

        for _ in range(len(self.queue) - 1):
            self.queue.append(self.queue.popleft())

    def pop(self) -> int:
        return self.queue.popleft()

    def top(self) -> int:
        return self.queue[0]

    def empty(self) -> bool:
        return len(self.queue) == 0


# =========================================
# Example 1
# =========================================

stack = MyStack()

stack.push(1)
stack.push(2)

print("Top:", stack.top())
print("Pop:", stack.pop())
print("Is Empty:", stack.empty())


# =========================================
# Example 2
# =========================================

stack.push(3)

print("Top:", stack.top())
print("Pop:", stack.pop())
print("Pop:", stack.pop())
print("Is Empty:", stack.empty())