#!/usr/bin/env bash

projectRoot=`cd ../../; pwd`
serverRoot=`cd ../; pwd`

lib=$serverRoot/lib
mkdir -p $lib


cluster=$serverRoot/cluster
mkdir -p $cluster

#configService=$serverRoot/data/locator/cluster_config/cluster
#mkdir -p $configService
#cp $serverRoot/config/* $configService

(cd $projectRoot && mvn clean install -DskipTests)
echo " "
echo "build project : complete"

cp $projectRoot/gemfire-config-service/target/*.jar $lib
cp $serverRoot/config/* $cluster
cp $lib/* $cluster
(cd $serverRoot && zip -r cluster.zip cluster)
echo " "
echo "cluster zip : complete"

echo " "
echo "synch project : complete"