#!/bin/bash
# reads all online nodes and creates an HTML page from the template numnodes.template
#JSON=/opt/ffmap-backend-neu/json/nodes.json
JSON=/var/www/html/meshviewer/data/nodes.json
#JSON=/opt/ffmap-backend-neu/json/alfred.158.json
#wget http://map.freifunk.in-kiel.de/json/nodes.json -qO $JSON

# turn on logging:
logfile=/var/log/numnodes.log

#if this is called minutely from cron.d, wait some seconds for the json to be downloaded competely
sleep 2

#echo -n "online nodes: "
num="$(cat $JSON |jq '.nodes[] | select(.flags.gateway==false) | select(.flags.online==true)'|grep online|wc -l)"
#num="$(cat $JSON |grep hostname|wc -l)"
#num="$(jq .< $JSON |grep hostname|wc -l)"
num=$(expr $num + 3)
#HOSTLIST=$(cat $JSON |jq '.[].hostname'| tr '\n' ' '| sed 's/" "/<br>/g'| sed 's/"//g')
HOSTLIST=$( cat $JSON |jq '.[]'|grep hostname|cut -d' ' -f8| tr '\n' ' '| sed 's/", "/<br>/g'| sed 's/"//g')
#echo $num
cd `dirname "$0"`
sed 's/<NUM_NODES>/'$num'/g' numnodes.template | sed "s/<HOSTLIST>/$HOSTLIST/g" > numnodes.html

echo "$(date) numnodes: $num">>$logfile
echo "$(date) hosts: $HOSTLIST">>$logfile

#echo -n "offlilne nodes: "
#cat $JSON |jq '.nodes[] | select(.flags.gateway==false) | select(.flags.online==false)'|grep online|wc -l
exit 1
