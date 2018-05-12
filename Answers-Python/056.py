#!/usr/bin/python

# Project Euler Problem 56
#
# A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably
# large: one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.
#
# Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?
#
# Answer: 972

UPPER_LIMIT = 100


# Take an integer and create a vector of the digits
def int_to_vector(input_value):
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

    digits = digits[::-1]
    return digits


# Calculate the sum of all digits in an integer
def calculate_digit_sum(input_value):
    digit_vector = int_to_vector(input_value)
    digit_sum = 0
    for k in digit_vector:
        digit_sum += k
    return digit_sum


max_digit_sum = 0

for i in range(0, UPPER_LIMIT):
    for j in range(0, UPPER_LIMIT):
        exponent_value = i**j
        digit_sum = calculate_digit_sum(exponent_value)
        if digit_sum > max_digit_sum:
            max_digit_sum = digit_sum

print ("Max digit sum", max_digit_sum)
