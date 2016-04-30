# Project Euler Problem 51, Ruby
#
# By replacing the 1st digit of the 2-digit number *3, it turns out that six 
# of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
#
# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 
# 5-digit number is the first example having seven primes among the ten
# generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 
# 56773, and 56993. Consequently 56003, being the first member of this family, 
# is the smallest prime with this property.
# 
# Find the smallest prime which, by replacing part of the number (not necessarily 
# adjacent digits) with the same digit, is part of an eight prime value family.
#
# Answer: 121313

MAXIMUM_VALUE = 1000000
TARGET_PRIME_COUNT = 8

# --PRIME HELPERS----------------------------------------------------------------

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

# --VECTOR HELPERS--------------------------------------------------------------

# Take an integer and create a vector of the digits
def IntToVector (input)
	digits = []
	temp = input
	
	while (temp > 0)
		digits.push(temp % 10)
		temp /= 10
	end
	
	digits.reverse!
	return digits
end

# Take a vector of single integers and generate a whole integer value
def VectorToInt (input)
	output = 0
	
	for i in 0...input.count
		output += input[i] * 10**(input.count-i-1)
	end

	return output
end

# --MAIN METHODS--------------------------------------------------------------

# This is a tough one. I admit I had to look it up to get some help.
#
# From: http:#www.mathblog.dk/project-euler-51-eight-prime-family/
# 1) The repeated digits have to be a 0, 1, or 2 to have an eight-member family
# 2) There must be three repeating digits
# 3) Last digit cannot be repeating
# 4) The lowest prime will have five or six digits

def IsEightMemberPrimeFamily (input, index1, index2, index3)
	primeCount = 0
	temp = input
	
	# Swap positions with new value and evaluate primeness
	# The input is guaranteed to be prime, but we will iterate over it anyway
	for i in 0...10
		temp[index1] = i
		temp[index2] = i
		temp[index3] = i
		
		# Continue if the number starts with zero
		if (temp[0] == 0)
			next
		end
		
		newValue = VectorToInt(temp)

		if (IsPrime(newValue))
			primeCount += 1
		end
	end
	
	return (TARGET_PRIME_COUNT == primeCount)
end

def EvaluateNumber (input)
	# Setup pattern indices
	indices =
	[
		[2, 3, 4],
		[1, 3, 4],
		[1, 2 ,4],
		[1, 2, 3],
		[0, 3, 4],
		[0, 2, 4],
		[0, 2, 3],
		[0, 1, 4],
		[0, 1, 3],
		[0, 1, 2]
	]

	foundAnswer = false

	# Iterate over all patters, evaluating if thery are candidates
	for i in 0...10
		# Skip some permutations if there are only five digits
		if ((input.count == 5) && (indices[i][2] == 4))
			next
		end

		# Evaluate digit equivalency
		if (input[indices[i][0]] != input[indices[i][1]])
			next
		elsif (input[indices[i][0]] != input[indices[i][2]])
			next
		elsif (input[indices[i][1]] != input[indices[i][2]])
			next
		end
		
		# Evaluate if it is an eight member prime family
		if IsEightMemberPrimeFamily(input, indices[i][0], indices[i][1], indices[i][2])
			foundAnswer = true 
		end
	end
	
	return foundAnswer
end


primes = GetPrimes(MAXIMUM_VALUE)
finalAnswer = 0

for it in primes
	foundSolution = false
	digits = IntToVector(it)

	# Search five- and six-digit numbers for a solution
	if (it < 10000)
		next
	elsif (it < 1000000)
		foundSolution = EvaluateNumber(digits)
	end

	if (foundSolution)
		finalAnswer = it
		break
	end
end

puts "The lowest prime in an eight member family is: #{finalAnswer}"
