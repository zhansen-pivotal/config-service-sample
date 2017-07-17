#!/usr/bin/env bash
if [ -z "$1" ]; then
    echo "Usage: gemfire-locator <locator-host>"
    exit 1
fi

## Locators to connect to distributed system
loc=localhost[10334],$1[$2]

## Hostname to start locator with.
hn=`hostname`

locatorName=$3

root=`cd ../; pwd`

datadir=$root/data
locatordir=$root/data/$locatorName
mkdir -p $locatordir

## Standard Gemfire and Java args for both jvm tuning and stats
gfargs="--J=-Dgemfire.statistic-archive-file=$hn.gfs --J=-Dgemfire.archive-file-size-limit=100 --J=-Dgemfire.archive-disk-space-limit=1000  --J=-Dgemfire.http-service-port=7070"


gfsh start locator --name=$locatorName --port=$2 --locators=$loc --dir=$locatordir --initial-heap=1g --max-heap=1g $jvmargs $gfargs --enable-cluster-configuration=true --load-cluster-configuration-from-dir=true

