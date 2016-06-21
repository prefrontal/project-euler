#!/usr/bin/python

# Project Euler Problem 8

# The four adjacent digits in the 1000-digit number that have the greatest product are 9 * 9 * 8 * 9 = 5832.
# Find the thirteen adjacent digits in the 1000-digit number that have the greatest product. What is the value of this product?
#
# Answer:23514624000
#
# 73167176531330624919225119674426574742355349194934
# 96983520312774506326239578318016984801869478851843
# 85861560789112949495459501737958331952853208805511
# 12540698747158523863050715693290963295227443043557
# 66896648950445244523161731856403098711121722383113
# 62229893423380308135336276614282806444486645238749
# 30358907296290491560440772390713810515859307960866
# 70172427121883998797908792274921901699720888093776
# 65727333001053367881220235421809751254540594752243
# 52584907711670556013604839586446706324415722155397
# 53697817977846174064955149290862569321978468622482
# 83972241375657056057490261407972968652414535100474
# 82166370484403199890008895243450658541227588666881
# 16427171479924442928230863465674813919123162824586
# 17866458359124566529476545682848912883142607690042
# 24219022671055626321111109370544217506941658960408
# 07198403850962455444362981230987879927244284909188
# 84580156166097919133875499200524063689912560717606
# 05886116467109405077541002256983155200055935729725
# 71636269561882670428252483600823257530420752963450

# The number of consecutive digits to examine
num_digits = 13

number1 = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843"
number2 = "8586156078911294949545950173795833195285320880551112540698747158523863050715693290963295227443043557"
number3 = "6689664895044524452316173185640309871112172238311362229893423380308135336276614282806444486645238749"
number4 = "3035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776"
number5 = "6572733300105336788122023542180975125454059475224352584907711670556013604839586446706324415722155397"
number6 = "5369781797784617406495514929086256932197846862248283972241375657056057490261407972968652414535100474"
number7 = "8216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586"
number8 = "1786645835912456652947654568284891288314260769004224219022671055626321111109370544217506941658960408"
number9 = "0719840385096245544436298123098787992724428490918884580156166097919133875499200524063689912560717606"
number10 = "0588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"

number_string = number1 + number2 + number3 + number4 + number5 + number6 + number7 + number8 + number9 + number10
string_length = len(number_string)

# Determine the number of 'windows' of consecutive digits we need to examine
window_count = string_length - num_digits

max_product = 0

for i in range(0, window_count + 1):
    temp_product = 1  # Start at one since we will be multiplying

    for j in range(i, (i + num_digits)):
        value = int(number_string[j])
        temp_product *= value

    if max_product < temp_product:
        max_product = temp_product

print "Max product for length %d is %d" % (num_digits, max_product)
