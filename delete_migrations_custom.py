def sum_ignore_and_find_extremes(arr):
    min_sum = float('inf')  # Initialize with positive infinity
    max_sum = float('-inf') # Initialize with negative infinity
    
    for i in range(len(arr)):
        current_sum = sum(arr[:i] + arr[i+1:])  # Sum of elements excluding the current one
        min_sum = min(min_sum, current_sum)     # Update minimum sum
        max_sum = max(max_sum, current_sum)     # Update maximum sum
    
    return min_sum, max_sum
    
arr = [1,2,3,4,5]
min_sum, max_sum = sum_ignore_and_find_extremes(arr)
print("Lowest sum:", min_sum)
print("Highest sum:", max_sum)    