# Project Euler Problem 49
#
# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, 
# is unusual in two ways: 
# (i) each of the three terms are prime, and, 
# (ii) each of the 4-digit numbers are permutations of one another.
# 
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, 
# exhibiting this property, but there is one other 4-digit increasing sequence.
# 
# What 12-digit number do you form by concatenating the three terms in this sequence?
# 
# Answer: 2969 6299 9629

# We will be working with four-digit integers
MINIMUM_VALUE = 1000
MAXIMUM_VALUE = 9999

# This is the value we already know
GIVEN_VALUE = 1487

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
# Brute-force check to determine if a number is prime
# Used to validate the Sieve results.  Could also be
# used when the Sieve would use too much memory.
#
def IsPrime (testValue)
	# There are no primes less than 2
	if (testValue < 2)
		return false
	end
	
	primeState = true
	
	for i in 2...testValue
		if ((testValue % i) == 0)
			primeState = false
		end
	end
	
	return primeState
end

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

# Determine if one number is a permutation of another
def IsPermutation (start, target)
	permutation = false
	
	# Convert the integer to a string
	startString = start.to_s
	
	# Check if each permutation of the string
	# matches the given integer target
	loop do
		number = startString.to_i
		
		if (number == target)
			permutation = true
		end
		
		break if (!nextPermutation(startString))
	end
	
	return permutation
end


primes = GetPrimes (MAXIMUM_VALUE)

# Loop over the list of primes, determining if they are a 
# candidate for the sequence based on given constraints
for i in 0...primes.count
	# Continue if less than our minimum or already known
	if ((primes[i] < MINIMUM_VALUE) || (primes[i] == GIVEN_VALUE))
		next
	end
		
	for j in (i+1)...primes.count
		difference = primes[j] - primes[i]
		thirdNumber = primes[j] + difference
		
		# Continue if above the maximum or not prime
		if ((thirdNumber > MAXIMUM_VALUE) || (!IsPrime (thirdNumber)))
			next
		end
		
		# Determine if they are all permutations of each other
		if (IsPermutation(primes[i], primes[j]) && IsPermutation(primes[i], thirdNumber))
			puts "The sequence is: #{primes[i]} #{primes[j]} #{thirdNumber}"
		end
	end
end
