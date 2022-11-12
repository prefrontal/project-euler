#!/usr/bin/python

# Project Euler Problem 69
#
# Euler's Totient function, φ(n) [sometimes called the phi function], is used 
# to determine the number of numbers less than n which are relatively prime to n.
# For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively
# prime to nine, φ(9)=6.
# 
# n    Relatively Prime	φ(n)    n/φ(n)
# 2    1                1       2
# 3    1,2              2       1.5
# 4    1,3              2       2
# 5    1,2,3,4          4       1.25
# 6    1,5              2       3
# 7    1,2,3,4,5,6      6       1.1666...
# 8    1,3,5,7          4       2
# 9    1,2,4,5,7,8      6       1.5
# 10   1,3,7,9          4       2.5
# 
# It can be seen that n=6 produces a maximum n/φ(n) for n ≤ 10.
# Find the value of n ≤ 1,000,000 for which n/φ(n) is a maximum.
#
# Answer: 510510

# https://en.wikipedia.org/wiki/Euler%27s_totient_function

# https://en.wikipedia.org/wiki/Coprime_integers
# "Two integers a and b are coprime, relatively prime or mutually prime if the only positive integer
# that is a divisor of both of them is 1.[1] Consequently, any prime number that divides a does not divide b,
# and vice versa. This is equivalent to their greatest common divisor (GCD) being 1.""

max_n = 0
max_n_over_phi_n = 0


# Return the greatest common divisor using the Eulidean Algorithm
# https://en.wikipedia.org/wiki/Greatest_common_divisor#Calculation
# https://en.wikipedia.org/wiki/Euclidean_algorithm
def gcd(a, b):
    while True:
        if a == 0 or b == 0:
            return max(a, b)
            
        tmp_a = min(a, b)
        tmp_b = max(a, b) % min(a,b)
        a = tmp_a
        b = tmp_b


print("Starting...")

# This strategy takes forever, but it works. Other solutions are definitely faster.
for n in range(2, 1000001):
    if n % 1000 == 0:
        print(n, " Max so far:", max_n, "n/φ(n):", max_n_over_phi_n)

    divisor_count = 0

    for j in range(1, n-1):
        # Speed shortcut
        if (n % 2 == 0 and j % 2 == 0) or (n % 3 == 0 and j % 3 == 0):
            continue
        
        if gcd(n, j) == 1:
            divisor_count += 1

    if divisor_count:
        n_over_phi_n = n / divisor_count

        if n_over_phi_n > max_n_over_phi_n:
            max_n_over_phi_n = n_over_phi_n
            max_n = n
        
print("The largest n/φ(n) was seen at:", max_n)
