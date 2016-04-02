# Project Euler Problem 7, Ruby
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13
# we can see that the 6th prime is 13.
# What is the 10,001st prime number?
#
# Answer: 104743

TARGET_VALUE = 10001;

#
# Brute-force check to determine if a number is prime
# Used to validate the Sieve results.  Could also be
# used when the Sieve would use too much memory.
#
def IsPrime (testValue)
	# Since we do a quick check before calling this method
	# we can start checking for primes at 12 instead of 2
	for i in 12...testValue
		if ((testValue % i) == 0)
			return false
		end
	end
	
	return true
end

#
# Find specific primes according to their ordinal position
#

# Starting at thirteen means we can do some modulo checks for speed
currentValue = 13;
primeCounter = 6;

while (true)
	currentValue += 2;
	
	# Optimize here to avoid full iteration in IsPrime()
	if ( (0 == (currentValue%3)) || (0 == (currentValue%5)) || (0 == (currentValue%7)) || (0 == (currentValue%11)) )
		next
	end
	
	# Check the full value set
	if (IsPrime(currentValue))
		primeCounter += 1
	end
	
	if (TARGET_VALUE == primeCounter)
		break
	end
end

puts "The #{TARGET_VALUE} prime is: #{currentValue}"