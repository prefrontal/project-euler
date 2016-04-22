# Project Euler Problem 31, Ruby
#
# In England the currency is made up of pound, £, and pence, p, 
# and there are eight coins in general circulation:
# 
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
# It is possible to make £2 in the following way:
# 
# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
#
# How many different ways can £2 be made using any number of coins?
#
# Answer: 73682

TARGET_VALUE = 200;

coinValues = [1, 2, 5, 10, 20, 50, 100, 200]

finalCount = 0

# Seven nested for loops isn't pretty, but it gets the job done
for a in 0..200
	for b in 0..100
		for c in 0..40
			for d in 0..20
				for e in 0..10
					for f in 0..4
						for g in 0..2
							temp = a + 2*b + 5*c + 10*d + 20*e + 50*f + 100*g;
								
							if (temp == TARGET_VALUE)
								finalCount += 1
							end
						end
					end
				end
			end
		end
	end
end

# Add one for the £2 coin. Done to keep it out of the nested loops.
finalCount += 1;

puts "The number of ways to make £2 is: #{finalCount}"