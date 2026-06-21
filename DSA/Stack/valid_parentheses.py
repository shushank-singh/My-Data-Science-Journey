# =========================================
# Problem: Valid Parentheses
# =========================================

# Approach:
# Use a stack to keep track of opening brackets.
#
# Traverse each character in the string.
#
# If it is an opening bracket, push it onto the stack.
#
# If it is a closing bracket:
# - If the stack is empty, return False.
# - Pop the top element and check whether it matches
#   the corresponding opening bracket.
#
# If any mismatch occurs, return False.
#
# At the end, if the stack is empty, all brackets are matched.
# Otherwise, return False.

# Time Complexity: O(n)
# Space Complexity: O(n)


class Solution:
    def isValid(self, s: str) -> bool:

        stack = []

        pairs = {
            ')': '(',
            ']': '[',
            '}': '{'
        }

        for ch in s:

            if ch in "([{":
                stack.append(ch)

            else:

                if not stack:
                    return False

                if stack.pop() != pairs[ch]:
                    return False

        return len(stack) == 0


# =========================================
# Example 1
# =========================================

sol = Solution()

s = "()"

print("Example 1 Output:")
print(sol.isValid(s))


# =========================================
# Example 2
# =========================================

s = "()[]{"

print("Example 2 Output:")
print(sol.isValid(s))
