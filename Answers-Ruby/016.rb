# Project Euler Problem 16, Ruby
#
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# What is the sum of the digits of the number 2^1000?
#
# Answer: 1366

EXPONENT = 1000;
ASCII_OFFSET = 48;

#
# Calculate the sum of digits in any power of 2 up to 2^1023
#

# A double can hold from 2^0 to 2^1023 exactly
# http://www.exploringbinary.com/what-powers-of-two-look-like-inside-a-computer/
# http://www.exploringbinary.com/a-simple-c-program-that-prints-2098-powers-of-two/

number = (2**EXPONENT).to_s
sum = 0;

number.split("").each {|i| sum += i.to_i}

puts "The sum of digits is: #{sum}"