# Project Euler 46
#
# It was proposed by Christian Goldbach that every odd composite 
# number can be written as the sum of a prime and twice a square.
# 
# 9 = 7 + 2×1^2
# 15 = 7 + 2×2^2
# 21 = 3 + 2×3^2
# 25 = 7 + 2×3^2
# 27 = 19 + 2×2^2
# 33 = 31 + 2×1^2
# 
# It turns out that the conjecture was false.
# 
# What is the smallest odd composite that cannot be written 
# as the sum of a prime and twice a square?
#
# Answer: 5777

MAXIMUM_VALUE = 10000
STARTING_VALUE = 33

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
# Generate all primes up to a given maximum value
#
def GetSquares (maximum)
	squares = []
	
	index = 0;
	
	while (index*index < maximum)
		squares.push(index*index);
		index += 1
	end
	
	return squares
end

lowestComposite = 0;

primes = GetPrimes (MAXIMUM_VALUE)
squares = GetSquares (MAXIMUM_VALUE)

# Main loop evaluating odd composite numbers
# To keep things simple, we will not exclude prime numbers,
# which will always have a solution anyway as prime + 0^2
for i in (STARTING_VALUE...MAXIMUM_VALUE).step(2)
	hasNoSolution = true;
	
	# Loop iterating over primes
	for j in 0...primes.count
		# Break the loop if we have exceeded the number
		if (j > i)
			break
		end
		
		# Loop iterating over squares
		for k in 0...squares.count
			# Break the loop if we have exceeded the number
			if (k > i)
				break
			end
			
			if (i == primes[j] + 2*squares[k])
				hasNoSolution = false
			end
		end
	end
	
	# Have we found the target?
	if (hasNoSolution)
		lowestComposite = i
		break
	end
end

puts "The lowest odd composite without a solution is: #{lowestComposite}"
