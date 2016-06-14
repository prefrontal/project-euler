#!/usr/bin/python

# Project Euler Problem 31
#
# In England the currency is made up of pound, P, and pence, p, 
# and there are eight coins in general circulation:
# 
# 1p, 2p, 5p, 10p, 20p, 50p, 1P (100p) and 2P (200p).
#
# It is possible to make 2P in the following way:
# 
# 1x1P + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
#
# How many different ways can 2P be made using any number of coins?
#
# Answer: 73682

TARGET_VALUE = 200

finalCount = 0

# Seven nested for loops isn't pretty, but it gets the job done
for a in range(0,200+1):
	for b in range(0,100+1):
		for c in range(0,40+1):
			for d in range(0,20+1):
				for e in range(0,10+1):
					for f in range(0,4+1):
						for g in range(0,2+1):
							temp = a + 2*b + 5*c + 10*d + 20*e + 50*f + 100*g
							
							if (temp == TARGET_VALUE):
								finalCount += 1

# Add one for the 2P coin. Done to keep it out of the nested loops.
finalCount += 1

print ("The number of ways to make 2P is: %s" % finalCount)