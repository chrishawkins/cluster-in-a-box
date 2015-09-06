#!/bin/bash
cd cassandra && ./build.sh && cd ..
cd kafka && ./build.sh && cd ..
cd spark-base && ./build.sh && cd ..
cd spark-master && ./build.sh && cd ..
