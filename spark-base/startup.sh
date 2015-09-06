#!/bin/bash

export SLAVE_ID=$(shuf -i1-100000 -n1)
export IP_ADDR=$(cat /etc/hosts | grep $(hostname) | cut -f 1)

echo "Starting Slave ID: $SLAVE_ID; IP Address: $IP_ADDR"
hadoop-daemon.sh --config $HADOOP_CONF_DIR start datanode
yarn-daemon.sh --config $HADOOP_CONF_DIR start nodemanager

./configure-spark-jars.sh

echo "SPARK_PUBLIC_DNS=$IP_ADDR" >> conf/spark-env.sh
sbin/start-slave.sh $SLAVE_ID spark://spark-master.spark-jobserver.docker.cluster-in-a-box:7077 -h $IP_ADDR

tail -f logs/*

