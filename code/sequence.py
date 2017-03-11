import sys
import os

def sequence(input):
    if input ==0 : return 0
    if input == 1: return 1
    else: return sequence(input-1)+sequence(input-2)

def main():
    result = sequence(4)
    print(result)

if __name__ == "__main__":
    main()
