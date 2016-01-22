#!/bin/bash

export IP_ADDR=$(hostname -I)
cd /usr/local/spark && ./configure-spark-jars.sh && echo "SPARK_PUBLIC_DNS=$IP_ADDR" >> conf/spark-env.sh
cd /tmp/zeppelin && bin/zeppelin.sh
