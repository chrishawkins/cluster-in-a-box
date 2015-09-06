FROM ubuntu
MAINTAINER Chris Hawkins <chris.hawkins@accenture.com>

# Updates & Install Prerequisites
RUN	apt-get update && apt-get upgrade -y && apt-get install -y wget git && \
	apt-get install -y software-properties-common python-software-properties && add-apt-repository ppa:webupd8team/java && \
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
	apt-get update && apt-get -y install oracle-java8-set-default

# Get Hadoop 2.6
RUN 	wget "http://mirror.tcpdiag.net/apache/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz" && \
	tar -xzf hadoop-2.6.0.tar.gz -C /usr/local/ && \
	mv /usr/local/hadoop-2.6.0 /usr/local/hadoop && \
	rm hadoop-2.6.0.tar.gz

# Setup Hadoop Environment
ENV 	HADOOP_PREFIX=/usr/local/hadoop HADOOP_COMMON_HOME=/usr/local/hadoop HADOOP_HDFS_HOME=/usr/local/hadoop \
	HADOOP_MAPRED_HOME=/usr/local/hadoop HADOOP_YARN_HOME=/usr/local/hadoop \
	HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop YARN_CONF_DIR=$HADOOP_PREFIX/etc/hadoop \
	JAVA_HOME=/usr/lib/jvm/java-8-oracle/ PATH=$PATH:$JAVA_HOME/bin:/usr/local/hadoop/bin:/usr/local/hadoop/sbin

# Copy Hadoop Configuration
WORKDIR /usr/local/hadoop
COPY	hadoop_conf/* $HADOOP_CONF_DIR/
RUN 	echo "export JAVA_HOME=$JAVA_HOME" >> $HADOOP_CONF_DIR/hadoop-env.sh && \
	echo "export JAVA_HOME=$JAVA_HOME" >> $HADOOP_CONF_DIR/yarn-env.sh

# Get and untar Spark
WORKDIR /tmp
RUN	wget http://d3kbcqa49mib13.cloudfront.net/spark-1.3.0-bin-hadoop2.4.tgz && \
	tar xvf spark-1.3.0-bin-hadoop2.4.tgz && \
	mv spark-1.3.0-bin-hadoop2.4 /usr/local/spark

WORKDIR /usr/local/spark
ADD spark-defaults.conf /usr/local/spark/conf/spark-defaults.conf

# Dependenices Script
ADD configure-spark-jars.sh configure-spark-jars.sh

ADD startup.sh /startup.sh
CMD /startup.sh
