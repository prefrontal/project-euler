// Project Euler Problem 48, Swift
//
// The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
// 
// Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
//
// Answer: 9110846700

import Foundation

let MAXIMUM_VALUE:Int = 1000;
let MODULO_VALUE:Int64 = 10000000000;

/* 
 *I brute-forced the problem in my initial implementation. After
 * some research online I learned more about properties of the modulo
 * operator. Specifically:
 * 
 *      (a*b) % c = ((a % c) * (b % c) )% c
 * and
 *      (a+b) % c = ((a % c) + (b % c) )% c
 *
 * These can be used to just operate on the last ten digits of the final
 * sum instead of the entire sequence of values, which becomes HUGE.
 */

// Find the last digits in the series to a defined precision

var result:Int64 = 0;

for (var i:Int = 1; i <= MAXIMUM_VALUE; i++)
{
	var temp:Int64 = Int64(i);
	
	for (var j:Int = 1; j < i; j++)
	{
		temp *= Int64(i);
		temp %= MODULO_VALUE;
	}
	
	result += temp;
	result %= MODULO_VALUE;
}

print ("The final sum is: \(result)")