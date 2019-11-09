// Project Euler, Problem 003
//
// The prime factors of 13195 are 5, 7, 13 and 29.
// What is the largest prime factor of the number 600851475143 ?
//
// Answer: 6857

<?php

function IsPrime($input)
{
    if ($input < 2) {
        return false;
    }

    $primeState = true;

    for ($i = 2; $i < $input; $i++) {
        if (($input % $i) == 0) {
            $primeState = false;
            break;
        }
    }

    return $primeState;
}

function DetermineLargestPrimeFactor($inputValue)
{
    $largestFactor = 0;
    $sqrtInput = sqrt($inputValue);

    for ($i = 3; $i < $sqrtInput; $i += 2) {
        if (($inputValue % $i) == 0) {
            if (IsPrime($i)) {
                if ($i > $largestFactor)
                    $largestFactor = $i;
            }
        }
    }

    return $largestFactor;
}

$TARGET_NUMBER = 600851475143;
$factor = DetermineLargestPrimeFactor($TARGET_NUMBER);
echo "Largest prime factor: ", $factor, "\n";

?>
