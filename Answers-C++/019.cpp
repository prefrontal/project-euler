// Project Euler Problem 19
//
// You are given the following information, but you may prefer to do some research for yourself.
//
// 1 Jan 1900 was a Monday.
// Thirty days has September,
// April, June and November.
// All the rest have thirty-one,
// Saving February alone,
// Which has twenty-eight, rain or shine.
// And on leap years, twenty-nine.
// A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
// How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
//
// Answer: 171

#include <cmath>
#include <iostream>

enum Weekday
{
    SUNDAY    = 0,
    MONDAY    = 1,
    TUESDAY   = 2,
    WEDNESDAY = 3,
    THURSDAY  = 4,
    FRIDAY    = 5,
    SATURDAY  = 6
};

// Gussian algorithm to determine day of the week
// From: https://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week
Weekday CalculateDayOfWeek (int year, int month, int day)
{    
    // W = ( k + floor(2.6m - 0.2) + Y + floor(Y/4) + floor(C/4) - 2C ) mod 7
    // k is day (1 to 31)
    // m is month (1 = March, ..., 10 = December, 11 = Jan, 12 = Feb)
    // C is century (1987 has C = 19)
    // Y is year (1987 has Y = 87 except Y = 86 for Jan & Feb)
    // W is week day (0 = Sunday, ..., 6 = Saturday)

    int d = day;
    double m = (double) ((month + 9) % 12 + 1);
    int Y;
    
    if (m > 10) 
        Y = year - 1;
    else 
        Y = year;
        
    int y = Y % 100;
    int c = (Y - (Y % 100)) / 100;
 
    int w = ( d + (int)floor(2.6*m - 0.2) + y + (int)floor(y/4.0) + (int)floor(c/4.0) - (2*c) ) % 7;
    
    // If modulo result was negative we need to address that
    if (w < 0) 
        w += 7;
    
    return static_cast<Weekday>(w); 
}


// Second attempt using day calculation
int SimpleDayCount (const int yearStart, const int yearEnd, const Weekday targetDay)
{
    // Basic sanity check on input
    if ( (yearStart <= 0) || (yearEnd <=0) )
        return 0;
    
    int dayCount = 0;
    
    for (int i = yearStart; i <= yearEnd; i++)
    {
        for (int j = 1; j <=12; j++)
        { 
            if (targetDay == CalculateDayOfWeek (i, j, 1))
                dayCount++;
        }
    }
    
    return dayCount;
}

// First attempt - brute force. Long and repetitive, but gets the job done.
// Really, it could/should be broken up but the need to track the monthStart
// and dayCount means that doing it as a single function is most straightforward.
int BruteForceDayCount (const int yearStart, const int yearEnd, const Weekday startDay, const Weekday targetDay)
{
    // Basic sanity check on input
    if ( (yearStart <= 0) || (yearEnd <=0) )
        return 0;
    
    Weekday monthStart = startDay;
    int dayCount = 0;
    
    for (int i = yearStart; i <= yearEnd; i++)
    {   
        // January
        if (monthStart == targetDay)
            dayCount++;
              
        monthStart = static_cast<Weekday>((monthStart + 31) % 7);
        
        // February
        if (monthStart == targetDay)
            dayCount++;
        
        if ((0 == i%4) && (0 != i%400))
            monthStart = static_cast<Weekday>((monthStart + 29) % 7); // Leap year
        else
            monthStart = static_cast<Weekday>((monthStart + 28) % 7); // Normal year
        
        // March
        if (monthStart == targetDay)
            dayCount++;
              
        monthStart = static_cast<Weekday>((monthStart + 31) % 7);

        // April
        if (monthStart == targetDay)
            dayCount++;
                      
        monthStart = static_cast<Weekday>((monthStart + 30) % 7);
         
        // May
        if (monthStart == targetDay)
            dayCount++;
                      
        monthStart = static_cast<Weekday>((monthStart + 31) % 7);
        
        // June
        if (monthStart == targetDay)
            dayCount++;
                      
        monthStart = static_cast<Weekday>((monthStart + 30) % 7);
               
        // July
        if (monthStart == targetDay)
            dayCount++;
                      
        monthStart = static_cast<Weekday>((monthStart + 31) % 7);
        
        // August
        if (monthStart == targetDay)
            dayCount++;
                      
        monthStart = static_cast<Weekday>((monthStart + 31) % 7);  
            
        // September
        if (monthStart == targetDay)
            dayCount++;
                      
        monthStart = static_cast<Weekday>((monthStart + 30) % 7);
        
        // October
        if (monthStart == targetDay)
            dayCount++;
                      
        monthStart = static_cast<Weekday>((monthStart + 31) % 7);
        
        // November
        if (monthStart == targetDay)
            dayCount++;
                      
        monthStart = static_cast<Weekday>((monthStart + 30) % 7);
        
        // December
        if (monthStart == targetDay)
            dayCount++;
                      
        monthStart = static_cast<Weekday>((monthStart + 31) % 7);
    }
    
    return dayCount;
}

int main (int argc, char *argv[]) 
{
    std::cout << "Total brute force count: " << BruteForceDayCount(1901, 2000, TUESDAY, SUNDAY) << std::endl;
    std::cout << "Total simple calculation count: " << SimpleDayCount (1901, 2000, SUNDAY) << std::endl;
}



