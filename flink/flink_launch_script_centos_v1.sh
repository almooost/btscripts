#!/bin/bash
# Update server
yum -y update
# Download and install java, git and docker
yum install -y java-1.8.0-openjdk-headless.x86_64 git
sudo amazon-linux-extras install docker
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
sudo cat /opt/btscripts/flink/flink_conf_metrics.yml >> /opt/flink/flink-1.7.0/conf/flink-conf.yaml
sudo wget -P /opt/flink/ https://s3.amazonaws.com/ffhs-bt-bd/flink/fc001-2.0-SNAPSHOT-jar-with-dependencies.jar
# Start docker and download graphite docker container
sudo systemctl start docker
sudo docker run -d \
 --name graphite \
 --restart=always \
 -p 80:80 \
 -p 2003-2004:2003-2004 \
 -p 2023-2024:2023-2024 \
 -p 8125:8125/udp \
 -p 8126:8126 \
 graphiteapp/graphite-statsd
# Copy Configuration to local for easy editing
sudo mkdir /home/ec2-user/graphite
sudo docker cp graphite:/opt/graphite/conf /home/ec2-user/graphite
sudo docker cp graphite:/opt/graphite/webapp/graphite /home/ec2-user/graphite/webapp
# Stop graphite image again
sudo docker stop graphite
# Reboot server
reboot now