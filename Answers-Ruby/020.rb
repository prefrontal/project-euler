# Project Euler Problem 20, Ruby
#
# n! means n × (n − 1) × ... × 3 × 2 × 1
#
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!
#
# Answer: 648

FACTORIAL_NUMBER = 100
NUMBER_ARRAY_SIZE = 200

# So, 100! = 9.332622e+157. We will need to do something clever here.

# Use an integer array to hold the large number
# Init first element to one so we can multiply later
bigNumber = Array.new(NUMBER_ARRAY_SIZE,0)
bigNumber[0] = 1;

for i in 1..FACTORIAL_NUMBER
	carryOver = 0;
	
	for j in 0...NUMBER_ARRAY_SIZE
		temp = (bigNumber[j] * i) + carryOver;
		bigNumber[j] = temp % 10;
		carryOver = (temp/10).to_i
	end
end

finalSum = 0

for t in 0...NUMBER_ARRAY_SIZE
	finalSum += bigNumber[t]
end

puts "The final sum is: #{finalSum}"