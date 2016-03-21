// Project Euler Problem 39, Swift
//
// If p is the perimeter of a right angle triangle with integral 
// length sides, {a,b,c}, there are exactly three solutions for p = 120.
//
// {20,48,52}, {24,45,51}, {30,40,50}
//
// For which value of p ≤ 1000, is the number of solutions maximised?
//
// Answer: 840

import Foundation

let MAXIMUM_VALUE:Int = 1000;
let SMALLEST_TRIANGLE_SUM:Int = 12;

var maximumSolutionsAt:Int = 0;
var maximumSolutionCount:Int = 0;

for (var i:Int = SMALLEST_TRIANGLE_SUM; i < MAXIMUM_VALUE; i++)
{
	var solutionCount:Int = 0;
	
	// We start at one because that is the smallest size we can have
	// for the triangle. We end at i-2 because the other sides of the
	// triangle have this minimum size as well.
	for (var a:Int = 1; a < i-2; a++)
	{
		// One is again the smallest size possible. The maximum size
		// is i-a-1, since it will be the total minus the first side
		// and the hypotaneuse can be one (but it never will be).
		for (var b:Int = 1; b < i-a-1; b++)
		{
			// Use Pythagorean Theorem to determine if we have a solution
			var legsValue:Int = a*a + b*b;
			var hypotaneuseValue:Int = (i - a - b) * (i - a - b);
			
			if (legsValue == hypotaneuseValue)
			{
				solutionCount++;
			}
		}
	}

	if (solutionCount > maximumSolutionCount)
	{
		maximumSolutionsAt = i;
		maximumSolutionCount = solutionCount;
	}
}

print ("The number of solutions is maximized at: \(maximumSolutionsAt)")
print ("The number of solutions was: \(maximumSolutionCount)")