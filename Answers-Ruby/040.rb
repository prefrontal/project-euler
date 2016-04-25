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

# Use a string to assemble the sequence
assembly = ""
maximumDigitCount = TARGET_INDICES[NUM_TARGETS-1];

while (assembly.chars.count <= maximumDigitCount)
	lastNumber += 1
	
	# When you use += ruby creates a temporal object which is result of str1 + str2. 
	# Then it overrides str1 variable with reference to the new built object. 
	# On other hand << modifies existing one.
	assembly << lastNumber.to_s
end

puts << "Reached digit goal at: #{lastNumber}"

# Find the product of the numbers at the target indices
for i in 0...7
	finalProduct *= assembly[TARGET_INDICES[i]-1].to_i
end

puts "The final product is: #{finalProduct}"
