#!/bin/bash

echo "Starting HDFS Namenode"
hadoop namenode -format
hadoop-daemon.sh --config $HADOOP_CONF_DIR start namenode
hadoop-daemon.sh --config $HADOOP_CONF_DIR start datanode
yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager
yarn-daemon.sh --config $HADOOP_CONF_DIR start nodemanager
yarn-daemon.sh --config $HADOOP_CONF_DIR start proxyserver
mr-jobhistory-daemon.sh --config $HADOOP_CONF_DIR start historyserver
httpfs.sh --config $HADOOP_CONF_DIR start

echo "Starting Spark Master"
cd /usr/local/spark && sbin/start-master.sh
tail -f logs/*

