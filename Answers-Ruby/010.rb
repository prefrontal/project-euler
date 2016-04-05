# Project Euler Problem 10, Ruby
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.
#
# Answer: 142913828922

TARGET_NUMBER = 2000000;

#
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

#
# Find the sume of all primes up to a given number
#

myPrimes = GetPrimes(TARGET_NUMBER)
primeSum = 0

for it in myPrimes
	primeSum += it;
end
	
puts "The sum is: #{primeSum}"