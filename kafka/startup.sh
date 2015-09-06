#!/bin/bash
echo "Starting Zookeeper"
zookeeper-server-start.sh -daemon config/zookeeper.properties
echo "Starting Kafka"
kafka-server-start.sh config/server.properties

