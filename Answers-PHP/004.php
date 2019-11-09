// Project Euler Problem 4
//
// A palindromic number reads the same both ways.
// The largest palindrome made from the product of two
// 2-digit numbers is 9009 = 91 × 99. Find the largest
// palindrome made from the product of two 3-digit numbers.
//
// Answer: 906609

<?php

/*
 * Determines if an integer is a palindrome through string comparison
 */
function IsPalindrome($value)
{
    $forward = strval($value);
    $reverse = strrev($forward);

    if (0 == strcmp($forward, $reverse)) {
        return true;
    }

    return false;
}

/*
 * Determines if an integer is a palindrome through integer manipulation
 */
function IsPalindrome2($value)
{
    $reversed = 0;
    $temp = (int)($value);

    while ($temp != 0) {
        $reversed *= 10;
        $reversed += ($temp % 10);
        $temp = (int)($temp / 10);
    }

    if ($value == $reversed)
        return true;

    return false;
}

$maxPalindrome = 0;

for ($i = 100; $i < 1000; $i++) {
    for ($j = 100; $j < 1000; $j++) {
        if (!IsPalindrome2($i * $j)) {
            continue;
        }

        if (($i * $j) > $maxPalindrome) {
            $maxPalindrome = $i * $j;
        }
    }
}

echo "The largest palindrome is: ", $maxPalindrome, "\n";

?>