#!/bin/bash
# Update machine and install java, git and docker
sudo yum -y update
sudo yum install -y java-1.8.0-openjdk-headless.x86_64 git
sudo amazon-linux-extras install docker
# Create JAVA Home direcotry
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.amzn2.x86_64/
# Create spark directory and download spark
sudo mkdir /opt/spark
sudo wget -P /opt/spark/ http://www.pirbot.com/mirrors/apache/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz
sudo tar xvzf /opt/spark/spark*.tgz -C /opt/spark/
# Clone scripts repository and download jar file
sudo git clone https://github.com/almooost/btscripts /opt/btscripts
sudo chmod a+x -R /opt/btscripts/
sudo cp /opt/btscripts/spark/metrics.properties /opt/spark/spark-2.4.0-bin-hadoop2.7/conf/
sudo wget -P /opt/spark/ https://s3.amazonaws.com/ffhs-bt-bd/spark/sc001-1.0-SNAPSHOT-jar-with-dependencies.jar
# Start Docker and download graphite app
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