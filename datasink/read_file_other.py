#!/bin/python
# read file line by line and keep decrasing sleep time
from time import sleep

f = open('/opt/files/qa_Video_Games.json')
speed = float(0.01)
for line in f:
    print line
    sleep(speed)
    speed = float(speed / 1.00001)
f.close()