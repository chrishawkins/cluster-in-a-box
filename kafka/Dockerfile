FROM ubuntu
MAINTAINER Chris Hawkins <chris.hawkins@accenture.com>

# Updates & Install Prerequisites
RUN 	apt-get update && apt-get upgrade -y && apt-get install -y wget && \
	apt-get install -y software-properties-common python-software-properties && add-apt-repository ppa:webupd8team/java && \
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
	apt-get update && apt-get -y install oracle-java8-set-default

# Get and untar Kafka
RUN	wget http://apache.mirrors.ionfish.org/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz && \
	tar xvf kafka_2.11-0.8.2.1.tgz && \
	mv kafka_2.11-0.8.2.1 /usr/local/kafka && \
	cd /usr/local/kafka && echo "auto.create.topics.enable = true" >> config/server.properties

WORKDIR /usr/local/kafka
ENV KAFKA_HOME=/usr/local/kafka PATH=$PATH:$KAFKA_HOME/bin 
ADD startup.sh startup.sh
CMD ./startup.sh
