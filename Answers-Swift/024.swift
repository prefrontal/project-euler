// Project Euler Problem 24, Swift
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

import Foundation

// Permutation code from: http://rosettacode.org/wiki/Permutations

func permutations<T> (var ar:[T]) -> [[T]] 
{
	return heaps (&ar, ar.count)
}

func heaps<T> (inout ar:[T], _ n: Int) -> [[T]] 
{
	if (n == 1)
	{
		return [ar]
	}
	
	return ar.reduce (0..<n) {
			(var shuffles, i) in
			shuffles.appendContentsOf (heaps(&ar, n - 1))
			swap (&ar[n % 2 == 0 ? i : 0], &ar[n - 1])
			return shuffles
	}
}

let PERMUTATION_TARGET = 1000000

// This is the first lexicographic permutation
var digits:[Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

// Initial value is first permutation
var permutationCount:Int = 0

for permutation in permutations(digits)
{
	permutationCount++
	
	if (permutationCount == PERMUTATION_TARGET)
	{
		print ("Permutation value is: \(permutation)")
		break
	}
}
