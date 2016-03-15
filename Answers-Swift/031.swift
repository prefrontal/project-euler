// Project Euler Problem 31, Swift
//
// In England the currency is made up of pound, £, and pence, p, 
// and there are eight coins in general circulation:
// 
// 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
//
// It is possible to make £2 in the following way:
// 
// 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
//
// How many different ways can £2 be made using any number of coins?
//
// Answer: 73682

import Foundation

let TARGET_VALUE = 200;

var coinValues:[Int] = [1, 2, 5, 10, 20, 50, 100, 200]

var finalCount:Int = 0;

// Seven nested for loops isn't pretty, but it gets the job done
for (var a:Int = 0; a <= 200; a++) 
{
	for (var b:Int = 0; b <= 100; b++) 
	{
		for (var c:Int = 0; c <= 40; c++) 
		{
			for (var d:Int = 0; d <= 20; d++) 
			{
				for (var e:Int = 0; e <= 10; e++) 
				{
					for (var f:Int = 0; f <= 4; f++) 
					{
						for (var g:Int = 0; g <= 2; g++)
						{
							var temp:Int = a + 2*b + 5*c + 10*d + 20*e + 50*f + 100*g;
							
							if (temp == TARGET_VALUE)
							{
								finalCount++;
							}
						}
					}
				}
			}
		}
	}
}
							
// Add one for the £2 coin. Done to keep it out of the nested loops.
finalCount += 1;

print ("The number of ways to make £2 is: \(finalCount)")