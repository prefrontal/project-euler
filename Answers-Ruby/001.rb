# Project Euler, Problem 001, Ruby
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5, 
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.
#
# Answer: 233168

# Input parameters
START_VALUE = 1;
UPPER_LIMIT = 1000;

sumTotal = 0;

for i in START_VALUE...UPPER_LIMIT
	if ((i % 3) == 0)
		sumTotal += i;
	elsif ((i % 5) == 0)
		sumTotal += i;
	end
end

puts "Sum total: #{sumTotal}"