#!/usr/bin/python

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

import math


# Using this class like an enumeration
class Weekday:
    SUNDAY = 0
    MONDAY = 1
    TUESDAY = 2
    WEDNESDAY = 3
    THURSDAY = 4
    FRIDAY = 5
    SATURDAY = 6


# Gaussian algorithm to determine day of the week
# From: https://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week
def calculate_dat_of_week(year, month, day):
    # W = ( k + floor(2.6m - 0.2) + Y + floor(Y/4) + floor(C/4) - 2C ) mod 7
    # k is day (1 to 31)
    # m is month (1 = March, ..., 10 = December, 11 = Jan, 12 = Feb)
    # C is century (1987 has C = 19)
    # Y is year (1987 has Y = 87 except Y = 86 for Jan & Feb)
    # W is week day (0 = Sunday, ..., 6 = Saturday)

    d = day
    m = float((month + 9) % 12 + 1)
    y = 0

    if m > 10:
        Y = year - 1
    else:
        Y = year

    y = Y % 100
    c = (Y - (Y % 100)) / 100

    w = (d + math.floor(2.6 * m - 0.2) + y + math.floor(y / 4.0) + math.floor(c / 4.0) - (2 * c)) % 7

    # If modulo result was negative we need to address that
    if w < 0:
        w += 7

    return w


# Second attempt using day calculation
def simple_day_count(year_start, year_end, target_day):
    # Basic sanity check on input
    if (year_start <= 0) or (year_end <= 0):
        return 0

    day_count = 0

    for i in range(year_start, year_end + 1):
        for j in range(1, 12 + 1):
            if target_day == calculate_dat_of_week(i, j, 1):
                day_count += 1

    return day_count


# First attempt - brute force. Long and repetitive, but gets the job done.
# Really, it could/should be broken up but the need to track the monthStart
# and dayCount means that doing it as a single function is most straightforward.
def brute_force_day_count(year_start, year_end, start_day, target_day):
    # Basic sanity check on input
    if (year_start <= 0) or (year_end <= 0):
        return 0

    month_start = start_day
    day_count = 0

    for i in range(year_start, year_end + 1):
        # January
        if month_start == target_day:
            day_count += 1

        month_start = (month_start + 31) % 7

        # February
        if month_start == target_day:
            day_count += 1

        if (0 == i % 4) and (0 != i % 400):
            month_start = (month_start + 29) % 7  # Leap year
        else:
            month_start = (month_start + 28) % 7  # Normal year

        # March
        if month_start == target_day:
            day_count += 1

        month_start = (month_start + 31) % 7

        # April
        if month_start == target_day:
            day_count += 1

        month_start = (month_start + 30) % 7

        # May
        if month_start == target_day:
            day_count += 1

        month_start = (month_start + 31) % 7

        # June
        if month_start == target_day:
            day_count += 1

        month_start = (month_start + 30) % 7

        # July
        if month_start == target_day:
            day_count += 1

        month_start = (month_start + 31) % 7

        # August
        if month_start == target_day:
            day_count += 1

        month_start = (month_start + 31) % 7

        # September
        if month_start == target_day:
            day_count += 1

        month_start = (month_start + 30) % 7

        # October
        if month_start == target_day:
            day_count += 1

        month_start = (month_start + 31) % 7

        # November
        if month_start == target_day:
            day_count += 1

        month_start = (month_start + 30) % 7

        # December
        if month_start == target_day:
            day_count += 1

        month_start = (month_start + 31) % 7

    return day_count


print ("Total brute force count: ", brute_force_day_count(1901, 2000, Weekday.TUESDAY, Weekday.SUNDAY))
print ("Total simple calculation count: ", simple_day_count(1901, 2000, Weekday.SUNDAY))
