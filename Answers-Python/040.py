#!/usr/bin/python

# Project Euler Problem 40
#
# An irrational decimal fraction is created by concatenating the positive integers:
#
# 0.123456789101112131415161718192021...
#
# It can be seen that the 12th digit of the fractional part is 1.
#
# If dn represents the nth digit of the fractional part, find the value of the following expression.
#
# d1 x d10 x d100 x d1000 x d10000 x d100000 x d1000000
#
# Answer: 210

TARGET_INDICES = [1, 10, 100, 1000, 10000, 100000, 1000000]


# Take an integer and create a vector of the digits
def int_to_vector(input_int):
    digits = []

    while input_int > 0:
        digits.append(input_int % 10)
        input_int = int(input_int / 10)

    digits = digits[::-1]

    return digits


# We will be multiplying later, so a value of one here
final_product = 1
last_number = 0

maximum_digit_count = TARGET_INDICES[-1]
current_digit_count = 0
target_index = 0

while current_digit_count <= maximum_digit_count:
    last_number += 1
    digits = int_to_vector(last_number)

    for it in digits:
        current_digit_count += 1

        if target_index == len(TARGET_INDICES):
            break

        if current_digit_count == TARGET_INDICES[target_index]:
            target_index += 1
            final_product *= it

print ("Reached digit goal at: %s" % last_number)
print ("The final product is: %s" % final_product)
