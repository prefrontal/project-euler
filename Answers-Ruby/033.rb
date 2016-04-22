# Project Euler Problem 33
#
# The fraction 49/98 is a curious fraction, as an inexperienced mathematician 
# in attempting to simplify it may incorrectly believe that 49/98 = 4/8, 
# which is correct, is obtained by cancelling the 9s.
# 
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
# 
# There are exactly four non-trivial examples of this type of fraction, 
# less than one in value, and containing two digits in the numerator and denominator.
# 
# If the product of these four fractions is given in its lowest common 
# terms, find the value of the denominator.
#
# Answer: 100

def ComputeSecondQuotient (numerator, denominator)
	# Don't divide by zero
	if (denominator == 0)
		return 0.0
	end
		
	# The quotient should be less than one
	if (numerator >= denominator)
		return 0.0
	end
		
	return (numerator).to_f / (denominator).to_f;
end


# Find the greatest common divisor of two numbers based on Stein's Algorithm
# From: https:#en.wikipedia.org/wiki/Binary_GCD_algorithm
def GreatestCommonDivisor (u, v)

	# GCD(0,v) == v; GCD(u,0) == u, GCD(0,0) == 0
	return v if (u == 0) 
	return u if (v == 0) 
	
	shift = 0 
	# Let shift := lg K, where K is the greatest 
	# power of 2 dividing both u and v
	loop do
		u = u >> 1
		v = v >> 1
		shift += 1
		break if (((u|v) & 1) != 0)
	end
	
	while ((u & 1) == 0)
		u = u >> 1
	end
	 
	# From here on, u is always odd
	loop do 
		# Remove all factors of 2 in v -- they are not common
		# Note: v is not zero, so while will terminate
		while ((v & 1) == 0)  # Loop X
			v = v >> 1
		end

		# Now u and v are both odd. Swap if necessary so u <= v,
		# then set v = v - u (which is even). For bignums, the
		# swapping is just pointer movement, and the subtraction
		# can be done in-place
		if (u > v) 
			t = v
			v = u
			u = t
		end  # Swap u and v.
		
		v = v - u # Here v >= u.
		
		break if (v == 0)
	end

	# Restore common factors of 2
	return (u << shift)
end

finalNumerator = 1
finalDenominator = 1

# The numerator and the denominator will both have two digits
# The quotient will always be less than one, so we can shorten the inner loop
for i in 10...100
	for j in i...100
		quotient = (i).to_f / (j).to_f
		
		ib = i % 10
		ia = (i / 10) % 10
		
		jb = j % 10
		ja = (j / 10) % 10
		
		foundMatch = false
		secondQuotient = 0.0
		
		if (ia == ja)
			foundMatch = true
			secondQuotient = ComputeSecondQuotient(ib, jb)
		end
			
		if (ib == jb)
			foundMatch = true
			secondQuotient = ComputeSecondQuotient(ia, ja)
		end
			
		if (ia == jb)
			foundMatch = true
			secondQuotient = ComputeSecondQuotient(ib, ja);
		end
			
		if (ib == ja)
			foundMatch = true
			secondQuotient = ComputeSecondQuotient(ia, jb)
		end

		# Continue to next iteration if we didn't find a match
		if (!foundMatch)
			next
		end
			
		# Eliminate trivial cases
		if (ib == 0 && jb == 0)
		   next
		end

		if (quotient == secondQuotient)
			finalNumerator *= i
			finalDenominator *= j
		end
	end
end

puts "#{finalNumerator} / #{finalDenominator}"

answer = finalDenominator / GreatestCommonDivisor(finalNumerator, finalDenominator)
puts "Final answer: #{answer}"
