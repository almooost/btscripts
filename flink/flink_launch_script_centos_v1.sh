#!/bin/bash
yum -y update
yum install -y java-1.8.0-openjdk-headless.x86_64 git
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.amzn2.x86_64/
ln -s /usr/bin/python3 /usr/bin/python
mkdir /opt/flink
wget -P /opt/flink/ https://archive.apache.org/dist/flink/flink-1.7.0/flink-1.7.0-bin-hadoop28-scala_2.11.tgz
tar xvzf /opt/flink/flink*.tgz -C /opt/flink/
sudo git clone https://github.com/almooost/btscripts /opt/btscripts
sudo chmod a+x -R /opt/btscripts/
sudo cp /opt/flink/flink-1.7.0/opt/flink-metrics-graphite-1.7.0.jar /opt/flink/flink-1.7.0/lib/
sudo cat /opt/btscripts/flink/flink_conf_metrics.yml >> /opt/flink/flink-1.7.0/conf/flink-conf.yaml
sudo wget -P /opt/flink/ https://s3.amazonaws.com/ffhs-bt-bd/flink/fc001-2.0-SNAPSHOT-jar-with-dependencies.jar
reboot now