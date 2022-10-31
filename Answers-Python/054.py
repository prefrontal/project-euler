#!/usr/bin/python

# Project Euler Problem 54
#
# In the card game poker, a hand consists of five cards and are ranked, from lowest to highest, in the following way:
#
# High Card: Highest value card.
# One Pair: Two cards of the same value.
# Two Pairs: Two different pairs.
# Three of a Kind: Three cards of the same value.
# Straight: All cards are consecutive values.
# Flush: All cards of the same suit.
# Full House: Three of a kind and a pair.
# Four of a Kind: Four cards of the same value.
# Straight Flush: All cards are consecutive values of same suit.
# Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
# The cards are valued in the order:
# 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
# 
# If two players have the same ranked hands then the rank made up of the highest value wins; for example, 
# a pair of eights beats a pair of fives (see example 1 below). But if two ranks tie, for example, both players 
# have a pair of queens, then highest cards in each hand are compared (see example 4 below); if the highest cards 
# tie then the next highest cards are compared, and so on.
# 
# Consider the following five hands dealt to two players:
# 
# Hand	 	Player 1	 	    Player 2	 	        Winner
# 1	 	5H 5C 6S 7S KD      2C 3S 8S 8D TD         Player 2
#          Pair of Fives      Pair of Eights
#      
# 2	 	5D 8C 9S JS AC      2C 5C 7D 8S QH         Player 1
#          Highest card Ace    Highest card Queen
#      
# 3	 	2D 9C AS AH AC      3D 6D 7D TD QD         Player 2
#          Three Aces          Flush with Diamonds
#      
# 4	 	4D 6S 9H QH QC      3D 6D 7H QD QS         Player 1
#          Pair of Queens      Pair of Queens
#          Highest card Nine   Highest card Seven
#      
# 5	 	2H 2D 4C 4D 4S      3C 3D 3S 9S 9D         Player 1
#          Full House          Full House
#          With Three Fours    with Three Threes
# 
# The file, poker.txt, contains one-thousand random hands dealt to two players. Each line of the file contains
# ten cards (separated by a single space): the first five are Player 1's cards and the last five are Player 2's
# cards. You can assume that all hands are valid (no invalid characters or repeated cards), each player's hand
# is in no specific order, and in each hand there is a clear winner.
# 
# How many hands does Player 1 win?
#
# Answer: 376

from collections import Counter


def load_file():
    input_file = open('../Data Files/054-Poker.txt', 'r')
    text = input_file.readlines()
    return text


def is_royal_flush(values, suits):
    # We know what cards they should have. It should add up to 60 and there should only be one suit.
    if sum(values) == 60 and len(set(suits)) == 1:
        return 10
    return 0


def is_straight_flush(values, suits):
    # Check that each card is one greater than the last
    values.sort()
    test1 = values[1] == values[0] + 1
    test2 = values[2] == values[1] + 1
    test3 = values[3] == values[2] + 1
    test4 = values[4] == values[3] + 1

    if test1 and test2 and test3 and test4 and len(set(suits)) == 1:
        return 9
    return 0


def compare_straight_flush(values1, values2):
    # Check the highest card, since we know it is a straight
    values1.sort()
    values2.sort()
    if values1[4] == values2[4]:
        return 0
    elif values1[4] > values2[4]:
        return 1
    return 2


def is_four_of_a_kind(values):
    # Make sure that the most frequent card occurs four times
    counts = Counter(values)
    if counts.most_common(1)[0][1] == 4:
        return 8
    return 0


def compare_four_of_a_kind(values1, values2):
    # Compare the set of four first
    counts1 = Counter(values1)
    counts2 = Counter(values2)

    high1 = counts1.most_common(1)[0][0]
    high2 = counts2.most_common(1)[0][0]

    if high1 > high2:
        return 1
    elif high1 < high2:
        return 2

    # Compare the one remaining card
    remainder1 = counts1.most_common(2)[1][0]
    remainder2 = counts2.most_common(2)[1][0]

    if remainder1 == remainder2:
        return 0
    elif remainder1 > remainder2:
        return 1
    return 2


