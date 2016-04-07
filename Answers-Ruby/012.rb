# Project Euler Problem 12, Ruby
#
# The sequence of triangle numbers is generated by adding the natural numbers. 
# So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. 
# The first ten terms would be:
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# 
# Let us list the factors of the first seven triangle numbers:
# 1: 1
# 3: 1,3
# 6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
#
# We can see that 28 is the first triangle number to have over five divisors.
# What is the value of the first triangle number to have over five hundred divisors?
#
# Answer: 76576500

# Notes: this brute-force method can take a while (1256s).
# Tried a modified sieve. Dramatic decrease in time ().
# Last number in the addition sequence was 12375

DIVISOR_TARGET = 500

currentNumber = 0;
currentSum = 0;

iteration = 0;

while (true)
	# Identify current triangle number
	currentNumber += 1
	currentSum += currentNumber;
	
	factorCount = 0;
	
	for i in 1..currentSum
		if (0 == (currentSum % i))
			factorCount += 1
		end
	end
	
	# puts "N #{currentSum} F #{factorCount}"
	
	if (factorCount > DIVISOR_TARGET)
		break
	end
		
	iteration += 1   
		
	if (0 == (iteration % 1000))
		puts "#{currentSum} - #{factorCount}"
	end 
end

puts "The triangle number is: #{currentSum} #{currentNumber}"


