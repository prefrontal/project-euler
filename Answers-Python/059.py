#!/usr/bin/python

# Project Euler Problem 59
#
# Each character on a computer is assigned a unique code and the preferred standard is ASCII
# (American Standard Code for Information Interchange).
# For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.
#
# A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a
# given value, taken from a secret key. The advantage with the XOR function is that using the same encryption
# key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.
#
# For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of
# random bytes. The user would keep the encrypted message and the encryption key in different locations, and
# without both "halves", it is impossible to decrypt the message.
#
# Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key.
# If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message.
# The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.
#
# Your task has been made easy, as the encryption key consists of three lower case characters. Using cipher.txt
# (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge
# that the plain text must contain common English words, decrypt the message
# and find the sum of the ASCII values in the original text.
#
# Answer: 129448

# The file provided is a single line of text consisting of numbers
# separated by commas. Each number will represent an ASCII letter once
# XOR'd against the right encryption key

ASCII_LOWERCASE_START = 97
ASCII_LOWERCASE_END = 122


def load_file():
    input_file = open('../Data Files/059-Cipher.txt', 'r')
    text = input_file.read()
    return text.split(',')


def decrypt(message, candidate_key):
    output = []
    for i in range(len(message)):
        key_index = i % len(candidate_key)
        output.append(int(message[i]) ^ candidate_key[key_index])
    return output


def find_key(message):
    best_ascii_count = 0
    best_candidate = ""

    # The target key is a set of three lowercase ASCII characters. We will brute force search
    # across all combinations, evaluating the output by the number of lowercase ASCII characters
    # that we find in the decrypted sequence. Highest number wins.
    for i in range(ASCII_LOWERCASE_START, ASCII_LOWERCASE_END + 1):
        for j in range(ASCII_LOWERCASE_START, ASCII_LOWERCASE_END + 1):
            for k in range(ASCII_LOWERCASE_START, ASCII_LOWERCASE_END + 1):
                candidate = decrypt(message, [i, j, k])
                num_ascii_chars = len([x for x in candidate if ASCII_LOWERCASE_START <= x <= ASCII_LOWERCASE_END])
                if best_ascii_count < num_ascii_chars:
                    print(num_ascii_chars, " - ", [i, j, k])
                    best_ascii_count = num_ascii_chars
                    best_candidate = candidate

    return best_candidate


# Processing start
original_message = load_file()
decrypted_message = find_key(original_message)

# Print results
print("".join(chr(i) for i in decrypted_message))
print("Answer: ", sum(decrypted_message))
