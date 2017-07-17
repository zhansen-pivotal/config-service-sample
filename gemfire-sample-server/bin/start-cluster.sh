#!/usr/bin/env bash

serverRoot=`cd ../; pwd`

lib=$serverRoot/lib

util/clear-data.sh
sleep 2

util/synchronize-project.sh
sleep 5

echo ""
echo "starting a locator for testing..."
util/gem-locator.sh localhost 10334 locator1
sleep 5

echo ""
echo "starting a locator for testing..."
util/gem-locator.sh localhost 10335 locator2
sleep 5

(cd $serverRoot && gfsh -e "connect" -e "import cluster-configuration --zip-file-name=cluster.zip")
sleep 2

echo " "
echo "starting a server for testing..."
util/gem-server.sh localhost
sleep 5

echo " "
echo "starting another server for testing..."
echo " "
util/gem-server2.sh localhost
sleep 10

gfsh -e "connect" \
-e "list regions --member=server2" \
-e "list deployed" \
-e "list functions --member=server2" \
-e "status cluster-config-service" \
-e "status locator --name=locator1" \
-e "status locator --name=locator2" \
-e "status server --name=server1" \
-e "status server --name=server2"

