# =========================================
# Problem: Next Greater Element I
# =========================================

# Approach:
# Use a monotonic decreasing stack.
#
# Traverse nums2 from left to right.
#
# While the current number is greater than the top
# of the stack, it is the next greater element for
# the top element.
#
# Store the mapping and pop the stack.
#
# Push the current element onto the stack.
#
# Finally, build the answer for nums1 using
# the stored mappings.
#
# Time Complexity: O(n + m)
# Space Complexity: O(n)


class Solution:
    def nextGreaterElement(self, nums1, nums2):

        stack = []
        next_greater = {}

        for num in nums2:

            while stack and num > stack[-1]:
                next_greater[stack.pop()] = num

            stack.append(num)

        while stack:
            next_greater[stack.pop()] = -1

        return [next_greater[num] for num in nums1]


# =========================================
# Example 1
# =========================================

sol = Solution()

nums1 = [4, 1, 2]
nums2 = [1, 3, 4, 2]

print("Example 1 Output:")
print(sol.nextGreaterElement(nums1, nums2))

# Output:
# [-1, 3, -1]


# =========================================
# Example 2
# =========================================

nums1 = [2, 4]
nums2 = [1, 2, 3, 4]

print("\nExample 2 Output:")
print(sol.nextGreaterElement(nums1, nums2))

# Output:
# [3, -1]