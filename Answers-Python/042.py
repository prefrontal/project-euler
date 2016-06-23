#!/usr/bin/python

# Project Euler Problem 42
#
# The nth term of the sequence of triangle numbers is given by, 
# tn = 0.5 * n(n+1); so the first ten triangle numbers are:
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


# The file provided is a single line of text consisting of names
# in quotes separated by commas.  This function will put one name
# in quotes in each element of the output vector
def load_file():
    input_file = open('../Data Files/042-Words.txt', 'r')
    text = input_file.read()
    return text.split(',')


# Brute force determination of a triangle number
def is_triangle_number(value):
    triangle_number = 1
    iteration = 1

    # Keep calculating the next triangle iteration until
    # we either match or overshoot the input value
    while triangle_number <= value:
        if triangle_number == value:
            return True

        iteration += 1
        triangle_number = 0.5 * iteration * (iteration + 1)

    return False


def is_triangle_word(word):
    # Trim the quotes
    word = word[1:-1]

    letter_sum = 0

    # Calculate the sume of letter representations
    for letter in word:
        letter_sum += ord(letter) - ASCII_CAPITAL_OFFSET

    if is_triangle_number(letter_sum):
        return True
    else:
        return False


triangle_word_count = 0
words = load_file()

for it in words:
    if is_triangle_word(it):
        triangle_word_count += 1

print ("The number of triangle words is: ", triangle_word_count)
