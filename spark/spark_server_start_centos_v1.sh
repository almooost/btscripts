#!/bin/bash
# Start collectl
sudo /opt/collectl/collectl-4.3.1/collectl -i1 --all --export graphite,54.83.166.192 &
# Start master Server
sudo /opt/spark/spark-2.4.0-bin-hadoop2.7/sbin/start-master.sh &
sudo /opt/spark/spark-2.4.0-bin-hadoop2.7/sbin/start-slave.sh spark://localhost_private_ip:7077 &
# --class = Class with main method
# --master= Where the master is (standalone mode = localhost)
# --executor-memory = Max. Memory used by executor
# --total-executor-cores = Max executor cores
# --packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.0 for kafka data source
sudo /opt/spark/spark-2.4.0-bin-hadoop2.7/bin/spark-submit \
  --class ch.ffhs.alfano.spark.KafkaWordCount \
  --master spark://localhost_private_ip:7077 \
  --executor-memory 4G \
  --total-executor-cores 4 \
  --conf spark.metrics.conf=/opt/spark/spark-2.4.0-bin-hadoop2.7/conf/metrics.properties \
  --packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.0 \
  /opt/spark/sc001-1.0-SNAPSHOT-jar-with-dependencies.jar \
  1000