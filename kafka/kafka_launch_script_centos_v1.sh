#!/bin/bash
yum -y update
yum install -y java-1.8.0-openjdk-headless.x86_64
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.181-3.b13.amzn2.x86_64/
ln -s /usr/bin/python3 /usr/bin/python
mkdir /opt/kafka
wget -P /opt/kafka/ mirror.switch.ch/mirror/apache/dist/kafka/2.0.0/kafka_2.11-2.0.0.tgz
tar xvzf /opt/kafka/kafka*.tgz -C /opt/kafka/
reboot now
