# Project Euler Problem 37
#
# The number 3797 has an interesting property. Being prime itself, 
# it is possible to continuously remove digits from left to right, 
# and remain prime at each stage: 3797, 797, 97, and 7. Similarly 
# we can work from right to left: 3797, 379, 37, and 3.
#
# Find the sum of the only eleven primes that are both 
# truncatable from left to right and right to left.
#
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
#
# Answer: 748317

MAXIMUM_VALUE = 1000000
LOWER_PRIME_LIMIT = 7

#
# Sieve of Eratosthenes (integers)
# Simple, ancient algorithm for finding all prime numbers up to any given limit.
# It does so by iteratively marking as composite (i.e., not prime) the multiples
# of each prime, starting with the multiples of 2.
#
# Provides a vector of integers that represent the prime numbers under the maximum value
#
def GetPrimes (maximum)
	# Clear the input vector in case there is existing data
	primes = []
	
	# There are no primes less than 2
	if (maximum < 2)
		return
	end
	
	# Construct and execute the Sieve
	sqrtMaximum = Math.sqrt(maximum).to_i
	primeTracker = Array.new(maximum,true)
	
	primeTracker[1] = false
	
	for i in 2...sqrtMaximum
		if (!primeTracker[i])
			next
		end
		
		for j in ((i+i)...maximum).step(i)
			if (j < 0)  # Guard against integer overflow
				break
			end
			
			primeTracker[j] = false
		end
	end
	
	return primeTracker
end

# Determine if a number is a truncateable prime number
# Pass in a vector of boolean values representing prime numbers
# This dramatically speeds things up instead of recalculating
def IsTruncateablePrime (value, primes)
	if (value <= LOWER_PRIME_LIMIT)
		return false
	end
	
	# Truncate the number from right
	# Just start chopping off digits using a modulo
	# operation until there is nothing left
	right = value
	
	while (right > 0)
		if (!primes[right])
			return false
		end
		
		right /= 10
	end

	# Truncate the number from left
	# Instead of determining length, just start with modulo the 
	# maximum possible value and begin working down from there
	left = value
	j = MAXIMUM_VALUE
	
	while (j >= 10)
		left = left % j
		
		if (!primes[left])
			return false
		end
		
		j /= 10
	end

	return true
end

primes = GetPrimes(MAXIMUM_VALUE)
finalSum = 0

IsTruncateablePrime(797,primes)

for i in LOWER_PRIME_LIMIT...primes.count
	if (!primes[i])
		next
	end
	
	if (IsTruncateablePrime(i, primes))
		puts i
		finalSum += i
	end
end

puts "The final sum is: #{finalSum}"
