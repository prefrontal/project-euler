// Project Euler Problem 10
//
// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
// Find the sum of all the primes below two million.
//
// Answer: 142913828922

<?php

/*
 * Sieve of Eratosthenes
 * Simple, ancient algorithm for finding all prime numbers up to any given limit.
 * It does so by iteratively marking as composite (i.e., not prime) the multiples
 * of each prime, starting with the multiples of 2.
*/
function GetPrimes($maximum, &$primes)
{
    // Clear the input array in case there is existing data
    $primes = array();

    // There are no primes less than 2
    if ($maximum < 2) {
        return;
    }

    // Construct and execute the Sieve
    $sqrtMaximum = (int)(sqrt((double)$maximum));
    $primeTracker = array_fill(0, $maximum, true);

    for ($i = 2; $i < $sqrtMaximum; $i++) {
        if ($primeTracker[$i] == false) {
            continue;
        }

        for ($j = $i + $i; $j < $maximum; $j += $i) {
            $primeTracker[$j] = false;
        }
    }

    // Generate the list of primes to return
    for ($k = 2; $k < $maximum; $k++) {
        if ($primeTracker[$k] == true) {
            array_push($primes, $k);
        }
    }
}

/*
 * Find the sum of all primes up to a given number
 */

$TARGET_NUMBER = 2000000;

$myPrimes = array();
GetPrimes($TARGET_NUMBER, $myPrimes);
$primeSum = 0;

foreach ($myPrimes as $prime) {
    $primeSum += $prime;
}

echo "The sum is: ", $primeSum, "\n";

?>