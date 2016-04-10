# Project Euler Problem 19
#
# You are given the following information, but you may prefer to do some research for yourself.
#
# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
#
# Answer: 171

# Ruby doesn't have native enumerations
# Going to come up with my own approach
# to closely mimic the C++ solution

def symbolToInt (symbol)
	case symbol
	when :SUNDAY
		return 0
	when :MONDAY
		return 1
	when :TUESDAY
		return 2
	when :WEDNESDAY
		return 3
	when :THURSDAY
		return 4
	when :FRIDAY
		return 5
	when :SATURDAY
		return 6
	else
		return -1
	end
end

def intToSymbol (integer)
	case integer
	when 0
		return :SUNDAY
	when 1
		return :MONDAY
	when 2
		return :TUESDAY
	when 3
		return :WEDNESDAY
	when 4
		return :THURSDAY
	when 5
		return :FRIDAY
	when 6
		return :SATURDAY
	else
		return :ERROR
	end
end

# Gussian algorithm to determine day of the week
# From: https://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week
def CalculateDayOfWeek (year, month, day)
	# W = ( k + floor(2.6m - 0.2) + Y + floor(Y/4) + floor(C/4) - 2C ) mod 7
	# k is day (1 to 31)
	# m is month (1 = March, ..., 10 = December, 11 = Jan, 12 = Feb)
	# C is century (1987 has C = 19)
	# yr is year (1987 has Y = 87 except Y = 86 for Jan & Feb)
	# W is week day (0 = Sunday, ..., 6 = Saturday)

	d = day
	m = (month + 9) % 12 + 1
	yr = 0
	
	if (m > 10) 
		yr = year - 1
	else 
		yr = year
	end
		
	y = yr % 100;
	c = (yr - (yr % 100)) / 100
 
	w = ( d + (2.6*m - 0.2).floor + y + (y/4.0).floor + (c/4.0).floor - (2*c) ) % 7
	
	# If modulo result was negative we need to address that
	if (w < 0) 
		w += 7
	end
	
	return intToSymbol (w)
end


# Second attempt using day calculation
def SimpleDayCount (yearStart, yearEnd, targetDay)
	# Basic sanity check on input
	if ( (yearStart <= 0) || (yearEnd <= 0) )
		return 0
	end
	
	dayCount = 0;
	
	for i in yearStart..yearEnd
		for j in 1..12
			if (targetDay == CalculateDayOfWeek(i, j, 1))
				dayCount += 1
			end
		end
	end
	
	return dayCount;
end

# First attempt - brute force. Long and repetitive, but gets the job done.
# Really, it could/should be broken up but the need to track the monthStart
# and dayCount means that doing it as a single function is most straightforward.
def BruteForceDayCount (yearStart, yearEnd, startDay, targetDay)
	# Basic sanity check on input
	if ( (yearStart <= 0) || (yearEnd <=0) )
		return 0
	end
	
	monthStart = startDay;
	dayCount = 0;
	
	for i in yearStart..yearEnd
		# January
		if (monthStart == targetDay)
			dayCount += 1
		end
			  
		monthStart = intToSymbol((symbolToInt(monthStart) + 31) % 7)
		
		# February
		if (monthStart == targetDay)
			dayCount += 1
		end
		
		if ((0 == i%4) && (0 != i%400))
			monthStart = intToSymbol((symbolToInt(monthStart) + 29) % 7); # Leap year
		else
			monthStart = intToSymbol((symbolToInt(monthStart) + 28) % 7); # Normal year
		end
		
		# March
		if (monthStart == targetDay)
			dayCount += 1
		end
			  
		monthStart = intToSymbol((symbolToInt(monthStart) + 31) % 7);

		# April
		if (monthStart == targetDay)
			dayCount += 1
		end
					  
		monthStart = intToSymbol((symbolToInt(monthStart) + 30) % 7);
		 
		# May
		if (monthStart == targetDay)
			dayCount += 1
		end
					  
		monthStart = intToSymbol((symbolToInt(monthStart) + 31) % 7);
		
		# June
		if (monthStart == targetDay)
			dayCount += 1
		end
					  
		monthStart = intToSymbol((symbolToInt(monthStart) + 30) % 7);
			   
		# July
		if (monthStart == targetDay)
			dayCount += 1
		end
					  
		monthStart = intToSymbol((symbolToInt(monthStart) + 31) % 7);
		
		# August
		if (monthStart == targetDay)
			dayCount += 1
		end
					  
		monthStart = intToSymbol((symbolToInt(monthStart) + 31) % 7);  
			
		# September
		if (monthStart == targetDay)
			dayCount += 1
		end
					  
		monthStart = intToSymbol((symbolToInt(monthStart) + 30) % 7);
		
		# October
		if (monthStart == targetDay)
			dayCount += 1
		end
					  
		monthStart = intToSymbol((symbolToInt(monthStart) + 31) % 7);
		
		# November
		if (monthStart == targetDay)
			dayCount += 1
		end
					  
		monthStart = intToSymbol((symbolToInt(monthStart) + 30) % 7);
		
		# December
		if (monthStart == targetDay)
			dayCount += 1
		end
					  
		monthStart = intToSymbol((symbolToInt(monthStart) + 31) % 7);
	end
	
	return dayCount;
end

puts "Total brute force count: #{BruteForceDayCount(1901, 2000, :TUESDAY, :SUNDAY)}"
puts "Total simple calculation count: #{SimpleDayCount(1901, 2000, :SUNDAY)}"




