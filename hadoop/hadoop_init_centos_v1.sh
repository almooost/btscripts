#!/bin/bash
# add ssh keys
wget -P /home/ec2-user/.ssh/ https://s3.amazonaws.com/ffhs-bt-bds/keys/hadoop/id_rsa
wget -P /home/ec2-user/.ssh/ https://s3.amazonaws.com/ffhs-bt-bds/keys/hadoop/id_rsa.pub
chown ec2-user /home/ec2-user/.ssh/id_*
chmod 600 /home/ec2-user/.ssh/id_*
# also for spark and flink
sudo mkdir -p /opt/files/flink
sudo mkdir -p /opt/files/spark
wget -P /opt/files/flink/ https://s3.amazonaws.com/ffhs-bt-bds/keys/flink/id_rsa.pub
wget -P /opt/files/spark/ https://s3.amazonaws.com/ffhs-bt-bds/keys/spark/id_rsa.pub
cat /opt/files/flink/id_rsa.pub >> /home/ec2-user/.ssh/authorized_keys
cat /opt/files/spark/id_rsa.pub >> /home/ec2-user/.ssh/authorized_keys