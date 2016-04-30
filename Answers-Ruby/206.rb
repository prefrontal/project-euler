# Project Euler Problem 206
#
# Find the unique positive integer whose square 
# has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.
#
# Answer: 1389019170

# Current implementation takes about 90s to complete
# Could probably be optimized further

# This should juuust fit in a long long integer
result = 0

# Starting point is approximate square root
# of first possible number (1020304050607080900)
base = 1010101010

# Keep going until we find the number or we overflow
# the long long integer...
loop do
	result = base * base
	found = true
	
	# Check every other digit in the number
	for i in (10).downto(0)
		if (result%10 != i%10)
			found = false
		end
		
		result /= 100
	end
	
	if (found)
		break
	end
	
	base += 1
end

puts "The number is: #{base}"