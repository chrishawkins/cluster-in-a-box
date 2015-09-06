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

To clean up and wipe everything run the `./kill-all.sh` script.

## The Containers

The containers are listed here in the order they are started by the
`./start-all.sh` shell script along with their hostnames. Note that all name
resolution is handled by [Skydock](https://github.com/crosbymichael/skydock)
which is a community contribution I am super happy with.



## License

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
