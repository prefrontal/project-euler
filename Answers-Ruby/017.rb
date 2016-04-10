# Project Euler Problem 17, Ruby
#
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were 
# written out in words, how many letters would be used?
# 
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) 
# contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use 
# of "and" when writing out numbers is in compliance with British usage.
#
# Answer: 21124

NUMBER_LIMIT = 1000;

#
# Turns a single digit number into an English word
#
def DigitToPhrase (number)
	finalPhrase = ""
	
	if ((number < 0) || (10 < number))
		return finalPhrase;
	end
	
	digitLookupTable = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

	return digitLookupTable[number]
end

#
# Generates an English phrase from an arbitrary number under 10,000
# Does not add spaces, since they do not count in the final tally
#
def GenerateEnglishString (number)
	finalString = ""
	tempNumber = number;
	
	# Determine the digits we will be working with
	thousands = (tempNumber/1000).floor
	tempNumber %= 1000;
	hundreds = (tempNumber/100).floor
	tempNumber %= 100;
	tens = (tempNumber/10).floor
	tempNumber %= 10;
	ones = tempNumber;
	
	# Generate the output string using the known digits
	if (0 < thousands)
		finalString += DigitToPhrase (thousands)
		finalString += "thousand"
	end

	if (0 < hundreds)
		finalString += DigitToPhrase (hundreds)
		finalString += "hundred"
	end
	
	if ((0 < thousands + hundreds) && (0 != tens + ones))
		finalString += "and"
	end
		
	if ((2 <= tens) && (tens <= 9))
		tensLookupTable = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
		finalString += tensLookupTable[tens];
		finalString += DigitToPhrase (ones);
	elsif (1 == tens)
		teensLookupTable = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
		finalString += teensLookupTable[ones];
	elsif (0 == tens)
		finalString += DigitToPhrase (ones)
	end
		
	return finalString;
end

#
# Determine the number of characters in an English language description
# of a range of numbers.
#

sum = 0;

for i in 1..NUMBER_LIMIT
	temp = GenerateEnglishString (i);
	puts "#{i} - #{temp}"
	sum += temp.length();
end

puts "The final letter count is: #{sum}"