// Project Euler Problem 21
//
// Let d(n) be defined as the sum of proper divisors of n 
// (numbers less than n which divide evenly into n).
//
// If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable 
// pair and each of a and b are called amicable numbers.
//
// For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
// therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
// 
// Evaluate the sum of all the amicable numbers under 10000.
//
// Answer: 31626
	
<?php

// Brute force amicable number finder
function FindAmicableNumbers(int $limit) {
	// We will use a vector of bools to track which numbers are amicable
	// This makes it much more straightforward to mark both numbers in the pair
	// Also, add one to the limit so our indices equal the actual number
	$numberTracker = array_fill(0, $limit+1, False);
	
	for ($i = 2; $i <= $limit; $i++) {
		$firstDivisorSum = 0;
		
		// Find the sum of the proper divisors
		for ($j = 1; $j < $i; $j++) {
			if (0 == ($i % $j)) {
				$firstDivisorSum += $j;
			}
		}
		
		$secondDivisorSum = 0;
		
		// Find the sum of the proper divisors for
		// the result of our previous loop
		for ($k = 1; $k < $firstDivisorSum; $k++) {
			if (0 == ($firstDivisorSum % $k)) {
				$secondDivisorSum += $k;
			}
		}
		
		// Determine if amicable and track
		if (($secondDivisorSum == $i) && ($i != $firstDivisorSum)) {
			$numberTracker[$i] = True;
			$numberTracker[$firstDivisorSum] = True;
			
			echo "Amicable pair: * ", $i,  " * ", $firstDivisorSum, " * ", "\n";
		}
		
	}
	
	return $numberTracker;
}

$UPPER_LIMIT = 10000;	
$amicableNumbers = FindAmicableNumbers($UPPER_LIMIT);
$amicableSum = 0;

// Find the sum of the amicable numbers
for ($i = 1; $i <= $UPPER_LIMIT; $i++)
{
	if ($amicableNumbers[$i]) {
		$amicableSum += $i;
	}
}

echo "The sum is: ", $amicableSum, "\n";
	