// Project Euler Problem 24
//
// A permutation is an ordered arrangement of objects. For example, 
// 3124 is one possible permutation of the digits 1, 2, 3 and 4. If 
// all of the permutations are listed numerically or alphabetically, 
// we call it lexicographic order. 
// The lexicographic permutations of 0, 1 and 2 are:
// 
// 012   021   102   120   201   210
// 
// What is the millionth lexicographic permutation of the 
// digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
// 
// Answer: 2783915460

<?php

function NextPermutation($arr) {
    # Find non-increasing suffix
    $i = count($arr) - 1;

    while ($i > 0 && ($arr[$i - 1] >= $arr[$i])) {
        $i -= 1;
    }

    if ($i <= 0) {
        return array();
    }

    # Find successor to pivot
    $j = count($arr) - 1;

    while ($arr[$j] <= $arr[$i - 1]) {
        $j -= 1;
    }

    $temp = $arr[$i - 1];
    $arr[$i - 1] = $arr[$j];
    $arr[$j] = $temp;

    # Reverse suffix
    $j = count($arr) - 1;

    while ($i < $j) {
        $temp = $arr[$i];
        $arr[$i] = $arr[$j];
        $arr[$j] = $temp;
        $i += 1;
        $j -= 1;
    }

    return $arr;
}

$PERMUTATION_TARGET = 1000000;

// This is the first lexicographic permutation
$digits = array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

// Initial value is first permutation
$permutationCount = 1;

while ($permutationCount < $PERMUTATION_TARGET) {
    // Cheating a bit here by using std::next_permutation
    // Anything in the Standard Library is fair game though
    $digits = NextPermutation($digits);
    $permutationCount++;
}

echo "Permutation value is: ";

for ($i = 0; $i < 10; $i++) 
    echo $digits[$i];

echo "\n";

?>