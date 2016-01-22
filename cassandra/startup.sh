#!/bin/bash

export IP_ADDR=$(hostname -I)
echo "broadcast_rpc_address: $IP_ADDR" >> /etc/cassandra/cassandra.yaml
echo "IP Address is: $IP_ADDR"
cassandra -f
