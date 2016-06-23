#!/usr/bin/python

# Project Euler Problem 38
#
# Take the number 192 and multiply it by each of 1, 2, and 3:
#
# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
#
# By concatenating each product we get the 1 to 9 pandigital, 192384576. 
# We will call 192384576 the concatenated product of 192 and (1,2,3)
# 
# The same can be achieved by starting with 9 and multiplying by 
# 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is 
# the concatenated product of 9 and (1,2,3,4,5).
# 
# What is the largest 1 to 9 pandigital 9-digit number that can be formed 
# as the concatenated product of an integer with (1,2, ... , n) where n > 1?
#
# Answer: 932718654

MAXIMUM_VALUE = 100000
PANDIGITAL_VALUE_COUNT = 9


# Determine if a string contains a pandigital number
def is_pandigital(input):
    input = ''.join(sorted(input))

    if input == "123456789":
        return True
    else:
        return False


# Return the number of characters in an integer
def get_integer_length(input):
    length = 0
    temp = input

    while temp > 0:
        temp /= 10
        length += 1

    return length


# Determine the largest concatenated pandigital from integer multiplication
largest_pandigital = 0

for i in range(1, MAXIMUM_VALUE):
    ss = ""

    multiplier = 0
    value_count = 0

    # Keep multiplying the base integer until we have
    # more digits than a standard pandigital number.
    # The use of stringstreams makes things easier here.
    while value_count < PANDIGITAL_VALUE_COUNT:
        # Concatenate the next number
        multiplier += 1
        ss += str(i * multiplier)
        value_count = len(ss)

        # Test the number for pandigitality
        if is_pandigital(ss):

            pandigital_value = int(ss)

            if pandigital_value > largest_pandigital:
                largest_pandigital = pandigital_value

print ("The largest pandigital is: ", largest_pandigital)
