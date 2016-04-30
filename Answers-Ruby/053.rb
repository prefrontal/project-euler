# Project Euler Problem 53
#
# There are exactly ten ways of selecting three from five, 12345:
# 
# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
# 
# In combinatorics, we use the notation, 5C3 = 10.
# 
# In general,
# 
# nCr = n! / r!(n−r)!
# where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
# 
# It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.
# How many, not necessarily distinct, values of nCr, for 1 ≤ n ≤ 100, are greater than one-million?
#
# Answer: 4075

UPPER_NCR_LIMIT = 100
UPPER_RESULT_LIMIT = 1000000

# We know that we will overflow a long long int for this question
# so we are cheating a bit here. Since we later just need to know
# if it is greater than an upper limit, we can hold the huge number 
# in a double knowing that it will work for the final comparison.

# Calculate the factorial of an input integer
# Return the value as a double and not a long long integer
def factorial (input)
	temp = input
	result = 1

	while (temp > 1) 
		result *= temp
		temp -= 1
	end
	
	return result
end

finalCount = 0
 
for n in 1..UPPER_NCR_LIMIT
	for r in 0..n
		if (factorial(n) / (factorial(r)*factorial(n-r)) >= UPPER_RESULT_LIMIT)
			finalCount += 1
		end
	end
end

puts "The final count is: #{finalCount}"