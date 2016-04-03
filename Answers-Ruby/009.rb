# Project Euler Problem 9
#
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#
# Answer: 31875000

TARGET_SUM = 1000

pySum = 0
a,b,c = 0

for i in TARGET_SUM.downto(1)
	for j in (TARGET_SUM-i).downto(1)
		for k in (TARGET_SUM-i-j).downto(1)
			if ((i+j+k) != TARGET_SUM)
				next
			end
			
			if ((i*i + j*j) != k*k)
				next
			end
				
			pySum = i*j*k
		end
	end
end

puts "The product is: #{pySum}"
