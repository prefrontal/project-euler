# Project Euler Problem 5, Ruby
#
# 2520 is the smallest number that can be divided by each of the numbers
# from 1 to 10 without any remainder. What is the smallest positive number 
# that is evenly divisible by all of the numbers from 1 to 20?
#
# Answer: 232792560

MAX_DIVISOR = 20

#
# Checks to see if a number is evenly divisible by all numbers between
# zero and a specified maximum divisor.
#
def IsEvenlyDivisible (value)	
	for i in 1...MAX_DIVISOR
		if 0 != (value % i)
			return false
		end
	end
		
	return true
end

#
# Finds the smallest number that is evenly divisible
#
currentValue = MAX_DIVISOR;

while (true)
	currentValue = currentValue + 1
	
	if IsEvenlyDivisible(currentValue)
		break
	end
end

puts "Smallest positive evenly divisible number: #{currentValue}"