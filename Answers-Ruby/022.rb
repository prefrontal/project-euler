# Project Euler Problem 22, Ruby
#
# Using names.txt, a 46K text file containing over five-thousand first names, 
# begin by sorting it into alphabetical order. Then working out the alphabetical 
# value for each name, multiply this value by its alphabetical position in the 
# list to obtain a name score.
# 
# For example, when the list is sorted into alphabetical order, COLIN, which is 
# worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would 
# obtain a score of 938 × 53 = 49714.
# 
# What is the total of all the name scores in the file?
#
# Answer: 871198282

ASCII_LETTER_OFFSET = 64

# The file provided is a single line of text consisting of names
# in quotes separated by commas.  This function will put one name
# in quotes in each element of the output vector
def LoadFile ()
	
	input = ""
	File.foreach("../Data Files/022-Names.txt") {|x| input = x }
	names = input.split(",")
	
	return names;
end

# Get names and sort them
names = LoadFile();
names.sort!()

finalSum = 0;

# Iterate over the names, calculating the contribution
# of each name, multiplied by its position in the list
for i in 0...names.size()
	tempSum = 0
	
	for j in names[i].split("")
		if ("\"" == j)
			next
		end

		tempSum += j.ord - ASCII_LETTER_OFFSET
	end
	
	# Increment by one because element 0 is the first entry
	finalSum += (i+1) * tempSum;
end

puts "The final sum is: #{finalSum}"





