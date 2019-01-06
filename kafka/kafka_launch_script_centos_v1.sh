#!/bin/bash
# Update machine and install java, export java HOME path
yum -y update
yum install -y java-1.8.0-openjdk-headless.x86_64 git
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.amzn2.x86_64/
# Link Python (if needed)
ln -s /usr/bin/python3 /usr/bin/python
# Create kafka directory, download it and change configuration
mkdir /opt/kafka
wget -P /opt/kafka/ http://mirror.easyname.ch/apache/kafka/2.1.0/kafka_2.11-2.1.0.tgz 
tar xvzf /opt/kafka/kafka*.tgz -C /opt/kafka/
# Download execution scripts, etc.
sudo git clone https://github.com/almooost/btscripts /opt/btscripts
sudo chmod a+x -R /opt/btscripts/
# set custom server.properies
sudo cat /opt/btscripts/kafka/server.properties >> /opt/kafka/kafka_2.11-2.1.0/config/server.properties
reboot now
