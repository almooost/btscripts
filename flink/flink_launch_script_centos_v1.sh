#!/bin/bash
# Update server
yum -y update
# Download and install java, git and docker
yum install -y java-1.8.0-openjdk-headless.x86_64 git
# Create java home variable
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.amzn2.x86_64/
# Create flink directory, download and extract sources
mkdir /opt/flink
wget -P /opt/flink/ https://archive.apache.org/dist/flink/flink-1.7.0/flink-1.7.0-bin-hadoop28-scala_2.11.tgz
tar xvzf /opt/flink/flink*.tgz -C /opt/flink/
# Clone scripts repository and copy necessary files
sudo git clone https://github.com/almooost/btscripts /opt/btscripts
sudo chmod a+x -R /opt/btscripts/
sudo cp /opt/flink/flink-1.7.0/opt/flink-metrics-graphite-1.7.0.jar /opt/flink/flink-1.7.0/lib/
sudo cat /opt/btscripts/flink/flink_conf_metrics.yaml >> /opt/flink/flink-1.7.0/conf/flink-conf.yaml
sudo wget -P /opt/flink/ https://s3.amazonaws.com/ffhs-bt-bd/flink/fc001-2.0-SNAPSHOT-jar-with-dependencies.jar
# Download collectl
sudo mkdir /opt/collectl
sudo wget -P /opt/collectl https://sourceforge.net/projects/collectl/files/collectl/collectl-4.3.1/collectl-4.3.1.src.tar.gz
sudo tar xvzf /opt/collectl/collectl-4.3.1.src.tar.gz -C /opt/collectl/
# Reboot server
reboot now