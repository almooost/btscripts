#!/bin/bash
yum -y update
sudo mkdir /opt/files
sudo wget -P /opt/files/ http://jmcauley.ucsd.edu/data/amazon/qa/qa_Video_Games.json.gz
sudo cd /opt/files/
sudo gunzip /opt/files/*.gz
reboot now