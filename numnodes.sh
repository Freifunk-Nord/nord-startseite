#!/bin/bash
# reads all online nodes and creates an HTML page from the template numnodes.template

JSON=/var/www/freifunk/nodes.json
# wget...

echo -n "online nodes: "
num="$(cat $JSON |jq '.nodes[] | select(.flags.gateway==false) | select(.flags.online==true)'|grep online|wc -l)"
echo $num
sed 's/<NUM_NODES>/'$num'/g' numnodes.template > _site/numnodes.html

#echo -n "offlilne nodes: "
#cat $JSON |jq '.nodes[] | select(.flags.gateway==false) | select(.flags.online==false)'|grep online|wc -l
