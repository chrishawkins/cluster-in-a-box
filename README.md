# Cluster-in-a-Box

This Cluster-in-a-Box solution contains a Dockerised big data cluster, running on
Hadoop with Spark and the YARN scheduler. It also adds Cassandra, for structured
data persistence, Kafka, for experiments with streaming data, and Zeppelin, for
interactive data exploration with Spark. This cluster is intended for educational
purposes and has all kinds of thing wrong with it that make it unsuitable for
production use.

## Getting Started

To get started, clone the repository and run the `./start-all.sh` script.

## Finishing Up

To clean up and wipe everything run the `./kill-all.sh` script. **Warning:**
*kill-all* is not an exaggeration. This script unremorsefully `kill`s and `rm`s
all your Docker containers, whether they are part of the cluster-in-a-box or not.

## The Containers

The containers are listed here in the order they are started by the
`./start-all.sh` shell script along with their hostnames. Note that all name
resolution is handled by [Skydock](https://github.com/crosbymichael/skydock)
which is a community contribution I am super happy with.

| Container Name | Hostname                                               | Description                                                                                                   |
| -------------- | ------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------- |
| skydns         | skydns.skydns.docker.cluster-in-a-box                  | SkyDNS handles DNS records for the cluster                                                                    |
| skydock        | skydock.skydock.docker.cluster-in-a-box                | Makes sure containers get registered with SkyDNS for "service discovery" (largely hardcoded in this instance) |
| spark-master   | spark-master.spark-master.docker.cluster-in-a-box      | Standalone Spark Master, YARN ResourceManager, HDFS NameNode -- a sad single point of failure                 |
| spark-*n*      | spark-*n*.spark.docker.cluster-in-a-box                | Spark nodes, HDFS DataNodes, YARN NodeManagers -- these guys do the work and there are 8 of them by default   |
| db             | db.cassandra.docker.cluster-in-a-box                   | A single node Cassandra instance for the purpose of playing with Cassandra tables                             |
| broker         | broker.kafka.docker.cluster-in-a-box                   | A single node Kafka broker for the purpose of playing with Spark Streaming                                    |

## License

*Obviously this all relies on a lot of other open source projects, with various
licenses, but in terms of the Dockerfiles and scripts in here:*

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
