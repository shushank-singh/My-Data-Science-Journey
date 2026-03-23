# Problem: Koko Eating Banana (875)

# Approach:
# Use binary search to find the minimum eating speed (k) so Koko can finish all bananas within h hours.
# For each possible speed, calculate total hours needed by dividing piles and rounding up.
# If hours ≤ h, try smaller speed; otherwise increase speed until optimal k is found.

# Time Complexity: O(log n)

# Space Complexity: O(1)

# Code:
import math
def minEatingSpeed(piles, h):
    maxPile = max(piles)

    low, high = 1, maxPile
    ans = maxPile

    while low <= high:
        mid = (low + high) // 2
        totalH = 0
        for bananas in piles:
            totalH += math.ceil(bananas / mid)
    
        if totalH <= h:
            ans = mid
            high = mid - 1

        else:
            low = mid + 1

    return ans

# print(minEatingSpeed([25, 12, 8, 14, 19],5)) Output -> 25