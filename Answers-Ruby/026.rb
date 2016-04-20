# Project Euler Problem 26
#
# A unit fraction contains 1 in the numerator. The decimal representation of the 
# unit fractions with denominators 2 to 10 are given:
# 
# 1/2	= 	0.5
# 1/3	= 	0.(3)
# 1/4	= 	0.25
# 1/5	= 	0.2
# 1/6	= 	0.1(6)
# 1/7	= 	0.(142857)
# 1/8	= 	0.125
# 1/9	= 	0.(1)
# 1/10	= 	0.1
#
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. 
# It can be seen that 1/7 has a 6-digit recurring cycle.
#
# Find the value of d < 1000 for which 1/d contains the longest 
# recurring cycle in its decimal fraction part.
#
# Answer: 983

MAXIMUM_VALUE = 1000

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

# Calculate pow(a,b) mod n
# For this problem std::pow(a,b)%n will overflow
# This template function calculates iteratively, avoiding the overflow
# From: http:#stackoverflow.com/questions/8496182/calculating-powa-b-mod-n
def modpow (base, exp, modulus) 
	base %= modulus
	result = 1
	
	while (exp > 0) 
		if 0 < (exp & 1)
			result = (result * base) % modulus
		end
		
		base = (base * base) % modulus
		exp >>= 1
	end
	
	return result
end

# Determine the cycle length of the fraction
# By solving the discrete logarithm
def DetermineCycleLength (value)
	for i in 1..value
		a = modpow(10,i,value)
		
		if (a == 1)
			return i
		end
	end
	
	return 0
end

# We only need to look at prime values
primes = GetPrimes (MAXIMUM_VALUE)

longestCycle = 0
longestDenominator = 0

for it in primes
	cycleLength = DetermineCycleLength (it)

	if (cycleLength > longestCycle)
		longestCycle = cycleLength
		longestDenominator = it
	end
end

puts "The denominator with the longest cycle is: #{longestDenominator} with length: #{longestCycle}"
