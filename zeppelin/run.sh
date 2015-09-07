#!/bin/bash
export DNS_ADDR=$(ip -o -4 addr show docker0 | awk '{print $4}' | cut -d/ -f1)
docker run -d --dns=$DNS_ADDR --name notebooks --hostname notebooks.zeppelin.docker.cluster-in-a-box -p 9123:8080 -p 8081:8081 chrishawkins/zeppelin