def is_full_house(values):
    # Just make sure that the first most common card has three and the next most is two
    counts = Counter(values)
    if counts.most_common(1)[0][1] == 3 and counts.most_common(2)[1][1] == 2:
        return 7
    return 0


def compare_full_house(values1, values2):
    # Compare the set of three cards
    counts1 = Counter(values1)
    counts2 = Counter(values2)

    first1 = counts1.most_common(1)[0][0]
    first2 = counts2.most_common(1)[0][0]

    if first1 > first2:
        return 1
    elif first1 < first2:
        return 2

    # Compare the pair of cards
    second1 = counts1.most_common(2)[1][0]
    second2 = counts2.most_common(2)[1][0]

    if second1 == second2:
        return 0
    elif second1 > second2:
        return 1
    return 2


def is_flush(suits):
    # Make sure that there is only one suit
    if len(set(suits)) == 1:
        return 6
    return 0


def compare_flush(values1, values2):
    values1.sort(reverse=True)
    values2.sort(reverse=True)
    for i in range(5):
        if values1[i] > values2[i]:
            return 1
        elif values1[i] < values2[i]:
            return 2
    return 0


def is_straight(values):
    # Check that each card is one greater than the last
    values.sort()
    test1 = values[1] == values[0] + 1
    test2 = values[2] == values[1] + 1
    test3 = values[3] == values[2] + 1
    test4 = values[4] == values[3] + 1

    if test1 and test2 and test3 and test4:
        return 5
    return 0


def compare_straight(values1, values2):
    # Compare the highest card, since we know it is a straight
    values1.sort()
    values2.sort()

    if values1[4] == values2[4]:
        return 0
    elif values1[4] > values2[4]:
        return 1
    return 2


def is_three_of_a_kind(values):
    # Just make sure that the first most common card has three and the next most is one
    counts = Counter(values)
    if counts.most_common(2)[0][1] == 3 and counts.most_common(2)[1][1] == 1:
        return 4
    return 0


def compare_three_of_a_kind(values1, values2):
    # Check out the trip set first
    counts1 = Counter(values1)
    counts2 = Counter(values2)

    trip1 = counts1.most_common(1)[0][0]
    trip2 = counts2.most_common(1)[0][0]

    if trip1 > trip2:
        return 1
    elif trip1 < trip2:
        return 2

    # So, same values for the pair. Examine the rest of the cards
    remainder1 = values1
    remainder2 = values2

    remainder1.remove(trip1)
    remainder2.remove(trip2)

    remainder1.sort(reverse=True)
    remainder2.sort(reverse=True)

    for i in range(2):
        if remainder1[i] > remainder2[i]:
            return 1
        elif remainder1[i] < remainder2[i]:
            return 2

    return 0


def is_two_pairs(values):
    # Just make sure tht the two most common cards have a count of two
    counts = Counter(values)
    if counts.most_common(2)[0][1] == 2 and counts.most_common(2)[1][1] == 2:
        return 3
    return 0


def compare_two_pairs(values1, values2):
    # Examine the pairs
    counts1 = Counter(values1)
    counts2 = Counter(values2)

    for i in range(2):
        pair1 = counts1.most_common(2)[i][0]
        pair2 = counts2.most_common(2)[i][0]

        if pair1 > pair2:
            return 1
        elif pair1 < pair2:
            return 2

    # Identical sets of pairs. Take a look at the last card.
    remainder1 = counts1.most_common(3)[2][0]
    remainder2 = counts2.most_common(3)[2][0]

    if remainder1 == remainder2:
        return 0
    elif remainder1 > remainder2:
        return 1
    return 2


def is_one_pair(values):
    # Just make sure that the first most common card has two and the next most is one
    counts = Counter(values)
    if counts.most_common(2)[0][1] == 2 and counts.most_common(2)[1][1] == 1:
        return 2
    return 0


