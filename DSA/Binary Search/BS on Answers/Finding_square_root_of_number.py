# Problem: Finding Sqrt of a number using Binary Search


# Approach:
# Pick mid, check if mid × mid equals n.
# If mid² < n, search right; otherwise search left.
# Repeat until you get the closest value.


# Time Complexity: O(log n)

# Space Complexity: O(1)

# Code:
def sqrt_binary_search(n):
    if n < 0:
        return "Invalid input"

    low, high = 0, n
    ans = 0

    while low <= high:
        mid = (low + high) // 2

        if mid * mid == n:
            return mid
        elif mid * mid < n:
            ans = mid
            low = mid + 1
        else:
            high = mid - 1

    return ans


# --- 🧪 Testing ---
# print(sqrt_binary_search(20))  Output:- 4