#!/bin/bash

export DNS_ADDR=$(ip -o -4 addr show docker0 | awk '{print $4}' | cut -d/ -f1)
export NAMESERVER="$(cat /etc/resolv.conf | grep nameserver | cut -d" " -f2)"

if [ -z "$NAMESERVER" ]
	# default to Google nameserver (which is sometimes not accessible on internal networks)
	then export NAMESERVER="8.8.8.8"
fi

# Create DNS Containers
docker run -d --dns=$DNS_ADDR -p $DNS_ADDR:53:53/udp --name skydns crosbymichael/skydns -nameserver "$NAMESERVER:53" -domain cluster-in-a-box
echo "Waiting for DNS server..."
sleep 1
docker run -d --dns=$DNS_ADDR -v /var/run/docker.sock:/docker.sock --name skydock crosbymichael/skydock -ttl 30 -environment docker -s /docker.sock -domain cluster-in-a-box -name skydns
echo "Waiting for Skydock..."
sleep 1 

SPARK_SLAVES=8

# Create Spark Cluster
docker run -d --dns=$DNS_ADDR --name spark-master --hostname spark-master.spark-master.docker.cluster-in-a-box -p 9999:8088  -p 8090:8090 chrishawkins/spark-master

for i in `seq 1 $SPARK_SLAVES`
do
	docker run -d --dns=$DNS_ADDR --name spark-$i --hostname spark-$i.spark-slave.docker.cluster-in-a-box chrishawkins/spark-slave
done

echo "Built Spark cluster..."

# Create Cassandra Cluster
docker run -d --dns=$DNS_ADDR --name db --hostname db.cassandra.docker.cluster-in-a-box chrishawkins/cassandra
echo "Cassandra launched..."

# Create Kafka Cluster
docker run -d --dns=$DNS_ADDR --name broker --hostname broker.kafka.docker.cluster-in-a-box chrishawkins/kafka
echo "Message broker started..."

echo "Ready!"
