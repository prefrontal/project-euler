# Project Euler Problem 40, Ruby
#
# An irrational decimal fraction is created by concatenating the positive integers:
#
# 0.123456789101112131415161718192021...
#
# It can be seen that the 12th digit of the fractional part is 1.
#
# If dn represents the nth digit of the fractional part, find the value of the following expression.
#
# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
#
# Answer: 210

TARGET_INDICES = [1, 10, 100, 1000, 10000, 100000, 1000000]
NUM_TARGETS = 7

# We will be multiplying later, so a value of one here
finalProduct = 1
lastNumber = 0

maximumDigitCount = TARGET_INDICES[NUM_TARGETS-1];
currentDigitCount = 0
targetIndex = 0

while (currentDigitCount <= maximumDigitCount)
	lastNumber += 1
	
	digits = lastNumber.to_s.split("")
	
	for digit in digits
		currentDigitCount += 1
		if (currentDigitCount == TARGET_INDICES[targetIndex])
			targetIndex += 1
			finalProduct *= digit.to_i
		end
	end
end

puts "The final product is: #{finalProduct}"
