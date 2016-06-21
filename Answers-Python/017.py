#!/usr/bin/python

# Project Euler Problem 17
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

NUMBER_LIMIT = 1000


# Turns a single digit number into an English word

def digit_to_phrase(number):
    final_phrase = ""

    if (number < 0) or (10 < number):
        return final_phrase

    digit_lookup_table = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    return digit_lookup_table[number]


# Generates an English phrase from an arbitrary number under 10,000
# Does not add spaces, since they do not count in the final tally

def generate_english_string(number):
    final_string = ""
    temp_number = number

    # Determine the digits we will be working with
    thousands = int(temp_number / 1000)
    temp_number %= 1000
    hundreds = int(temp_number / 100)
    temp_number %= 100
    tens = int(temp_number / 10)
    temp_number %= 10
    ones = temp_number

    # Generate the output string using the known digits
    if 0 < thousands:
        final_string += digit_to_phrase(thousands) + "thousand"

    if 0 < hundreds:
        final_string += digit_to_phrase(hundreds) + "hundred"

    if (0 < thousands + hundreds) and (0 != tens + ones):
        final_string += "and"

    if (2 <= tens) and (tens <= 9):
        tens_lookup_table = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
        final_string += tens_lookup_table[tens]
        final_string += digit_to_phrase(ones)
    elif 1 == tens:
        teens_lookup_table = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen",
                            "eighteen", "nineteen"]
        final_string += teens_lookup_table[ones]
    elif 0 == tens:
        final_string += digit_to_phrase(ones)

    return final_string


# Determine the number of characters in an English language description
# of a range of numbers.

sum = 0

for i in range(1, NUMBER_LIMIT + 1):
    temp = generate_english_string(i)
    sum += len(temp)

print ("The final letter count is: ", sum)
