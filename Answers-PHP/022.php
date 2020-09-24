// Project Euler Problem 22
//
// Using names.txt, a 46K text file containing over five-thousand first names, 
// begin by sorting it into alphabetical order. Then working out the alphabetical 
// value for each name, multiply this value by its alphabetical position in the 
// list to obtain a name score.
// 
// For example, when the list is sorted into alphabetical order, COLIN, which is 
// worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would 
// obtain a score of 938 × 53 = 49714.
// 
// What is the total of all the name scores in the file?
//
// Answer: 871198282

<?php	

// The file provided is a single line of text consisting of names
// in quotes separated by commas.  This function will put one name
// in quotes in each element of the output vector
function LoadFile() {
	$contents = file_get_contents("../Data Files/022-Names.txt");
	$names = explode(",", $contents);
	return $names;
}

$ASCII_LETTER_OFFSET = 64;
$ASCII_QUOTE_VALUE = 34;

// Get names and sort them
$names = LoadFile();
sort($names);
$finalSum = 0;

// Iterate over the names, calculating the contribution
// of each name, multiplied by its position in the list
for ($i = 0; $i < count($names); $i++) {
	$temp = $names[$i];
	$tempSum = 0;
	
	for ($j = 0; $j < strlen($temp); $j++) {
		if ($ASCII_QUOTE_VALUE == ord($temp[$j])) {
			continue;
		}

		$tempSum += ord($temp[$j]) - $ASCII_LETTER_OFFSET;	
	}
	
	// Increment by one because element 0 is the first entry
	$finalSum += ($i + 1) * $tempSum;
}

echo "The final sum is: ", $finalSum, "\n";






