#!/usr/bin/python

# Project Euler Problem 57
#
# It is possible to show that the square root of two can be expressed as an infinite continued fraction.
#
# sqrt(2) = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
#
# By expanding this for the first four iterations, we get:
#
# 1 + 1/2 = 3/2 = 1.5
# 1 + 1/(2 + 1/2) = 7/5 = 1.4
# 1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
# 1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...
#
# The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion, 1393/985, is the
# first example where the number of digits in the numerator exceeds the number of digits in the denominator.
#
# In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator?
#
# Answer: 153

EXPANSION_LIMIT = 1000


# Take an integer and count the number of digits
def count_digits(input_value):
    digits = []
    intermediate_value = input_value

    while intermediate_value > 0:
        digits.append(intermediate_value % 10)

        # Used a divide-by-ten strategy previously to get rid of the last digit
        # but ran into floating point weirdness here. This does the same thing
        # using strings.  Less efficient, but it works fine.
        input_string = str(intermediate_value)
        cutoff_string = input_string[:-1]
        if cutoff_string:
            intermediate_value = int(cutoff_string)
        else:
            break

    return len(digits)


# We will start with values from the first iteration
numerator = 3
denominator = 2
numerator_greater_denominator_count = 0

for i in range(2, EXPANSION_LIMIT):
    # Since both calculations here rely on existing values we cache the results temporarily
    new_numerator = numerator + 2*denominator
    new_denominator = numerator + denominator
    numerator = new_numerator
    denominator = new_denominator

    if count_digits(numerator) > count_digits(denominator):
        numerator_greater_denominator_count += 1

print("Times numerator greater than denominator: ", numerator_greater_denominator_count)

