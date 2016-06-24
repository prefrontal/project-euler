#!/usr/bin/python

# Project Euler Problem 43
#
# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of 
# each of the digits 0 to 9 in some order, but it also has a rather 
# interesting sub-string divisibility property.
# 
# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. 
# In this way, we note the following:
# 
# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17
#
# Find the sum of all 0 to 9 pandigital numbers with this property.
#
# Answer: 
# 16695334890


def next_permutation(array):
    # Find non-increasing suffix
    i = len(array) - 1

    while i > 0 and array[i - 1] >= array[i]:
        i -= 1

    if i <= 0:
        return []

    # Find successor to pivot
    j = len(array) - 1

    while array[j] <= array[i - 1]:
        j -= 1

    temp = array[i - 1]
    array[i - 1] = array[j]
    array[j] = temp

    # Reverse suffix
    j = len(array) - 1

    while i < j:
        temp = array[i]
        array[i] = array[j]
        array[j] = temp
        i += 1
        j -= 1

    return array


def is_target_pandigital(number):
    divisors = [2, 3, 5, 7, 11, 13, 17]

    for i in range(0, 6 + 1):
        # We start counting at 0 in the loop,
        # but the problem indices begin at one
        value = list_to_int(number[i + 1:i + 4])

        # Check the next divisor in the array
        if (value % divisors[i]) != 0:
            return False

    return True


def list_to_int(input_list):
    s = ''.join(map(str, input_list))
    return int(s)


pandigital_sum = 0
number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# We will permute the characters in the number string,
# checking if each permutation is a pandigital target
while True:
    if is_target_pandigital(number):
        pandigital_sum += list_to_int(number)

    number = next_permutation(number)

    if 0 == len(number):
        break

print ("The sum of pandigital numbers is: ", pandigital_sum)
