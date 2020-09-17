// Project Euler Problem 18
//
// By starting at the top of the triangle below and moving to adjacent numbers 
// on the row below, the maximum total from top to bottom is 23.
//
//    3
//   7 4
//  2 4 6
// 8 5 9 3
//
// That is, 3 + 7 + 4 + 9 = 23.
//
// Find the maximum total from top to bottom of the triangle below:
//
//               75
//              95 64
//             17 47 82
//            18 35 87 10
//           20 04 82 47 65
//          19 01 23 75 03 34
//         88 02 77 73 07 63 67
//        99 65 04 28 06 16 70 92
//       41 41 26 56 83 40 80 70 33
//      41 48 72 33 47 32 37 16 94 29
//     53 71 44 65 25 43 91 52 97 51 14
//    70 11 33 28 77 73 17 78 39 68 17 57
//   91 71 52 38 17 14 91 43 58 50 27 29 48
//  63 66 04 68 89 53 67 30 73 16 69 87 40 31
// 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
//
// NOTE: As there are only 16384 routes, it is possible to solve this problem by 
// trying every route. However, Problem 67, is the same challenge with a triangle 
// containing one-hundred rows; it cannot be solved by brute force, and 
// requires a clever method! ;o)
//
// Answer: 1074

<?php

$TRIANGLE_SIZE = 15;

// Could have or should have put this into a separate function, but
// didn't want to mess around with malloc and passing pointers.
// Doing it without C++11 makes using vectors onerous as well.
$newTriangle = array();
$newTriangle[] = array( 75,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ); // row 0
$newTriangle[] = array( 95, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ); // row 1
$newTriangle[] = array( 17, 47, 82,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ); // row 2
$newTriangle[] = array( 18, 35, 87, 10,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ); // row 3
$newTriangle[] = array( 20,  4, 82, 47, 65,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 ); // row 4
$newTriangle[] = array( 19,  1, 23, 75,  3, 34,  0,  0,  0,  0,  0,  0,  0,  0,  0 ); // row 5
$newTriangle[] = array( 88,  2, 77, 73,  7, 63, 67,  0,  0,  0,  0,  0,  0,  0,  0 ); // row 6
$newTriangle[] = array( 99, 65,  4, 28,  6, 16, 70, 92,  0,  0,  0,  0,  0,  0,  0 ); // row 7
$newTriangle[] = array( 41, 41, 26, 56, 83, 40, 80, 70, 33,  0,  0,  0,  0,  0,  0 ); // row 8
$newTriangle[] = array( 41, 48, 72, 33, 47, 32, 37, 16, 94, 29,  0,  0,  0,  0,  0 ); // row 9
$newTriangle[] = array( 53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14,  0,  0,  0,  0 ); // row 10
$newTriangle[] = array( 70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57,  0,  0,  0 ); // row 11
$newTriangle[] = array( 91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48,  0,  0 ); // row 12
$newTriangle[] = array( 63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31,  0 ); // row 13
$newTriangle[] = array(  4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23 ); // row 14

$resultTriangle = array();
for ($i = 0; $i < $TRIANGLE_SIZE; $i++) {
    $resultTriangle[$i] = array( 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 );
}

$maxRows = $TRIANGLE_SIZE-1;

// Work from the bottom up, calculating the partial sums of each row
// That is, the value of the current element and the max of the elements below
for ($i = $maxRows; $i >= 0; $i--) {
    for ($j = 0; $j <= $i; $j++) {
        if ($i == $maxRows) {
            $resultTriangle[$i][$j] = $newTriangle[$i][$j];
        }
        else {
            $resultTriangle[$i][$j] = $newTriangle[$i][$j] + max($resultTriangle[$i+1][$j], $resultTriangle[$i+1][$j+1]);
        }
    }
}

echo "The final sum is: ", $resultTriangle[0][0], "\n";

?>



