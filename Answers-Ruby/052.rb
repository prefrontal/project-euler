# Project Euler Problem 52
#
# It can be seen that the number, 125874, and its double, 251748, 
# contain exactly the same digits, but in a different order.
#
# Find the smallest positive integer, x, such that 2
# x, 3x, 4x, 5x, and 6x, contain the same digits.
#
# Answer: 142857

MAXIMUM_VALUE = 1000000

def GetDigitVector (input)
	digits =[]
	temp = input
	
	while (temp > 0)
		digits.push(temp % 10)
		temp /= 10
	end
	
	return digits
end

def HasSameDigits (input)
	primary = GetDigitVector(input)
	primary.sort!
	
	for i in 2..6
		secondary = GetDigitVector(i*input)
		secondary.sort!
		
		if (primary.size() != secondary.size())
			return false
		end
			
		if (primary != secondary)
			return false
		end
	end
	
	return true;
end

finalAnswer = 0;

for i in 1...MAXIMUM_VALUE
	if (HasSameDigits(i))
		finalAnswer = i
		break
	end
end

puts "The target number is: #{finalAnswer}"