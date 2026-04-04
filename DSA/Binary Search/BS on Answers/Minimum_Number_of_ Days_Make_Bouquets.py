# Problem: Minimum Number of Days to Make m Bouquets

# Approach:
# Pick a middle day between smallest and largest bloom day 
# Check if you can make m bouquets using k flowers in a row by that day 
# If yes → try smaller days, if no → try bigger days

# Time Complexity: O(n * log(maxDay))

# Space Complexity: O(1)

# Code:
def minDays(bloomDay, m , k) :
        if m*k > len(bloomDay): return -1
        if k<1: return -1
        low = min(bloomDay)
        high = max(bloomDay)
        answer = -1
        while low<=high:
            mid = low+(high-low)//2

            count = 0
            bouquet = 0
            for b in bloomDay:
                if b <= mid:
                    count += 1
                    if count == k:
                        bouquet += 1
                        count = 0
                else:
                    count = 0
            
            if bouquet >= m:
                answer = mid
                high = mid-1
            else:
                low = mid + 1
        return answer

# print(minDays([1,10,3,10,2], 3,1))   -> Output: 3