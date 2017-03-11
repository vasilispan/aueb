import sys
import os

def popchar(input):
    frequencies = [(c, input.count(c)) for c in set(input)]
    return max(frequencies, key=lambda x: x[1])[0]  

def main():
    result = popchar('aaacc')
    print(result)

if __name__ == "__main__":
    main()
