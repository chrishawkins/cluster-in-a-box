FROM chrishawkins/spark-slave 
MAINTAINER Chris Hawkins <chris.hawkins@accenture.com>

# Updates & Install Prerequisites
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget curl npm git

WORKDIR /tmp/

# Maven 3.1 Install
RUN 	wget http://download.nextag.com/apache/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz && tar -xzvf apache-maven-3.3.3-bin.tar.gz -C /usr/local && \
	ln -s /usr/local/apache-maven-3.3.3 /usr/local/apache-maven && ln -s /usr/local/apache-maven/bin/mvn /usr/local/bin/mvn && \
	echo "export M2_HOME=/usr/local/apache-maven" >> /etc/profile.d/apache-maven.sh

RUN mkdir zeppelin
RUN git clone --branch branch-0.5 https://github.com/apache/incubator-zeppelin.git zeppelin
WORKDIR /tmp/zeppelin
RUN mvn clean package -Dspark.version=1.3.0 -Pspark-1.3 -Dhadoop.version=2.6.0 -Phadoop-2.4 -Pyarn -DskipTests

EXPOSE 8080 8081

ADD zeppelin-env.sh conf/zeppelin-env.sh 
ADD zeppelin-site.xml conf/zeppelin-site.xml
ADD startup.sh startup.sh

CMD ./startup.sh 

