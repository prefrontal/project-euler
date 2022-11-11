#!/usr/bin/python

# Project Euler Problem 68
#
# Consider the following "magic" 3-gon ring, filled with the numbers 1 to 6,
# and each line adding to nine.
# (https://projecteuler.net/problem=68)
# 
# Working clockwise, and starting from the group of three with the numerically lowest
# external node (4,3,2 in this example), each solution can be described uniquely. For
# example, the above solution can be described by the set: 4,3,2; 6,2,1; 5,1,3.
# 
# It is possible to complete the ring with four different totals: 9, 10, 11, and 12.
# There are eight solutions in total.
#
# Total	Solution Set
# 9	4,2,3; 5,3,1; 6,1,2
# 9	4,3,2; 6,2,1; 5,1,3
# 10	2,3,5; 4,5,1; 6,1,3
# 10	2,5,3; 6,3,1; 4,1,5
# 11	1,4,6; 3,6,2; 5,2,4
# 11	1,6,4; 5,4,2; 3,2,6
# 12	1,5,6; 2,6,4; 3,4,5
# 12	1,6,5; 3,5,4; 2,4,6
# 
# By concatenating each group it is possible to form 9-digit strings; the maximum string
# for a 3-gon ring is 432621513.
# 
# Using the numbers 1 to 10, and depending on arrangements, it is possible to form 
# 16- and 17-digit strings. What is the maximum 16-digit string for a "magic" 5-gon ring?
#
# Answer: 6531031914842725

from itertools import permutations 

# Going to brute force this one

perm = permutations([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) 
largest = 0

for i in list(perm):
    mat = [
          [i[0], i[5], i[6]],
          [i[1], i[6], i[7]],
          [i[2], i[7], i[8]],
          [i[3], i[8], i[9]],
          [i[4], i[9], i[5]]
          ]
    
    # See if we have a "magic" 5-gon ring
    if sum(mat[0]) == sum(mat[1]) == sum(mat[2]) == sum(mat[3]) == sum(mat[4]):
        starts = [mat[0][0], mat[1][0], mat[2][0], mat[3][0], mat[4][0]]
        
        # Check if the "10" is in the outer ring, which is needed for a 16-digit string
        if not 10 in starts:
            continue
        
        # Figure out where on the outside to start
        minimum = min(starts)
        min_idx = starts.index(minimum)
    
        output = ""
    
        # Build the string
        for i in range(5):
            idx = (min_idx + i) % 5
            output += str(mat[idx][0]) + str(mat[idx][1]) + str(mat[idx][2])
            
        # Test the string
        if int(output) > largest:
            largest = int(output)
            
print("The largest 16-digit string is:", largest)
        
        
    
        
    