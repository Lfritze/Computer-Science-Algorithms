Find all the pairs of two integers in an unsorted array 
that sum up to a given S. For example, 
if the array is [3, 5, 2, -4, 8, 11] and the sum is 7, 
your program should return [[11, -4], [2, 5]] 
because 11 + -4 = 7 and 2 + 5 = 7

def adder(array, n, sum):
  # arr1 = []
  # arr2 = []
  # for x in array:
  #   for a in array:
  #     if x + a = sum:
  #       arr1.append(x, a)
  

  for i in range(0, n): 
        for j in range(i + 1, n): 
            if arr[i] + arr[j] == sum: 
                count += 1
      
    return count
  