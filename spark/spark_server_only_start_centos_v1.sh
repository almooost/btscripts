#!/bin/bash
# Start collectl
sudo /opt/collectl/collectl-4.3.1/collectl -i1 --all --export graphite,54.83.166.192 &
# Start master Server
/opt/spark/spark-2.4.0-bin-hadoop2.7/sbin/start-master.sh &
/opt/spark/spark-2.4.0-bin-hadoop2.7/sbin/start-slaves.sh &