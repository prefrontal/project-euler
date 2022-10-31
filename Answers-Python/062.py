#!/usr/bin/python

# Project Euler Problem 62
#
# The cube, 41063625 (3453), can be permuted to produce two other cubes: 56623104 (3843)
# and 66430125 (4053). In fact, 41063625 is the smallest cube which has exactly three
# permutations of its digits which are also cube.
#
# Find the smallest cube for which exactly five permutations of its digits are cube.
#
# Answer:

from collections import defaultdict


def largest_permutation(n):
    s = [i for i in str(n)]
    s.sort(reverse=True)
    test_val = int("".join(s))
    return test_val


# Track the values associated with each permutation
# Use a default dict to get an empty list on the first call
perm_tracker = defaultdict(list)

# Loop until we find a permutation with five cubes
n = 0
while True:
    n += 1
    cube = n**3
    cube_perm = largest_permutation(cube)
    perm_tracker[cube_perm].append(cube)

    if len(perm_tracker[cube_perm]) == 5:
        print(perm_tracker[cube_perm])
        print("Answer is: ", perm_tracker[cube_perm][0])
        exit()