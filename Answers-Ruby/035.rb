# Project Euler Problem 35
#
# The number, 197, is called a circular prime because all rotations 
# of the digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100: 
# 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?
#
# Answer: 55

MAXIMUM_VALUE = 1000000

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
	
	return primeTracker
end

# Moves the first character in a string to the end of the string
# This rotates the number, which is useful when looking for circular primes
def RotateNumber (input)
	first = input[0]
	input[0] = ''
	input += first
end

# Find the number of circular primes between 2 and an upper bound
primes = GetPrimes(MAXIMUM_VALUE)
primeCount = 0

for i in 2...MAXIMUM_VALUE
	# Is this number prime?
	if (!primes[i])
		next
	end
	
	# Convert number to string for permutation
	stringValue = i.to_s
	isCircularPrime = true
	
	# Determine if each rotation is prime
	for j in stringValue.split('')
		permutationValue = stringValue.to_i

		if (!primes[permutationValue])
			isCircularPrime = false
		end
			
		stringValue = RotateNumber(stringValue);
	end
	
	if (isCircularPrime)
		primeCount += 1
	end
end

puts "The count of circular primes is: #{primeCount}"
	