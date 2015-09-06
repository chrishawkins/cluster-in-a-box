FROM ubuntu
MAINTAINER Chris Hawkins <chris.hawkins@accenture.com>

# Updates & Install Prerequisites
RUN 	apt-get update && apt-get upgrade -y && apt-get install -y wget curl && \
	apt-get install -y software-properties-common python-software-properties && add-apt-repository ppa:webupd8team/java && \
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
	apt-get update && apt-get -y install oracle-java8-set-default

# Cassandra Repository and Keys
RUN	echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list && \
	curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -

EXPOSE 9160 9042

# Install Cassandra
RUN apt-get update && apt-get install -y dsc22 cassandra

# Copy Configuration
ADD cassandra.yaml /etc/cassandra/cassandra.yaml
ADD startup.sh startup.sh

CMD ./startup.sh 

