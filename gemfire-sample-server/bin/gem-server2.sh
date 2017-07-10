#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "Usage: gemfire-server <locator-host>"
    exit 1
fi

loc=$1[10334]

hn=`hostname`
serverName=server2

root=`cd ../; pwd`
config=$root/config
datadir=$root/data

serverdir=$root/data/$serverName
mkdir -p $serverdir


jvmargs="--J=-XX:+UseParNewGC --J=-XX:+UseConcMarkSweepGC --J=-XX:CMSInitiatingOccupancyFraction=60"

gfsh start server --name=$serverName --dir=$serverdir  --server-port=0 --locators=$loc --initial-heap=1g --max-heap=1g $jvmargs $gfargs --use-cluster-configuration=true