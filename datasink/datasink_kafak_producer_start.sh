#!/bin/bash
sudo /opt/kafka/kafka_2.11-2.1.0/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test < /opt/files/qa*.json