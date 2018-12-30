#!/bin/python
# read file line by line an wait 100ms
from time import sleep

f = open('/opt/files/qa_Video_Games.json')
for line in f:
    print line
    sleep(0.1)
f.close()