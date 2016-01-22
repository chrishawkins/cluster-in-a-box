#!/bin/bash

export SLAVE_ID=$(shuf -i1-100000 -n1)
export IP_ADDR=$(hostname -i)
export SPARK_MASTER=$(cat conf/spark-defaults.conf | grep spark.master | tr -s ' ' | cut -d'/' -f3)

echo "Starting Slave ID: $SLAVE_ID; IP Address: $IP_ADDR; Master: $SPARK_MASTER"
hadoop-daemon.sh --config $HADOOP_CONF_DIR start datanode
yarn-daemon.sh --config $HADOOP_CONF_DIR start nodemanager

echo "SPARK_PUBLIC_DNS=$IP_ADDR" >> conf/spark-env.sh
sbin/start-slave.sh $SLAVE_ID $SPARK_MASTER -h $IP_ADDR

tail -f logs/*

