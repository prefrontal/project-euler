// Project Euler Problem 5
//
// 2520 is the smallest number that can be divided by each of the numbers
// from 1 to 10 without any remainder. What is the smallest positive number
// that is evenly divisible by all of the numbers from 1 to 20?
//
// Answer: 232792560

<?php
/*
* Checks to see if a number is evenly divisible by all numbers between
* zero and a specified maximum divisor.
*/
function IsEvenlyDivisible($value, $max_divisor)
{
    if ($value < $max_divisor) {
        return false;
    }

    $evenlyDivisible = true;

    for ($i = $max_divisor; $i > 0; $i--) {
        if (0 != ($value % $i)) {
            $evenlyDivisible = false;
            break;
        }
    }

    return $evenlyDivisible;
}

/*
* Finds the smallest number that is evenly divisible
*/

$MAX_DIVISOR = 20;
$currentValue = $MAX_DIVISOR;

while (true) {
    $currentValue++;

    if (IsEvenlyDivisible($currentValue, $MAX_DIVISOR)) {
        break;
    }
}

echo "Smallest positive evenly divisible number: ", $currentValue, "\n"

?>