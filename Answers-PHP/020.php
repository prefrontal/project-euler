// Project Euler Problem 20
//
// n! means n × (n − 1) × ... × 3 × 2 × 1
//
// For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
// and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
//
// Find the sum of the digits in the number 100!
//
// Answer: 648

<?php

$FACTORIAL_NUMBER = 100;
$NUMBER_ARRAY_SIZE = 200;

// So, 100! = 9.332622e+157. We will need to do something clever here.

// Use an integer array to hold the large number
// Init first element to one so we can multiply later
$bigNumber = array();
$bigNumber[0] = 1;

for ($i = 1; $i <= $FACTORIAL_NUMBER; $i++) { // Factorial loop
    $carryOver = 0;
    
    for ($j = 0; $j < $NUMBER_ARRAY_SIZE; $j++) { // Array loop
        $temp = ($bigNumber[$j] * $i) + $carryOver;
        $bigNumber[$j] = $temp % 10;
        $carryOver = intval($temp/10);
    }
}

$finalSum = 0;

for ($t = 0; $t < $NUMBER_ARRAY_SIZE; $t++) {
    $finalSum += $bigNumber[$t];
}

echo "The final sum is: ", $finalSum, "\n";

?>