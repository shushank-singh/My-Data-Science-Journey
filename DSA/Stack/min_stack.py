# =========================================
# Problem: Min Stack
# =========================================

# Approach:
# Use two stacks.
#
# The first stack stores all values.
#
# The second stack stores the minimum value
# at each step.
#
# When pushing a value:
# - Push it to the main stack.
# - Push it to the min stack if it is
#   smaller than or equal to the current minimum.
#
# When popping:
# - If the popped value is the current minimum,
#   remove it from the min stack as well.
#
# The top of the min stack always gives
# the minimum element.
#
# Time Complexity:
# push()  -> O(1)
# pop()   -> O(1)
# top()   -> O(1)
# getMin()-> O(1)
#
# Space Complexity: O(n)


class MinStack:

    def __init__(self):
        self.stack = []
        self.min_stack = []

    def push(self, val):

        self.stack.append(val)

        if not self.min_stack or val <= self.min_stack[-1]:
            self.min_stack.append(val)

    def pop(self):

        if self.stack[-1] == self.min_stack[-1]:
            self.min_stack.pop()

        self.stack.pop()

    def top(self):

        return self.stack[-1]

    def getMin(self):

        return self.min_stack[-1]


# =========================================
# Example 1
# =========================================

obj = MinStack()

obj.push(-2)
obj.push(0)
obj.push(-3)

print("Minimum:", obj.getMin())

obj.pop()

print("Top:", obj.top())
print("Minimum:", obj.getMin())

# Output:
# Minimum: -3
# Top: 0
# Minimum: -2


# =========================================
# Example 2
# =========================================

obj = MinStack()

obj.push(5)
obj.push(2)
obj.push(10)
obj.push(1)

print("\nCurrent Minimum:", obj.getMin())

obj.pop()

print("Top:", obj.top())
print("Current Minimum:", obj.getMin())

# Output:
# Current Minimum: 1
# Top: 10
# Current Minimum: 2


# =========================================
# End of File
# =========================================