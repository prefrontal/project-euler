#!/usr/bin/python

# Project Euler Problem 39
#
# If p is the perimeter of a right angle triangle with integral 
# length sides, {a,b,c}, there are exactly three solutions for p = 120.
#
# {20,48,52}, {24,45,51}, {30,40,50}
#
# For which value of p ≤ 1000, is the number of solutions maximised?
#
# Answer: 840

MAXIMUM_VALUE = 1000
SMALLEST_TRIANGLE_SUM = 12

maximumSolutionsAt = 0
maximumSolutionCount = 0

for i in range(SMALLEST_TRIANGLE_SUM, MAXIMUM_VALUE):
	solutionCount = 0
	
	# We start at one because that is the smallest size we can have
	# for the triangle. We end at i-2 because the other sides of the
	# triangle have this minimum size as well.
	for a in range(1, i-2):
		# One is again the smallest size possible. The maximum size
		# is i-a-1, since it will be the total minus the first side
		# and the hypotaneuse can be one (but it never will be).
		for b in range(1,i-a-1):
			# Use Pythagorean Theorem to determine if we have a solution
			legsValue = a*a + b*b
			hypotaneuseValue = (i - a - b) * (i - a - b)
			
			if (legsValue == hypotaneuseValue):
				solutionCount += 1

	if (solutionCount > maximumSolutionCount):
		maximumSolutionsAt = i
		maximumSolutionCount = solutionCount

print ("The number of solutions is maximized at: ", maximumSolutionsAt)
print ("The number of solutions was: ", maximumSolutionCount)