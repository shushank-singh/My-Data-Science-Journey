# =========================================
# Problem: Asteroid Collision
# =========================================

# Approach:
# Use a stack to keep track of asteroids
# moving from left to right.
#
# For each asteroid:
#
# - If it is moving right (positive),
#   push it into the stack.
#
# - If it is moving left (negative),
#   compare it with the top asteroid
#   moving right.
#
# - If the right asteroid is smaller,
#   it explodes, so pop it.
#
# - If both are the same size,
#   both explode.
#
# - If the right asteroid is larger,
#   the current asteroid explodes.
#
# Continue until no collision is possible.
#
# The stack stores the remaining asteroids.
#
# Time Complexity: O(n)
#
# Space Complexity: O(n)


class Solution:

    def asteroidCollision(self, asteroids):

        stack = []

        for asteroid in asteroids:

            while stack and asteroid < 0 and stack[-1] > 0:

                if stack[-1] < -asteroid:
                    stack.pop()
                    continue

                elif stack[-1] == -asteroid:
                    stack.pop()

                break

            else:
                stack.append(asteroid)

        return stack


# =========================================
# Example 1
# =========================================

obj = Solution()

asteroids = [5, 10, -5]

print(obj.asteroidCollision(asteroids))

# Output:
# [5, 10]


# =========================================
# Example 2
# =========================================

asteroids = [8, -8]

print(obj.asteroidCollision(asteroids))

# Output:
# []


# =========================================
# Example 3
# =========================================

asteroids = [10, 2, -5]

print(obj.asteroidCollision(asteroids))

# Output:
# [10]


# =========================================
# Example 4
# =========================================

asteroids = [-2, -1, 1, 2]

print(obj.asteroidCollision(asteroids))

# Output:
# [-2, -1, 1, 2]


# =========================================
# End of File
# =========================================