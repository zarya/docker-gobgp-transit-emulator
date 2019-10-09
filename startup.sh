#!/bin/bash
## Production
#/root/gobgp/gobgp monitor global rib -j | /var/tmp/gobgp_to_mongo.py
HOST_IP=$(ip a s dev eth0|sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}')
echo "Container IP $HOST_IP"
echo "Sleeping 30s"
sleep 30
echo "Going to inject the routes"
/root/gobgp/gobgp mrt inject global /tmp/routes.dump 500000
while true
do
	sleep 2	
done
##
## Dev Test
# cat /var/tmp/log/bgp.dump.json | /var/tmp/gobgp_to_mongo.py
