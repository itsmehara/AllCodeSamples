# List of tuples
data = [(1, 'apple'), (2, 'banana'), (3, 'cherry')]

# Sorting using lambda
sorted_data = sorted(data, key=lambda x: x[1])

print(sorted_data)  # Output: [(1, 'apple'), (2, 'banana'), (3, 'cherry')]
