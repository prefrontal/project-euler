# Project Euler Problem 29, Ruby
#
# Consider all integer combinations of a^b for 2 ≤ a ≤ 5 and 2 ≤ b ≤ 5:
#
# 22=4, 23=8, 24=16, 25=32
# 32=9, 33=27, 34=81, 35=243
# 42=16, 43=64, 44=256, 45=1024
# 52=25, 53=125, 54=625, 55=3125
#
# If they are then placed in numerical order, with any repeats removed, 
# we get the following sequence of 15 distinct terms:
# 
# 4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125
# 
# How many distinct terms are in the sequence generated 
# by a^b for 2 ≤ a ≤ 100 and 2 ≤ b ≤ 100?
#
# Answer: 9183

# This one is easy to do with Set enforcing unique values

require 'set'

MAXIMUM_VALUE = 100;

sequences = Set.new

# Generate sequence set
for a in 2..MAXIMUM_VALUE
	for b in 2..MAXIMUM_VALUE
		sequences.add (a**b)
	end
end

# Report sequence count
puts "The number of unique sequences is: #{sequences.size()}"