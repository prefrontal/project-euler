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

# The file provided is a single line of text consisting of words
# in quotes separated by commas.  This function will put one name
# in quotes in each element of the output vector
def LoadFile ()
	
	input = ""
	File.foreach("../Data Files/042-Words.txt") {|x| input = x }
	names = input.split(",")
	
	return names;
end

# Brute force determination of a triangle number
def IsTriangleNumber (value)
	triangleNumber = 1
	iteration = 1
	
	# Keep calculating the next triangle iteration until
	# we either match or overshoot the input value
	while (triangleNumber <= value)
		if (triangleNumber == value)
			return true
		end
			
		iteration += 1
		triangleNumber = 0.5 * iteration * (iteration + 1)
	end
	
	return false;
end

def IsTriangleWord (input)
	# Don't modify the input variable
	# Trim the quotes
	word = input[1...-1]
	letterSum = 0;

	# Calculate the sum of letter representations
	for i in 0...(word.size)
		letterSum += word[i].ord - ASCII_CAPITAL_OFFSET
	end

	if (IsTriangleNumber(letterSum))
		return true
	else
		return false
	end
end

triangleWordCount = 0
words = LoadFile()

for it in words
	if (IsTriangleWord(it))
		triangleWordCount += 1
	end
end

puts "The number of triangle words is: #{triangleWordCount}"
