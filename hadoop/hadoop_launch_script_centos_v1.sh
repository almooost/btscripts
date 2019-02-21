#!/bin/bash
# Update server
yum -y update
# Download and install java, git and docker
yum install -y java-1.8.0-openjdk-headless.x86_64 git
# Create java home variable
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-0.amzn2.x86_64/
# Download collectl
sudo mkdir /opt/collectl
sudo wget -P /opt/collectl https://sourceforge.net/projects/collectl/files/collectl/collectl-4.3.1/collectl-4.3.1.src.tar.gz
sudo tar xvzf /opt/collectl/collectl-4.3.1.src.tar.gz -C /opt/collectl/
# Create flink directory, download and extract sources
mkdir /opt/hadoop
wget -P /opt/hadoop/ https://www.apache.org/dyn/closer.cgi/hadoop/common/hadoop-2.9.2/hadoop-2.9.2.tar.gz
tar xvzf /opt/hadoop/hadoop-2.9.2.tar.gz -C /opt/hadoop/
# Replace job manager ip
# Clone scripts repository and copy necessary files
sudo git clone https://github.com/almooost/btscripts /opt/btscripts
sudo chmod a+x -R /opt/btscripts/
# Prepare standalone mode
mkdir /opt/hadoop/hadoop-2.9.2/input
cp /opt/hadoop/hadoop-2.9.2/etc/hadoop/*.xml input
bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.0.3.jar grep input output 'dfs[a-z.]+'
# Create default directory for flink and spark
/opt/hadoop/hadoop-2.9.2/bin/hdfs namenode -format
/opt/hadoop/hadoop-2.9.2/sbin/start-dfs.sh
/opt/hadoop/hadoop-2.9.2/bin/hdfs dfs -mkdir /flink
/opt/hadoop/hadoop-2.9.2/bin/hdfs dfs -mkdir /spark
/opt/hadoop/hadoop-2.9.2/sbin/stop-dfs.sh
# Reboot server
reboot now