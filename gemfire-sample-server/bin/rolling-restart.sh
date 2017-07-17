#!/usr/bin/env bash



gfsh -e "connect" \
-e "stop locator --name=locator1"

echo ""
echo "restarting locator"
util/gem-locator.sh localhost 10334 locator1
sleep 5

gfsh -e "connect" \
-e "stop locator --name=locator2"

echo ""
echo "restarting locator"
util/gem-locator.sh localhost 10335 locator2
sleep 5

gfsh -e "connect" \
-e "stop server --name=server1"

echo " "
echo "starting a server for testing..."
util/gem-server.sh localhost
sleep 5


gfsh -e "connect" \
-e "stop server --name=server2"

echo " "
echo "starting another server for testing..."
echo " "
util/gem-server2.sh localhost
sleep 10


gfsh -e "connect" \
-e "list regions --member=server2" \
-e "status cluster-config-service" \
-e "status locator --name=locator1" \
-e "status locator --name=locator2" \
-e "status server --name=server1" \
-e "status server --name=server2"