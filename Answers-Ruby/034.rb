# Project Euler Problem 34
#
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# 
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
# 
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.
#
# Answer: 40730

MAXIMUM_VALUE = 100000;

# Recursively calculate factorial value of an integer
def factorial (x) 
	# Check for appropriate positive value
	if (x < 0)
		return 0
	end
	
	# Special case at a value of zero and one
	if ((x == 0) || (x == 1))
		return 1
	end
	
	# Calculate factorial
	if (x == 1) 
		return x
	end

	return x * factorial(x - 1)
end

# Brute force search between 10 and a predefined maximum value

finalSum = 0;

for i in 10...MAXIMUM_VALUE
	temp = i
	factorialSum = 0

	while (temp > 0)
		factorialSum += factorial (temp % 10)
		temp /= 10
	end
		
	if (i == factorialSum)
		finalSum += i
	end
end

puts "The final sum is: #{finalSum}"
