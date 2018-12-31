#!/bin/bash
sudo yum -y update
sudo yum install -y java-1.8.0-openjdk-headless.x86_64 git
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.amzn2.x86_64/
sudo mkdir /opt/spark
sudo wget -P /opt/spark/ http://www.pirbot.com/mirrors/apache/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz
sudo tar xvzf /opt/spark/spark*.tgz -C /opt/spark/
sudo git clone https://github.com/almooost/btscripts /opt/btscripts
sudo chmod a+x -R /opt/btscripts/
sudo cp /opt/btscripts/spark/metrics.properties /opt/spark/spark-2.4.0-bin-hadoop2.7/conf/
sudo wget -P /opt/spark/ https://s3.amazonaws.com/ffhs-bt-bd/spark/sc001-1.0-SNAPSHOT-jar-with-dependencies.jar
reboot now