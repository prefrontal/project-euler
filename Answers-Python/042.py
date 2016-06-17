#!/usr/bin/python

# Project Euler Problem 42
#
# The nth term of the sequence of triangle numbers is given by, 
# tn = ½n(n+1); so the first ten triangle numbers are:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
# 
# By converting each letter in a word to a number corresponding 
# to its alphabetical position and adding these values we form a 
# word value. For example, the word value for SKY is 
# 19 + 11 + 25 = 55 = t10. If the word value is a triangle number 
# then we shall call the word a triangle word.
# 
# Using words.txt (right click and 'Save Link/Target As...'), 
# a 16K text file containing nearly two-thousand common English 
# words, how many are triangle words?
#
# Answer: 162

ASCII_CAPITAL_OFFSET = 64

# The file provided is a single line of text consisting of names
# in quotes separated by commas.  This function will put one name
# in quotes in each element of the output vector
def LoadFile():
	file = open('../Data Files/042-Words.txt','r')
	text = file.read()
	return (text.split(','))

# Brute force determination of a triangle number
def IsTriangleNumber(value):
	triangleNumber = 1
	iteration = 1
	
	# Keep calculating the next triangle iteration until
	# we either match or overshoot the input value
	while (triangleNumber <= value):
		if (triangleNumber == value):
			return True
			
		iteration += 1
		triangleNumber = 0.5 * iteration * (iteration + 1)
	
	return False

def IsTriangleWord(word):
	# Trim the quotes
	word = word[1:-1]

	letterSum = 0

	# Calculate the sume of letter representations
	for letter in word:
		letterSum += ord(letter) - ASCII_CAPITAL_OFFSET;
	
	if IsTriangleNumber(letterSum):
		return True
	else:
		return False
		

triangleWordCount = 0
words = LoadFile()

for it in words:
	if (IsTriangleWord(it)):
		triangleWordCount += 1

print ("The number of triangle words is: ", triangleWordCount)
