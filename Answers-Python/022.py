#!/usr/bin/python

# Project Euler Problem 22
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
ASCII_QUOTE_VALUE = 34


# The file provided is a single line of text consisting of names
# in quotes separated by commas.  This function will put one name
# in quotes in each element of the output vector
def load_file():
    names_file = open('../Data Files/022-Names.txt', 'r')
    text = names_file.read()
    return text.split(',')


# Get names and sort them
names = load_file()
names.sort()

final_sum = 0

# Iterate over the names, calculating the contribution
# of each name, multiplied by its position in the list
for i, name in enumerate(names):
    temp_sum = 0

    for letter in name:
        if '"' == letter:
            continue

        temp_sum += ord(letter) - ASCII_LETTER_OFFSET

    # Increment by one because element 0 is the first entry
    final_sum += (i + 1) * temp_sum

print ("The final sum is: ", final_sum)
