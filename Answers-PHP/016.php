// Project Euler Problem 16
//
// 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
// What is the sum of the digits of the number 2^1000?
// Answer: 1366

<?php

// A double can hold from 2^0 to 2^1023 exactly
// http://www.exploringbinary.com/what-powers-of-two-look-like-inside-a-computer/
// http://www.exploringbinary.com/a-simple-c-program-that-prints-2098-powers-of-two/

$EXPONENT = 1000;

$number = pow(2, $EXPONENT);
$numberString = sprintf("%.0f", $number);
$sum = 0;

$numberArray = str_split($numberString);
foreach ($numberArray as $char) {
    $sum += intval($char);
}

echo "The sum of digits is: ", $sum, "\n";

?>
