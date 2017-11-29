#!/bin/bash

echo '################ delete index ###############'
curl -XDELETE ''"$1"':9200/olympic-cities?pretty' 
echo '################ run load ###################'
zcat olympic-cities.csv.gz  |  HOST=$1  /usr/share/logstash/bin/logstash -f olympic-cities.conf -b 10 -w 2
echo '################ all done  #################'
