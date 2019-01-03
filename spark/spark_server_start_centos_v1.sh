#!/bin/bash
# Start docker machine
sudo systemctl start docker
# Start master Server
sudo /opt/spark/spark-2.4.0-bin-hadoop2.7/sbin/start-master.sh &
# --class = Class with main method
# --master= Where the master is (standalone mode = localhost)
# --executor-memory = Max. Memory used by executor
# --total-executor-cores = Max executor cores
sudo /opt/spark/spark-2.4.0-bin-hadoop2.7/bin/spark-submit \
  --class ch.ffhs.alfano.spark.KafkaWordCount \
  --master spark://localhost_private_ip:7077 \
  --executor-memory 4G \
  --total-executor-cores 4 \
  --conf spark.metrics.conf=/opt/spark/spark-2.4.0-bin-hadoop2.7/conf/metrics.properties \
  /opt/spark/sc001-1.0-SNAPSHOT-jar-with-dependencies.jar \
  1000