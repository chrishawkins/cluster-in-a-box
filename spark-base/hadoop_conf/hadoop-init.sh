#! /bin/bash

mkdir -p /data/hadoop/hdfs/nn
mkdir -p /data/hadoop/hdfs/snn
mkdir -p /data/hadoop/hdfs/dnn

hdfs namenode -format
