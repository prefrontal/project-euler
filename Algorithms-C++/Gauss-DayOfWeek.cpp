// Gussian algorithm to determine day of the week
// From: https://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week
int CalculateDayOfWeek (int year, int month, int day)
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
    
    return w; 
}