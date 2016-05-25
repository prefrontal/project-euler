#!/usr/bin/python

# Project Euler Problem 4
#
# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 
# 2-digit numbers is 9009 = 91 x 99. Find the largest 
# palindrome made from the product of two 3-digit numbers.
#
# Answer: 906609

#
# Determines if an integer is a palindrome through string comparison 
#
def IsPalindrome (value):
	forward = str(value)
	reverse = forward[::-1]

	if (forward == reverse):
		return True

	return False

#
# Determines if an integer is a palindrome through integer manipulation
#
def IsPalindrome2 (value):
	reversed = 0
	temp = value
	
	while (temp != 0):
		reversed *= 10
		reversed += (temp % 10)
		temp /= 10
	
	if (value == reversed):
		return True
		
	return False

maxPalindrome = 0

for i in range (100, 1000):
	for j in range (100, 1000):
		if (False == IsPalindrome (i * j)):
			continue
			 
		if ((i*j) > maxPalindrome):
			maxPalindrome = i * j

print "The largest palindrome is: %d" % maxPalindrome