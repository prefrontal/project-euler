# Project Euler, Problem 003, Ruby
#
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?
#
# Answer: 6857

TARGET_NUMBER = 600851475143

def IsPrime (input)
	if (input < 2)
		return false
	end
	
	primeState = true;
	
	for i in 2...input
		if ((input % i) == 0)
			primeState = false
			break
		end
	end
	
	return primeState;
end

def DetermineLargestPrimeFactor (inputValue)
	largestFactor = 0
	sqrtInput = Math.sqrt(inputValue)

	for i in 3...sqrtInput
		if ((inputValue % i) == 0)
			if (IsPrime(i))
				 if (i > largestFactor)
					largestFactor = i
				 end 
			end     
		end      
	end
	
	return largestFactor;
end

factor = DetermineLargestPrimeFactor (TARGET_NUMBER)

puts "Largest prime factor: #{factor}"
