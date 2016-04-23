# Project Euler Problem 36
#
# The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
# 
# (Please note that the palindromic number, in either base, may not include leading zeros.)
#
# Answer: 872187

MAXIMUM_VALUE = 1000000;

#
# Determines if an integer is a decimal palindrome through string comparison 
#
def IsDecimalPalindrome (value)
	# Convert the integer to a string
	# Reverse the string and compare to the original
	forward = value.to_s
	reverse = value.to_s.reverse
	
	if (forward == reverse)
		return true
	end

	return false
end

#
# Determines if a 32-bit integer is a binary palindrome through string comparison 
#
def IsBinaryPalindrome (input)
	
	# Start at highest-order bit of int
	position = (0.size * 8) - 1
	
	# Determine the position of the first non-zero character
	while (position >= 0)
		positionValue = (input & ( 1 << position )) >> position
		
		if (positionValue == 1)
			break
		end
			
		position -= 1
	end
	
	forward = ""
	
	# Now load the stringstream with the remaining digits
	while (position >= 0)
		positionValue = (input & ( 1 << position )) >> position
		
		forward += positionValue.to_s
		
		position -= 1;
	end
	
	reverse = forward.reverse
	
	if (forward == reverse)
		return true
	else
		return false
	end
end

finalSum = 0;

for i in 0...MAXIMUM_VALUE
	if (IsDecimalPalindrome(i) && IsBinaryPalindrome(i))
		finalSum += i
	end
end

puts "The final sum is: #{finalSum}"