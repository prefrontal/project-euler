#!/usr/bin/python

# Project Euler Problem 40
#
# An irrational decimal fraction is created by concatenating the positive integers:
#
# 0.123456789101112131415161718192021...
#
# It can be seen that the 12th digit of the fractional part is 1.
#
# If dn represents the nth digit of the fractional part, find the value of the following expression.
#
# d1 x d10 x d100 x d1000 x d10000 x d100000 x d1000000
#
# Answer: 210

TARGET_INDICES = [1, 10, 100, 1000, 10000, 100000, 1000000]

# Take an integer and create a vector of the digits
def IntToVector (input):
	digits = []

	while (input > 0):
		digits.append(input % 10)
		input = int(input / 10)
	
	digits = digits[::-1]
	
	return digits

# We will be multiplying later, so a value of one here
finalProduct = 1
lastNumber = 0

maximumDigitCount = TARGET_INDICES[-1]
currentDigitCount = 0
targetIndex = 0

while (currentDigitCount <= maximumDigitCount):
	lastNumber += 1
	digits = IntToVector(lastNumber)
	
	for it in digits:
		currentDigitCount += 1

		if (targetIndex == len(TARGET_INDICES)):
			break;

		if (currentDigitCount == TARGET_INDICES[targetIndex]):
			targetIndex += 1
			finalProduct *= it

print ("Reached digit goal at: %s" % lastNumber)
print ("The final product is: %s" % finalProduct)
	