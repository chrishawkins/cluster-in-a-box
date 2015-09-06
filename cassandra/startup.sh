#!/bin/bash

export IP_ADDR=$(cat /etc/hosts | grep $(hostname) | cut -f 1)

echo "broadcast_rpc_address: $IP_ADDR" >> /etc/cassandra/cassandra.yaml
service cassandra start
sleep 10
tail -f /var/log/cassandra/*

