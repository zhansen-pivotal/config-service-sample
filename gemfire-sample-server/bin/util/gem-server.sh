#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "Usage: gemfire-server <locator-host>"
    exit 1
fi

loc=$1[10334]

hn=`hostname`

serverName=server1

root=`cd ../; pwd`

datadir=$root/data

serverdir=$root/data/$serverName
mkdir -p $serverdir

jvmargs="--J=-XX:+UseParNewGC --J=-XX:+UseConcMarkSweepGC --J=-XX:CMSInitiatingOccupancyFraction=60"
gfargs="--J=-Dgemfire.statistic-archive-file=$hn.gfs --J=-Dgemfire.archive-file-size-limit=100 --J=-Dgemfire.archive-disk-space-limit=1000  --start-rest-api=true --http-service-port=8888 --http-service-bind-address=localhost"

gfsh start server --name=$serverName --dir=$serverdir  --server-port=0 --locators=$loc --initial-heap=1g --max-heap=1g $jvmargs $gfargs --use-cluster-configuration=true