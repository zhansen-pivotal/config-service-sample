#!/usr/bin/env bash

serverRoot=`cd ../; pwd`
cluster=$serverRoot/cluster

locatorConfig=$serverRoot/data/locator1/cluster_config/cluster
cp $cluster/* $locatorConfig
echo "updating gemfire with changes"
sleep 2

echo "issuing rolling restart"
./rolling-restart.sh
sleep 2
