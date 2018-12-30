#!/bin/bash
yum -y update
yum install -y java-1.8.0-openjdk-headless.x86_64
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.amzn2.x86_64/
ln -s /usr/bin/python3 /usr/bin/python
mkdir /opt/flink
wget -P /opt/flink/ http://mirror.easyname.ch/apache/flink/flink-1.7.0/flink-1.7.0-bin-hadoop28-scala_2.11.tgz
tar xvzf /opt/flink/flink*.tgz -C /opt/flink/
reboot now
