#!/bin/bash
mkdir -p /var/jars
git clone https://github.com/ChrisHawkins/ext-spark-jars.git /var/jars
cd /var/jars && ./add-dependencies.sh /usr/local/spark
