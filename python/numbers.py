#!/usr/bin/python

from time import time

print("Finding numbers with Python")

f = map(int,open('d_nums.txt', 'r').read().split(','))

#print(f)

def find_naiive(numbers):
	for first_num in numbers:
		for second_num in numbers:
			if first_num + second_num == 0:
				print("found a match")
				return True

def find_naiive_worst(numbers):
    for first_num in numbers:
        for second_num in numbers:
			# loop
			True

start = time()
find_naiive(f)
ttc = time() - start
print("naiive: %f" % ttc)


start = time()
find_naiive_worst(f)
ttc = time() - start
print("naiive worst %f" % ttc)

def find_hash(numbers):
	seen = {}
	for n in numbers:
		seen[n] = True
		opp = (-1) * n
		if(opp in seen):
			print("found a match")
			return True

def find_hash_worst(numbers):
	seen = {}
	for n in numbers:
		seen[n] = True
        opp = (-1) * n
        if(opp in seen):
			True

start = time()
find_hash(f)
ttc = time() - start
print("hash: %f" % ttc)

start = time()
find_hash_worst(f)
ttc = time() - start
print("hash worst: %f" % ttc)

