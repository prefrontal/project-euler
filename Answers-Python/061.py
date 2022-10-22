#!/usr/bin/python

# Project Euler Problem 61
#
# Triangle, square, pentagonal, hexagonal, heptagonal, and octagonal numbers are all
# figurate (polygonal) numbers and are generated by the following formulae:
#
# Triangle	 	P3,n=n(n+1)/2	 	1, 3, 6, 10, 15, ...
# Square	 	P4,n=n2	 	        1, 4, 9, 16, 25, ...
# Pentagonal	P5,n=n(3n−1)/2	 	1, 5, 12, 22, 35, ...
# Hexagonal	 	P6,n=n(2n−1)	 	1, 6, 15, 28, 45, ...
# Heptagonal	P7,n=n(5n−3)/2	 	1, 7, 18, 34, 55, ...
# Octagonal	 	P8,n=n(3n−2)	 	1, 8, 21, 40, 65, ...
#
# The ordered set of three 4-digit numbers: 8128, 2882, 8281, has three 
# interesting properties.
#
# 1. The set is cyclic, in that the last two digits of each number is the first two
# digits of the next number (including the last number with the first).
# 2. Each polygonal type: triangle (P3,127=8128), square (P4,91=8281), and pentagonal 
# (P5,44=2882), is represented by a different number in the set.
# 3. This is the only set of 4-digit numbers with this property.
#
# Find the sum of the only ordered set of six cyclic 4-digit numbers for which each
# polygonal type: triangle, square, pentagonal, hexagonal, heptagonal, and octagonal,
# is represented by a different number in the set.
#
# Answer: 28684

import itertools
from typing import List


# Returns two digits starting at position n
def get_digits(number, n):
	return number // 10**(n-1) % 100


# Pass in the function and calc all four-digit numbers
def calc_polygonal_numbers(poly_function):
	output = []
	n = 1
	
	while True:
		result = int(poly_function(n))

		if result > 9999:
			break
		elif result > 999:
			output.append(result)
		n += 1
			
	return output


# Generate all the poly numbers and store in a 2-d list
numbers: List[List[int]] = list()
numbers.append(calc_polygonal_numbers(lambda n: n * (n + 1) / 2))
numbers.append(calc_polygonal_numbers(lambda n: n * n))
numbers.append(calc_polygonal_numbers(lambda n: n * (3 * n - 1) / 2))
numbers.append(calc_polygonal_numbers(lambda n: n * (2 * n - 1)))
numbers.append(calc_polygonal_numbers(lambda n: n * (5 * n - 3) / 2))
numbers.append(calc_polygonal_numbers(lambda n: n * (3 * n - 2)))

# Ordering of the numbers matters, so we will work on every permutation
arrangements = list(itertools.permutations([0, 1, 2, 3, 4, 5]))

# For every two digits that end one number, ensure they match the two digits that start the next number
# If not, start with the next numbers
for arr in arrangements:
	# Get the first two numbers and compare digits
	for num0 in numbers[arr[0]]:
		for num1 in numbers[arr[1]]:
			if get_digits(num0, 1) != get_digits(num1, 3):
				continue

			# Compare number three to number two
			for num2 in numbers[arr[2]]:
				if get_digits(num1, 1) != get_digits(num2, 3):
					continue		

				# Compare number four to number three
				for num3 in numbers[arr[3]]:
					if get_digits(num2, 1) != get_digits(num3, 3):
						continue	

					# Compare number five to number three
					for num4 in numbers[arr[4]]:
						if get_digits(num3, 1) != get_digits(num4, 3):
							continue					

						# Compare number six to number five
						for num5 in numbers[arr[5]]:
							if get_digits(num4, 1) != get_digits(num5, 3):
								continue
								
							# Make sure that the last number wraps around to the first!
							if get_digits(num5, 1) == get_digits(num0, 3):
								print(num0, num1, num2, num3, num4, num5)
								print("Sum: ", num0 + num1 + num2 + num3 + num4 + num5)