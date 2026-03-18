# Problem: Single Element In Sorted Array (540)

# Link: https://leetcode.com/problems/single-element-in-a-sorted-array/description/

# Approach:
# Use binary search and check the pairing at the middle index
# If the pairing pattern is correct, move to the right side
# If the pattern breaks, the unique element is on the left

# Time Complexity: O(log n)

# Space Complexity: O(1)

# Code:
def singleNonDuplicate(arr):
    n = len(arr)

    if n == 1:
        return arr[0]

    if arr[0] != arr[1]:
        return arr[0]

    if arr[n - 1] != arr[n - 2]:
        return arr[n - 1]

    low, high = 1, n - 2

    while low <= high:
        mid = (low + high) // 2

        if arr[mid] != arr[mid + 1] and arr[mid] != arr[mid - 1]:
            return arr[mid]

        if (mid % 2 == 1 and arr[mid] == arr[mid - 1]) or (mid % 2 == 0 and arr[mid] == arr[mid + 1]):
            low = mid + 1
        else:
            high = mid - 1

    return -1

# --- 🧪 Testing ---
# print(singleNonDuplicate([1,1,2,3,3,4,4,8,8]))   Output: 2
