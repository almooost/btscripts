#!/bin/bash
/opt/hadoop/hadoop-2.9.2/sbin/start-dfs.sh
/opt/hadoop/hadoop-2.9.2/bin/hdfs dfs -rm -f /flink
/opt/hadoop/hadoop-2.9.2/bin/hdfs dfs -rm -f /flink
/opt/hadoop/hadoop-2.9.2/bin/hdfs dfs -mkdir /flink
/opt/hadoop/hadoop-2.9.2/bin/hdfs dfs -mkdir /spark