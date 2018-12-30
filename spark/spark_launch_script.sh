#!/bin/bash
apt-get update
apt-get -y dist-upgrade
apt-get -y autoremove
apt-get -y install openjdk-8-jdk-headless
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
ln -s /usr/bin/python3 /usr/bin/python
mkdir /opt/spark
wget -P /opt/spark/ http://mirror.switch.ch/mirror/apache/dist/spark/spark-2.3.2/spark-2.3.2-bin-hadoop2.7.tgz
tar xvzf /opt/spark/spark*.tgz -C /opt/spark/
