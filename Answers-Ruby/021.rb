# Project Euler Problem 21, Ruby
#
# Let d(n) be defined as the sum of proper divisors of n 
# (numbers less than n which divide evenly into n).
#
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable 
# pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
# therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# 
# Evaluate the sum of all the amicable numbers under 10000.
#
# Answer: 31626
	
UPPER_LIMIT = 10000

# Brute force amicable number finder
def FindAmicableNumbers (limit)
	# We will use a vector of bools to track which numbers are amicable
	# This makes it much more straightforward to mark both numbers in the pair
	# Also, add one to the limit so our indices equal the actual number
	numberTracker = Array.new(limit+1,false)
	
	for i in 2..UPPER_LIMIT
		firstDivisorSum = 0;
		
		# Find the sum of the proper divisors
		for j in 1...i
			if (0 == (i%j))
				firstDivisorSum += j
			end
		end
		
		secondDivisorSum = 0;
		
		# Find the sum of the proper divisors for
		# the result of our previous loop
		for k in 1...firstDivisorSum
			if (0 == (firstDivisorSum%k))
				secondDivisorSum += k
			end
		end
		
		# Determine if amicable and track
		if ((secondDivisorSum == i) && (i != firstDivisorSum))
			numberTracker[i] = true;
			numberTracker[firstDivisorSum] = true;
			
			puts "Amicable pair: * #{i} * #{firstDivisorSum} * "
		end
	end
	
	return numberTracker
end

amicableNumbers = FindAmicableNumbers (UPPER_LIMIT)
amicableSum = 0

# Find the sum of the amicable numbers
for i in 1..UPPER_LIMIT
	if (amicableNumbers[i])
		amicableSum += i
	end
end

puts "The sum is: #{amicableSum}"	