# =========================================
# Problem: Daily Temperatures
# =========================================

# Approach:
# Use a monotonic decreasing stack.
#
# The stack stores indices of temperatures.
#
# For each day's temperature:
# - While the current temperature is higher
#   than the temperature at the top index
#   of the stack:
#     - Pop the index.
#     - The difference between the current
#       index and the popped index gives
#       the number of days to wait.
#
# - Push the current index onto the stack.
#
# Any indices left in the stack do not have
# a warmer future day, so their answer
# remains 0.
#
# Time Complexity: O(n)
#
# Space Complexity: O(n)


class Solution:

    def dailyTemperatures(self, temperatures):

        stack = []
        answer = [0] * len(temperatures)

        for i in range(len(temperatures)):

            while stack and temperatures[i] > temperatures[stack[-1]]:

                index = stack.pop()
                answer[index] = i - index

            stack.append(i)

        return answer


# =========================================
# Example 1
# =========================================

obj = Solution()

temperatures = [73, 74, 75, 71, 69, 72, 76, 73]

print(obj.dailyTemperatures(temperatures))

# Output:
# [1,1,4,2,1,1,0,0]


# =========================================
# Example 2
# =========================================

temperatures = [30, 40, 50, 60]

print(obj.dailyTemperatures(temperatures))

# Output:
# [1,1,1,0]


# =========================================
# Example 3
# =========================================

temperatures = [30, 60, 90]

print(obj.dailyTemperatures(temperatures))

# Output:
# [1,1,0]


# =========================================
# End of File
# =========================================