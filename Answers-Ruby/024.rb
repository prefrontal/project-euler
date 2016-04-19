# Project Euler Problem 24
#
# A permutation is an ordered arrangement of objects. For example, 
# 3124 is one possible permutation of the digits 1, 2, 3 and 4. If 
# all of the permutations are listed numerically or alphabetically, 
# we call it lexicographic order. 
# The lexicographic permutations of 0, 1 and 2 are:
# 
# 012   021   102   120   201   210
# 
# What is the millionth lexicographic permutation of the 
# digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
# 
# Answer: 2783915460

PERMUTATION_TARGET = 1000000

# Computes the next lexicographical permutation of the specified
# array of numbers in place, returning whether a next permutation
# existed. (Returns false when the argument is already the last
# possible permutation.)
#
# https:#www.nayuki.io/page/next-lexicographical-permutation-algorithm
#
def nextPermutation (array)

	# Find non-increasing suffix
	i = array.count - 1;
	
	while (i > 0 && array[i - 1] >= array[i])
		i -= 1
	end
		
	if (i <= 0)
		return false;
	end
	
	# Find successor to pivot
	j = array.count - 1;
	
	while (array[j] <= array[i - 1])
		j -= 1
	end
	
	temp = array[i - 1];
	array[i - 1] = array[j];
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

# This is the first lexicographic permutation
digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# Initial value is first permutation
permutationCount = 1

while (permutationCount < PERMUTATION_TARGET)
	nextPermutation (digits) 
	permutationCount += 1
end

puts "Permutation value is: "

for i in 0...10
	print "#{digits[i]}"
end
