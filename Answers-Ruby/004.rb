# Project Euler Problem 4, Ruby
#
# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 
# 2-digit numbers is 9009 = 91 × 99. Find the largest 
# palindrome made from the product of two 3-digit numbers.
#
# Answer: 906609

#
# Determines if an integer is a palindrome through string comparison 
#
def IsPalindrome (value)
	reverseString = value.to_s.reverse!
	reverseInt = reverseString.to_i

	if (value == reverseInt)
		return true
	end

	return false
end

maxPalindrome = 0;

for i in 100...1000
	for j in 100...1000
		if (!IsPalindrome (i * j))
			next
		end
			 
		if ((i*j) > maxPalindrome)
			maxPalindrome = i * j;
		end
	end
end

puts "The largest palindrome is: #{maxPalindrome}"