def compare_one_pair(values1, values2):
    # Check out the pair first
    counts1 = Counter(values1)
    counts2 = Counter(values2)

    pair1 = counts1.most_common(2)[0][0]
    pair2 = counts2.most_common(2)[0][0]

    if pair1 > pair2:
        return 1
    elif pair1 < pair2:
        return 2

    # So, same values for the pair. Examine the rest of the cards.
    remainder1 = values1
    remainder2 = values2

    remainder1.remove(pair1)
    remainder2.remove(pair2)

    remainder1.sort(reverse=True)
    remainder2.sort(reverse=True)

    for i in range(3):
        if remainder1[i] > remainder2[i]:
            return 1
        elif remainder1[i] < remainder2[i]:
            return 2

    return 0


def compare_high_card(values1, values2):
    # Sort each from high to low and compare each index value
    values1.sort(reverse=True)
    values2.sort(reverse=True)
    for i in range(5):
        if values1[i] > values2[i]:
            return 1
        elif values1[i] < values2[i]:
            return 2
    return 0


# Given a set of 10 card values and 10 card suits, determine the winner
def calc_winner(values, suits):
    values1 = values[0:5]
    values2 = values[5:10]
    suits1 = suits[0:5]
    suits2 = suits[5:10]

    # Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
    # Straight Flush: All cards are consecutive values of same suit.
    # Four of a Kind: Four cards of the same value.
    # Full House: Three of a kind and a pair.
    # Flush: All cards of the same suit.
    # Straight: All cards are consecutive values.
    # Three of a Kind: Three cards of the same value.
    # Two Pairs: Two different pairs.
    # One Pair: Two cards of the same value.

    # ROYAL FLUSH
    if is_royal_flush(values1, suits1) > is_royal_flush(values2, suits2):
        return 1
    elif is_royal_flush(values1, suits1) < is_royal_flush(values2, suits2):
        return 2
    elif is_royal_flush(values1, suits1) > 0 and is_royal_flush(values1, suits1) == is_royal_flush(values2, suits2):
        return 0

    # No need to compare royal flushes, since if both players have one it is a tie

    # STRAIGHT FLUSH
    if is_straight_flush(values1, suits1) > is_straight_flush(values2, suits2):
        return 1
    elif is_straight_flush(values1, suits1) < is_straight_flush(values2, suits2):
        return 2

    # STRAIGHT FLUSH - TIE
    if is_straight_flush(values1, suits1) > 0 and is_straight_flush(values1, suits1) == is_straight_flush(values2, suits2):
        return compare_straight_flush(values1, values2)

    # FOUR OF A KIND
    if is_four_of_a_kind(values1) > is_four_of_a_kind(values2):
        return 1
    elif is_four_of_a_kind(values1) < is_four_of_a_kind(values2):
        return 2

    # FOUR OF A KIND - TIE
    if is_four_of_a_kind(values1) > 0 and is_four_of_a_kind(values1) == is_four_of_a_kind(values2):
        return compare_four_of_a_kind(values1, values2)

    # FULL HOUSE
    if is_full_house(values1) > is_full_house(values2):
        return 1
    elif is_full_house(values1) < is_full_house(values2):
        return 2

    # FULL HOUSE - TIE
    if is_full_house(values1) > 0 and is_full_house(values1) == is_full_house(values2):
        return compare_full_house(values1, values2)

    # FLUSH
    if is_flush(suits1) > is_flush(suits2):
        return 1
    elif is_flush(suits1) < is_flush(suits2):
        return 2

    # FLUSH - TIE
    if is_flush(suits1) > 0 and is_flush(suits1) == is_flush(suits2):
        return compare_flush(suits1, suits2)

    # STRAIGHT
    if is_straight(values1) > is_straight(values2):
        return 1
    elif is_straight(values1) < is_straight(values2):
        return 2

    # STRAIGHT - TIE
    if is_straight(values1) > 0 and is_straight(values1) == is_straight(values2):
        return compare_straight(values1, values2)

    # THREE OF A KIND
    if is_three_of_a_kind(values1) > is_three_of_a_kind(values2):
        return 1
    elif is_three_of_a_kind(values1) < is_three_of_a_kind(values2):
        return 2

    # THREE OF A KIND - TIE
    if is_three_of_a_kind(values1) > 0 and is_three_of_a_kind(values1) == is_three_of_a_kind(values2):
        return compare_three_of_a_kind(values1, values2)

    # TWO PAIRS
    if is_two_pairs(values1) > is_two_pairs(values2):
        return 1
    elif is_two_pairs(values1) < is_two_pairs(values2):
        return 2

    # TWO PAIRS - TIE
    if is_two_pairs(values1) > 0 and is_two_pairs(values1) == is_two_pairs(values2):
        return compare_two_pairs(values1, values2)

    # ONE PAIR
    if is_one_pair(values1) > is_one_pair(values2):
        return 1
    elif is_one_pair(values1) < is_one_pair(values2):
        return 2

    # ONE PAIR - TIE
    if is_one_pair(values1) > 0 and is_one_pair(values1) == is_one_pair(values2):
        return compare_one_pair(values1, values2)

    # HIGH CARD
    return compare_high_card(values1, values2)


