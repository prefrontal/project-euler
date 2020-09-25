// Project Euler Problem 23
//
// A perfect number is a number for which the sum of its proper divisors is 
// exactly equal to the number. For example, the sum of the proper divisors of
// 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
//
// A number n is called deficient if the sum of its proper divisors is less 
// than n and it is called abundant if this sum exceeds n.
// 
// As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest 
// number that can be written as the sum of two abundant numbers is 24. By mathematical 
// analysis, it can be shown that all integers greater than 28123 can be written as 
// the sum of two abundant numbers. However, this upper limit cannot be reduced any 
// further by analysis even though it is known that the greatest number that cannot be 
// expressed as the sum of two abundant numbers is less than this limit.
// 
// Find the sum of all the positive integers which cannot be 
// written as the sum of two abundant numbers.
//
// Answer: 4179871
	
<?php

// Brute-force determination of numeric abundance
function IsAbundant ($value) {
	$divisors = array();
	
	for ($i = 1; $i < $value; $i++) {
		if (0 == $value % $i) {
			$divisors[] = $i;
		}
	}
	
	$divisorSum = 0;
	
	foreach ($divisors as $it) {
		$divisorSum += $it;
	}

	if ($value < $divisorSum) {
		return True;
	}
	else {
		return False;
	}
	
}

$MAX_INTEGER = 28123;	

$abundantNumbers = array();
$numberList = array_fill(0, $MAX_INTEGER, False);

// First, generate a list of abundant numbers
for ($i = 12; $i < $MAX_INTEGER; $i++) {
	if (IsAbundant ($i)) {
		$abundantNumbers[] = $i;
	}
}

// Next, add each abundant number to every other possible
// abundant number in the vector.
for ($m = 0; $m < count($abundantNumbers); $m++) {
	for ($n = 0; $n < count($abundantNumbers); $n++) {
		$position = $abundantNumbers[$m] + $abundantNumbers[$n];

		// Needed because PHP will happily write beyond the end of the array
		if ($position > $MAX_INTEGER) {
			continue;
		}

		$numberList[$position] = True;
	}	
}

// Go through the list of numbers that cannot be expressed as
// two abundant numbers and generate the final sum.
$finalSum = 0;

for ($p = 1; $p < count($numberList); $p++) {
	if (!$numberList[$p]) {
		$finalSum += $p;		
	}
}

echo "The final sum is: ", $finalSum, "\n";

?>





