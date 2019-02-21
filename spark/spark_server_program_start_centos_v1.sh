#!/bin/bash
# --class = Class with main method
# --master= Where the master is (standalone mode = localhost)
# --executor-memory = Max. Memory used by executor
# --total-executor-cores = Max executor cores
# --packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.0 for kafka data source
/opt/spark/spark-2.4.0-bin-hadoop2.7/bin/spark-submit \
  --class ch.ffhs.alfano.spark.SparkExp001 \
  --master spark://localhost_private_ip:7077 \
  --driver-memory 4G \
  --driver-cores 4 \
  --executor-memory 4G \
  --executor-cores 4 \
  --total-executor-cores 16 \
  --num-executors 4 \
  --conf spark.default.parallelism=4 \
  --conf spark.streaming.backpressure.enabled=false \
  --conf spark.metrics.conf=/opt/spark/spark-2.4.0-bin-hadoop2.7/conf/metrics.properties \
  --packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.0 \
  /opt/files/spark-exp001-1.0-SNAPSHOT-jar-with-dependencies.jar \
  1000