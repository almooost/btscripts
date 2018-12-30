#!/bin/bash
yum -y update
yum install -y java-1.8.0-openjdk-headless.x86_64
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.181-3.b13.amzn2.x86_64/
ln -s /usr/bin/python3 /usr/bin/python
mkdir /opt/flink
wget -P /opt/flink/ http://mirror.switch.ch/mirror/apache/dist/flink/flink-1.6.1/flink-1.6.1-bin-hadoop28-scala_2.11.tgz
tar xvzf /opt/flink/flink*.tgz -C /opt/flink/
reboot now
