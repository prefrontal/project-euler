# Project Euler Problem 41
#
# We shall say that an n-digit number is pandigital if it makes 
# use of all the digits 1 to n exactly once. For example, 2143 
# is a 4-digit pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?
#
# Answer: 7652413

MAXIMUM_VALUE = 987654321

# Sieve of Eratosthenes
# Simple, ancient algorithm for finding all prime numbers up to any given limit.
# It does so by iteratively marking as composite (i.e., not prime) the multiples
# of each prime, starting with the multiples of 2.
#
def GetPrimes (maximum)	
	# Construct and execute the Sieve
	sqrtMaximum = Math.sqrt(maximum).to_i
	primeTracker = Array.new(maximum,true)
	
	for i in 2...sqrtMaximum
		next if !primeTracker[i]
		
		start = i + i
		
		for j in (start...maximum).step(i)
			primeTracker[j] = false;
		end
	end
	
	primes = []
	
	# Generate the list of primes to return
	for k in 2...maximum
		primes.push(k) if primeTracker[k]
	end
	
	return primes
end

# Determine if an integer is a pandigital number
def IsPandigital (input)
	# Convert the integer to a string and sort
	inputString = input.to_s.chars.sort.join
	
	# Create a sorted pandigital string that
	# has the same length as the input
	target = ""
	for i in 1..inputString.size
		target << i.to_s
	end

	# Determine pandigitality
	if (inputString == target)
		return true
	else
		return false
	end
end

# Determine the largest pandigital prime
# This isn't the most optimal solution since it takes about three
# minutes to get the final answer. I am sure it could be optimized.

maxPandigital = 0
primes = GetPrimes(MAXIMUM_VALUE)
puts "Number of primes: #{primes.count}"

for it in primes
	isPandigital = IsPandigital(it)

	if (isPandigital && (it > maxPandigital))
		maxPandigital = it
	end
end

puts "The maximum pandigital is: #{maxPandigital}"
