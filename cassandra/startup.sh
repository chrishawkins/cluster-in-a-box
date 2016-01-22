#!/bin/bash

export IP_ADDR=$(hostname -i)
echo "broadcast_rpc_address: $IP_ADDR" >> /etc/cassandra/cassandra.yaml

service cassandra start
sleep 10
tail -f /var/log/cassandra/*

