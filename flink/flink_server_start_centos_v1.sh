#!/bin/bash
sudo /opt/collectl/collectl-4.3.1/collectl -i1 --all --export graphite,54.83.166.192 &
sudo /opt/flink/flink-1.7.0/bin/start-cluster.sh &
sudo /opt/flink/flink-1.7.0/bin/flink run /opt/flink/fc001-2.0-SNAPSHOT-jar-with-dependencies.jar