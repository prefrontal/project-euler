# Project Euler Problem 50
#
# The prime 41, can be written as the sum of six consecutive primes:
#
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# 
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
# 
# The longest sum of consecutive primes below one-thousand that 
# adds to a prime, contains 21 terms, and is equal to 953.
# 
# Which prime, below one-million, can be written as the sum of the most consecutive primes?
# 
# Answer: 997651

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
	
	# Generate the list of primes to return
	for k in 2...maximum
		if (primeTracker[k] == true)
			primes.push(k)
		end
	end
	
	return primes
end

# This answer is computationally inefficient. Since we work backward over the primes
# array we actually find the answer within a few seconds. However, it takes a significant
# amount of time to go through the entire primes array to know the definitive answer.
# This could/should be reworked with a another strategy that is more optimal.

primes = GetPrimes (MAXIMUM_VALUE)

# For loop efficieny, cache the size
numPrimes = primes.count

maxPrimeCount = 0
maxPrime = 0

# Loop over all primes in the vector in reverse since we assume
# our target is a value closer to the top value than the bottom
for i in (numPrimes-1).downto(0)
	# This loop defines the starting point for 
	# calculating the consecutive sums
	for j in (0).upto(numPrimes)
		primeCount = 0
		primeSum = 0
		
		# Calculate the consecutive prime sum
		while (primeSum < primes[i])
			if (j+primeCount >= numPrimes)
				break
			end
				
			primeSum += primes[j+primeCount]
			primeCount += 1
		end
			
	    # Count it if we hit the prime exactly and have the highest count
		if ((primeSum == primes[i]) && (primeCount > maxPrimeCount))
			maxPrime = primes[i]
			maxPrimeCount = primeCount
		end
	end
end

puts "The target prime is: #{maxPrime}"
