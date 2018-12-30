#!/bin/bash
yum -y update
yum install -y java-1.8.0-openjdk-headless.x86_64
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.amzn2.x86_64/
ln -s /usr/bin/python3 /usr/bin/python
mkdir /opt/kafka
wget -P /opt/kafka/ http://mirror.easyname.ch/apache/kafka/2.1.0/kafka_2.11-2.1.0.tgz 
tar xvzf /opt/kafka/kafka*.tgz -C /opt/kafka/
sudo sed -i 's/104857600/2066182517/g' /opt/kafka/kafka_2.11-2.1.0/config/server.properties
reboot now