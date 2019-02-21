#!/bin/bash
# add ssh keys
wget -P /home/ec2-user/.ssh/ https://s3.amazonaws.com/ffhs-bt-bds/keys/hadoop/id_rsa
wget -P /home/ec2-user/.ssh/ https://s3.amazonaws.com/ffhs-bt-bd/hadoop/id_rsa.pub
chown ec2-user /home/ec2-user/.ssh/id_*
chmod 600 /home/ec2-user/.ssh/id_*
# also for spark and flink
sudo mkdir -p /opt/files/flink
sudo mkdir -p /opt/files/spark
sudo wget -P /opt/files/flink/ https://s3.amazonaws.com/ffhs-bt-bd/flink/id_rsa.pub
sudo wget -P /opt/files/spark/ https://s3.amazonaws.com/ffhs-bt-bd/spark/id_rsa.pub
cat /opt/files/flink/id_rsa.pub >> /home/ec2-user/.ssh/authorized_keys
cat /opt/files/spark/id_rsa.pub >> /home/ec2-user/.ssh/authorized_keys
# finish hadoop setup
cat /home/ec2-user/.ssh/id_rsa.pub >> /home/ec2-user/.ssh/authorized_keys
# Create default directory for flink and spark
/opt/hadoop/hadoop-2.9.2/bin/hdfs namenode -format
#/opt/hadoop/hadoop-2.9.2/sbin/stop-dfs.sh