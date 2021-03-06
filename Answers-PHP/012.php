// Project Euler Problem 12
//
// The sequence of triangle numbers is generated by adding the natural numbers. 
// So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. 
// The first ten terms would be:
// 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
// 
// Let us list the factors of the first seven triangle numbers:
// 1: 1
// 3: 1,3
// 6: 1,2,3,6
// 10: 1,2,5,10
// 15: 1,3,5,15
// 21: 1,3,7,21
// 28: 1,2,4,7,14,28
//
// We can see that 28 is the first triangle number to have over five divisors.
// What is the value of the first triangle number to have over five hundred divisors?
// Answer: 76576500

// Notes: this brute-force method can take a while (1256s).
// Tried a modified sieve. Dramatic decrease in time ().
// Last number in the addition sequence was 12375

<?php

$DIVISOR_TARGET = 500;

$currentNumber = 0;
$currentSum = 0;
$iteration = 0;

while (true) {
    // Identify current triangle number
    $currentNumber++;
    $currentSum += $currentNumber;
    
    $factorCount = 0;
    
    for ($i = 1; $i <= sqrt($currentSum); $i++) {
        if (0 == ($currentSum % $i)) {
            $factorCount += 2;
        }
    }
    
    // echo "N ", $currentSum, " F ", $factorCount, "\n";
    
    if ($factorCount > $DIVISOR_TARGET) {
        break;
    }
        
    $iteration++;    
        
    if (0 == ($iteration % 1000)) {
        echo $currentSum, " - ", $factorCount, "\n";
    }
}

echo "The triangle number is: ", $currentSum, " ", $currentNumber, "\n";

?>
