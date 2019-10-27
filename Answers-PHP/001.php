// Project Euler, Problem 001
//
// If we list all the natural numbers below 10 that are multiples of 3 or 5,
// we get 3, 5, 6 and 9. The sum of these multiples is 23.
// Find the sum of all the multiples of 3 or 5 below 1000.
//
// Answer: 233168

<?php

$lower_limit = 0;
$upper_limit = 1000;
$final_sum = 0;

for ($i = $lower_limit; $i < $upper_limit; $i++) {
    if ($i % 3 === 0 || $i % 5 === 0) {
        $final_sum += $i;
    }
}

echo "Sum of all multiples: ", "$final_sum";

?>