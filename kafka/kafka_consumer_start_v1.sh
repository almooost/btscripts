#!/bin/bash
sudo /opt/kafka/kafka_2.11-2.1.0/bin/zookeeper-server-start.sh /opt/kafka/kafka_2.11-2.1.0/config/zookeeper.properties &
sudo /opt/kafka/kafka_2.11-2.1.0/bin/kafka-server-start.sh /opt/kafka/kafka_2.11-2.1.0/config/server.properties &
sudo /opt/kafka/kafka_2.11-2.1.0/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1  --topic test &
#sudo /opt/kafka/kafka_2.11-2.1.0/bin/kafka-configs.sh --alter --zookeeper localhost:2181 --entity-name test --entity-type topics --add-config cleanup.policy=compact retention.ms=86400 &
#sudo /opt/kafka/kafka_2.11-2.1.0/bin/kafka-reassign-partitions.sh
sudo /opt/kafka/kafka_2.11-2.1.0/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning &