#!/bin/python
# read file line by line and keep decrasing sleep time
from time import sleep

f = open('/opt/files/reviews.json')
speed = float(0.0001)
for line in f:
    print line
    sleep(speed)
#    speed = float(speed / 1.00001)
f.close()