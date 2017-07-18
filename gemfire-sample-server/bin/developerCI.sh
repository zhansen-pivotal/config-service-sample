#!/usr/bin/env bash

serverRoot=`cd ../; pwd`
cluster=$serverRoot/cluster

locatorConfig=$serverRoot/data/locator1/cluster_config

(cd $locatorConfig && gfsh -e "connect" -e "export cluster-configuration --zip-file-name=export.zip")
rm -r $locatorConfig/cluster
(cd $locatorConfig && unzip export.zip)
cp $cluster/* $locatorConfig/cluster
rm $locatorConfig/export.zip

echo "updating gemfire with changes"
sleep 2

echo "issuing rolling restart"
./rolling-restart.sh
sleep 2
