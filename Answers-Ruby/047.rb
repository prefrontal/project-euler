# Project Euler Problem 47
#
# The first two consecutive numbers to have two distinct prime factors are:
# 
# 14 = 2 × 7
# 15 = 3 × 5
# 
# The first three consecutive numbers to have three distinct prime factors are:
# 
# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.
# 
# Find the first four consecutive integers to have four distinct prime factors. 
# What is the first of these numbers?
#
# Answer: 134043

TARGET_FACTOR_COUNT = 4
TARGET_RUN_LENGTH = 4
MAXIMUM_VALUE = 150000

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
	
	# Generate the list of primes to return
	for k in 2...maximum
		if (primeTracker[k] == true)
			primes.push(k)
		end
	end
	
	return primes
end

#
# Get a list of the prime factors of a given integer
# This function expects to have a valid list of primes passed in
#
def GetPrimeFactors (number, primes)
	factorCount = 0
	lastFactor = 0
	remainder = number
	
	# Keep looping until we reach the end of our dividing
	while (remainder != 1 )
		# Determine the lowest prime that we can use to divide the remainder
		for i in 0...primes.count
			if (remainder <= 1) # Sanity check
				break
			end
			
			# Found a prime factor
			if (0 == remainder % primes[i])
				# If the current factor is the same as
				# the last one then don't count it
				if (primes[i] != lastFactor)
					factorCount += 1
					lastFactor = primes[i]
				end
				
				remainder /= primes[i]
				break
			end
		end
	end

	return factorCount
end

# We are using brute force for the prime factor search
# This takes about sixteen seconds on my machine
# There are clearly some ways that we could speed this up

primes = GetPrimes(MAXIMUM_VALUE)

leadValue = 0
consecutivePrimeCount = 0

# Examine all integers up to the maximum value
# Start at one so we don't try to factor zero
for i in 1...MAXIMUM_VALUE   
	factorCount = GetPrimeFactors(i, primes);
	
	# Reset the counter if we didn't get the right number of factors
	if (factorCount != TARGET_FACTOR_COUNT)
		consecutivePrimeCount = 0
		next
	end
	
	# If this is the first in a new potential sequence 
	# then keep track of the lead integer value
	if (consecutivePrimeCount == 0)
		leadValue = i
	end
	
	consecutivePrimeCount += 1
	
	# Determine if we have found the target run
	if (consecutivePrimeCount == TARGET_RUN_LENGTH)
		break
	end
end

puts "The target integer is: #{leadValue}"