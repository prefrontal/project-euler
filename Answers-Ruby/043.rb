# Project Euler Problem 43
#
# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of 
# each of the digits 0 to 9 in some order, but it also has a rather 
# interesting sub-string divisibility property.
# 
# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. 
# In this way, we note the following:
# 
# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17
#
# Find the sum of all 0 to 9 pandigital numbers with this property.
#
# Answer: 
# 16695334890

# Computes the next lexicographical permutation of the specified
# array of numbers in place, returning whether a next permutation
# existed. (Returns false when the argument is already the last
# possible permutation.)
#
# https://www.nayuki.io/page/next-lexicographical-permutation-algorithm
#
def nextPermutation (number)
	# Find non-increasing suffix
	i = number.size - 1
	
	while (i > 0 && number[i - 1].to_i >= number[i].to_i)
		i -= 1
	end
		
	if (i <= 0)
		return false
	end
	
	# Find successor to pivot
	j = number.size - 1
	
	while (number[j].to_i <= number[i - 1].to_i)
		j -= 1
	end
	
	temp = number[i - 1]
	number[i - 1] = number[j]
	number[j] = temp

	# Reverse suffix
	j = number.size - 1
	
	while (i < j) 
		temp = number[i]
		number[i] = number[j]
		number[j] = temp
		i += 1
		j -= 1
	end
	
	return true
end

def IsTargetPandigital (number)
	divisors = [2,3,5,7,11,13,17]

	for i in 0..6
		# We start counting at 0 in the loop,
		# but the problem indices begin at one
		value = number[i+1..i+3].to_i

		# Check the next divisor in the array
		if ((value % divisors[i]) != 0)
			return false
		end
	end

	return true
end

pandigitalSum = 0
number = "0123456789"

# We will permute the characters in the number string,
# checking if each permutation is a pandigital target
loop do
	if (IsTargetPandigital(number))
		pandigitalSum += number.to_i
	end
	
	break if (!nextPermutation(number))
end

puts "The sum of pandigital numbers is: #{pandigitalSum}"
	