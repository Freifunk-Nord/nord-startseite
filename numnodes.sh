#!/bin/bash
# reads all online nodes and creates an HTML page from the template numnodes.template
#JSON=/opt/ffmap-backend-neu/json/nodes.json
JSON=/opt/ffmap-backend-neu/json/alfred.158.json
#wget http://map.freifunk.in-kiel.de/json/nodes.json -qO $JSON

echo -n "online nodes: "
#num="$(cat $JSON |jq '.nodes[] | select(.flags.gateway==false) | select(.flags.online==true)'|grep online|wc -l)"
num="$(cat $JSON |grep hostname|wc -l)"
echo $num
cd `dirname "$0"`
sed 's/<NUM_NODES>/'$num'/g' numnodes.template > build/numnodes.html

#echo -n "offlilne nodes: "
#cat $JSON |jq '.nodes[] | select(.flags.gateway==false) | select(.flags.online==false)'|grep online|wc -l
