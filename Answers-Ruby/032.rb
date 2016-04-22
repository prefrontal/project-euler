# Project Euler Problem 32, Ruby
#
# We shall say that an n-digit number is pandigital if it makes use 
# of all the digits 1 to n exactly once; for example, the 5-digit 
# number, 15234, is 1 through 5 pandigital.
# 
# The product 7254 is unusual, as the identity, 39 × 186 = 7254, 
# containing multiplicand, multiplier, and product is 1 through 9 pandigital.
# 
# Find the sum of all products whose multiplicand/multiplier/product 
# identity can be written as a 1 through 9 pandigital.
# 
# HINT: Some products can be obtained in more than one way so 
# be sure to only include it once in your sum.
# 
# Answer: 45228

require 'set'

# The first attempt was a brute-force search through millions of number combinations
# This was a bit extreme and took significant time to run.  Instead, we now only
# look over the permutations of a pandigital number, dividing each permutation into
# many divisions of multiplicand, multiplier, and product.  
# This takes twenty three seconds in Ruby.

# Computes the next lexicographical permutation of the specified
# array of numbers in place, returning whether a next permutation
# existed. (Returns false when the argument is already the last
# possible permutation.)
#
# https:#www.nayuki.io/page/next-lexicographical-permutation-algorithm
#
def nextPermutation (array)

	# Find non-increasing suffix
	i = array.count - 1
	
	while (i > 0 && array[i-1] >= array[i])
		i -= 1
	end
		
	if (i <= 0)
		return false
	end
	
	# Find successor to pivot
	j = array.count - 1
	
	while (array[j] <= array[i-1])
		j -= 1
	end
	
	temp = array[i-1]
	array[i-1] = array[j]
	array[j] = temp;

	# Reverse suffix
	j = array.count - 1;
	
	while (i < j) 
		temp = array[i];
		array[i] = array[j];
		array[j] = temp;
		i += 1
		j -= 1
	end
	
	return true;
end

# Generate an integer number from a subset of an array of single-digit integers
# There is no range checking for this function since we know the upper
# limit of the output will be less than 9876543 for this problem.
#
def IntegerFromArray (inputArray, startIndex, stopIndex)
	output = 0;
	count = 0;
	
	for i in startIndex..stopIndex
		output += inputArray[i] * (10**count)
		count += 1
	end
	
	return output;
end

digits = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  
values = Set.new

# Test each permutation of the pandigital number array
while (nextPermutation (digits))
	# Multiplicand generation loop. May be up to seven digits.
	for i in 0..6
		multiplicand = IntegerFromArray(digits, 0, i);
		
		# Multiplier loop. May be up to seven digits.
		for j in (i+1)..7
			multiplier = IntegerFromArray(digits, i+1, j);
			
			# Generate and test the product
			product = multiplier * multiplicand;
			
			if (product == IntegerFromArray(digits, j+1, 8))
				values.add(product)
			end
		end
	end
end

finalSum = 0

for it in values
	finalSum += it
end
	
puts "The final sum is: #{finalSum}"
