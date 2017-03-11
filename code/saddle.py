import sys
import os

def saddlepoint(input):
    if len(input) % 2 != 0:
	sys.exit("input not square array")
    print([i,row in enumerate(input)])

def main():
    result = saddlepoint([1,2,3,5,8,9,])
    #print(result)

if __name__ == "__main__":
    main()
