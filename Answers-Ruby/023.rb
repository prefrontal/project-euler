# Project Euler Problem 23
#
# A perfect number is a number for which the sum of its proper divisors is 
# exactly equal to the number. For example, the sum of the proper divisors of
# 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less 
# than n and it is called abundant if this sum exceeds n.
# 
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest 
# number that can be written as the sum of two abundant numbers is 24. By mathematical 
# analysis, it can be shown that all integers greater than 28123 can be written as 
# the sum of two abundant numbers. However, this upper limit cannot be reduced any 
# further by analysis even though it is known that the greatest number that cannot be 
# expressed as the sum of two abundant numbers is less than this limit.
# 
# Find the sum of all the positive integers which cannot be 
# written as the sum of two abundant numbers.
#
# Answer: 4179871
	
MAX_INTEGER = 28123	

# Brute-force determination of numeric abundance
def IsAbundant (value)
	divisors = Array.new
	
	for i in 1...value
		if (0 == value % i)
			divisors.push(i)
		end
	end

	divisorSum = 0;
	
	for it in divisors
		divisorSum += it
	end

	if (value < divisorSum)
		return true
	else
		return false
	end
	
end

abundantNumbers = Array.new
numberList = Array.new(MAX_INTEGER,false)

# First, generate a list of abundant numbers
for i in 12...MAX_INTEGER
	if (IsAbundant (i))
		abundantNumbers.push(i)
	end
end

# Next, add each abundant number to every other possible
# abundant number in the vector.
for m in 0...abundantNumbers.size()
	for n in 0...abundantNumbers.size()
		position = abundantNumbers[m] + abundantNumbers[n]
		
		# Ruby arrays behave differently than C++, check the position
		next if position > MAX_INTEGER
		
		numberList[position] = true
	end
end

# Go through the list of numbers that cannot be expressed as
# two abundant numbers and generate the final sum.
finalSum = 0
puts numberList.size()
for p in 1...numberList.size()
	if (!numberList[p])
		finalSum += p
	end
end

puts "The final sum is: #{finalSum}"