# Test out each set of card handlers to ensure they work right
def test_card_handlers():
    if is_royal_flush([14, 13, 12, 11, 10], [5, 5, 5, 5, 5]) != 10:
        print("Is royal flush error")

    if is_straight_flush([5, 6, 7, 8, 9], [5, 5, 5, 5, 5]) != 9:
        print("Is straight flush error")

    if compare_straight_flush([5, 6, 7, 8, 9], [5, 6, 7, 8, 9]) != 0:
        print("Compare straight flush tie error")
    if compare_straight_flush([6, 7, 8, 9, 10], [5, 6, 7, 8, 9]) != 1:
        print("Compare straight flush p1 error")
    if compare_straight_flush([5, 6, 7, 8, 9], [6, 7, 8, 9, 10]) != 2:
        print("Compare straight flush p2 error")

    if is_four_of_a_kind([9, 9, 9, 9, 8]) != 8:
        print("Is four of a kind error")

    if compare_four_of_a_kind([9, 9, 9, 9, 8], [9, 9, 9, 9, 8]) != 0:
        print("Compare four of a kind error")
    if compare_four_of_a_kind([9, 9, 9, 9, 8], [7, 7, 7, 7, 8]) != 1:
        print("Compare four of a kind p1 error")
    if compare_four_of_a_kind([7, 7, 7, 7, 8], [9, 9, 9, 9, 8]) != 2:
        print("Compare four of a kind p2 error")
    if compare_four_of_a_kind([9, 9, 9, 9, 10], [9, 9, 9, 9, 8]) != 1:
        print("Compare four of a kind p1 high card error")
    if compare_four_of_a_kind([9, 9, 9, 9, 8], [9, 9, 9, 9, 10]) != 2:
        print("Compare four of a kind p2 high card error")

    if is_full_house([9, 9, 9, 8, 8]) != 7:
        print("Is full house error")

    if compare_full_house([9, 9, 9, 8, 8], [9, 9, 9, 8, 8]) != 0:
        print("Compare full house tie error")
    if compare_full_house([9, 9, 9, 8, 8], [9, 9, 9, 7, 7]) != 1:
        print("Compare full house p1 error")
    if compare_full_house([9, 9, 9, 7, 7], [9, 9, 9, 8, 8]) != 2:
        print("Compare full house p2 error")

    if is_flush([9, 9, 9, 9, 9]) != 6:
        print("Is straight error")

    if compare_flush([5, 6, 7, 8, 9], [5, 6, 7, 8, 9]) != 0:
        print("Compare flush tie error")
    if compare_flush([5, 6, 7, 8, 9], [4, 5, 6, 7, 8]) != 1:
        print("Compare flush p1 error")
    if compare_flush([4, 5, 6, 7, 8], [5, 6, 7, 8, 9]) != 2:
        print("Compare flush p2 error")

    if is_straight([5, 6, 7, 8, 9]) != 5:
        print("Is straight error")

    if compare_straight([5, 6, 7, 8, 9], [5, 6, 7, 8, 9]) != 0:
        print("Compare straight tie error")
    if compare_straight([5, 6, 7, 8, 9], [4, 5, 6, 7, 8]) != 1:
        print("Compare straight p1 error")
    if compare_straight([4, 5, 6, 7, 8], [5, 6, 7, 8, 9]) != 2:
        print("Compare straight p2 error")

    if is_three_of_a_kind([7, 7, 7, 3, 8]) != 4:
        print("Is three of a kind error")

    if compare_three_of_a_kind([5, 5, 5, 6, 7], [5, 5, 5, 6, 7]) != 0:
        print("Compare three of a kind tie error")
    if compare_three_of_a_kind([5, 5, 5, 6, 7], [4, 4, 4, 6, 7]) != 1:
        print("Compare three of a kind p1 trip error")
    if compare_three_of_a_kind([4, 4, 4, 6, 7], [5, 5, 5, 6, 7]) != 2:
        print("Compare three of a kind p2 trip error")
    if compare_three_of_a_kind([5, 5, 5, 6, 8], [5, 5, 5, 6, 7]) != 1:
        print("Compare three of a kind p1 high card error")
    if compare_three_of_a_kind([5, 5, 5, 6, 7], [5, 5, 5, 6, 8]) != 2:
        print("Compare three of a kind p2 high card error")

    if is_two_pairs([5, 5, 6, 6, 12]) != 3:
        print("Is two pairs error")

    if compare_two_pairs([5, 5, 10, 6, 6], [5, 5, 10, 6, 6]) != 0:
        print("Compare two pair tie error")
    if compare_two_pairs([5, 5, 10, 7, 7], [5, 5, 10, 6, 6]) != 1:
        print("Compare two pair p1 pair error")
    if compare_two_pairs([5, 5, 10, 6, 6], [5, 5, 10, 7, 7]) != 2:
        print("Compare two pair p2 pair error")
    if compare_two_pairs([5, 5, 11, 6, 6], [5, 5, 10, 6, 6]) != 1:
        print("Compare two pair p1 high card error")
    if compare_two_pairs([5, 5, 10, 6, 6], [5, 5, 11, 6, 6]) != 2:
        print("Compare two pair p2 high card error")

    if is_one_pair([5, 5, 10, 6, 12]) != 2:
        print("Is one pair error")

    if compare_one_pair([5, 5, 10, 6, 12], [5, 5, 10, 6, 12]) != 0:
        print("Compare one pair tie error")
    if compare_one_pair([5, 5, 10, 6, 12], [4, 4, 10, 6, 12]) != 1:
        print("Compare one pair p1 pair error")
    if compare_one_pair([5, 5, 10, 6, 12], [6, 6, 10, 6, 12]) != 2:
        print("Compare one pair p2 pair error")
    if compare_one_pair([5, 5, 10, 6, 12], [5, 5, 10, 6, 11]) != 1:
        print("Compare one pair p1 high card error")
    if compare_one_pair([5, 5, 10, 6, 11], [6, 6, 10, 6, 12]) != 2:
        print("Compare one pair p2 high card error")

    if compare_high_card([10, 8, 6, 5, 3],[10, 8, 6, 5, 3]) != 0:
        print("Compare high card tie error")
    if compare_high_card([10, 8, 6, 5, 3],[9, 8, 6, 5, 3]) != 1:
        print("Compare high card p1 error")
    if compare_high_card([9, 8, 6, 5, 3],[10, 8, 6, 5, 3]) != 2:
        print("Compare high card p2 error")


# -----------------------------------------------------------------------------

hands = load_file()
player1_win_count = 0

for hand in hands:
    # Test out the card handlers before we proceed
    test_card_handlers()

    # Split the text line into cards, removing the line break
    cards = hand[:-1].split(' ')

    # Break each card up into a value and a suit
    values = []
    suits = []
    for card in cards:
        values.append(card[0])
        suits.append(card[1])

    # Translate face cards into a value and convert others to integers
    for i, value in enumerate(values):
        if value == "A":
            values[i] = 14
        elif value == "K":
            values[i] = 13
        elif value == "Q":
            values[i] = 12
        elif value == "J":
            values[i] = 11
        elif value == "T":
            values[i] = 10
        else:
            values[i] = int(values[i])

    # See who the winner is for each hand
    winner = calc_winner(values, suits)
    if winner == 1:
        player1_win_count += 1

print("Player1 win count: ", player1_win_count)



















