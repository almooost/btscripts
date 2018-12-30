#!/bin/bash
yum -y update
yum install -y java-1.8.0-openjdk-headless.x86_64
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.181-3.b13.amzn2.x86_64/
ln -s /usr/bin/python3 /usr/bin/python
mkdir /opt/spark
wget -P /opt/spark/ http://mirror.switch.ch/mirror/apache/dist/spark/spark-2.3.2/spark-2.3.2-bin-hadoop2.7.tgz
tar xvzf /opt/spark/spark*.tgz -C /opt/spark/
reboot now
