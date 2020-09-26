// Project Euler Problem 25
//
// The Fibonacci sequence is defined by the recurrence relation:
//
// Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
// Hence the first 12 terms will be:
// 
// F1 = 1
// F2 = 1
// F3 = 2
// F4 = 3
// F5 = 5
// F6 = 8
// F7 = 13
// F8 = 21
// F9 = 34
// F10 = 55
// F11 = 89
// F12 = 144
// The 12th term, F12, is the first term to contain three digits.
// 
// What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
//
// Answer: 4782

<?php

// We will need to store three numbers of up to 1000 digits to make this happen
// An array of integers makes the most sense here given that constraint

$DIGIT_TARGET = 1000;

// We will be looking for exactly the DIGIT_TARGET, so
// and array of that size will suffice in this case
$a = array_fill(0, $DIGIT_TARGET, 0);
$b = array_fill(0, $DIGIT_TARGET, 0);
$c = array_fill(0, $DIGIT_TARGET, 0);

// We will start by calculating the third Fibonacci term
$termCount = 2;
$digitCount = 1;
$b[0] = 1;
$c[0] = 1;

// The order of numbers in the array will be reversed to 
// simplify the loop logic later on.
// So, the first element in the array [0] is the smallest
// digit in the actual number

do {
    // Start by adding the previous two terms
    $remainder = 0;

    for ($i = 0; $i < $DIGIT_TARGET; $i++) {
        $temp = $b[$i] + $c[$i] + $remainder;
        $a[$i] = $temp % 10;
        $remainder = intval($temp / 10);
    }
    
    // Update the last two values
    for ($j = 0; $j < $DIGIT_TARGET; $j++) {
        // Could have done this in the loop above, but
        // separating out responibility makes sense
        $c[$j] = $b[$j];
        $b[$j] = $a[$j];
    }      
    
    // Count the number of digits
    for ($k = $DIGIT_TARGET - 1; $k >= 0; $k--) {
        // Identify the first non-zero value in the array
        // as we move from highest to lowest value.
        
        if (0 != $a[$k]) {
            $digitCount = $k + 1;
            break;
        }
    }
    
    $termCount++;
}
while ($digitCount != $DIGIT_TARGET);

echo "The term with ", $DIGIT_TARGET, " digits is: ", $termCount, "\n";

?>