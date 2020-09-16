// Project Euler, Problem 002
//
// Each new term in the Fibonacci sequence is generated by adding the previous two terms.
// By starting with 1 and 2, the first 10 terms will be:
// 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
// By considering the terms in the Fibonacci sequence whose values do not exceed four
// million, find the sum of the even-valued terms.
//
// Answer: 4613732

<?php

// Input parameters
$UPPER_LIMIT = 4000000;

// Starting values
$oneBack = 2;
$twoBack = 1;
$sumTotal = 2;  // Starts at 2 since initial oneBack term is even

while (($oneBack+$twoBack) < $UPPER_LIMIT) {
    // Determine next Fibonacci term
    $currentTerm = $oneBack + $twoBack;

    // Check for even number and add
    if (($currentTerm % 2) == 0) {
        $sumTotal += $currentTerm;
    }

    // Update Fibonacci terms
    $twoBack = $oneBack;
    $oneBack = $currentTerm;
}

echo "Sum total: ", $sumTotal;

?>