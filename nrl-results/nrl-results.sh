#!/bin/bash


echo '################ delete index ###############'
curl -XDELETE ''"$1"':9200/nrl-results?pretty' 
echo '################ run load ###################'
zcat nrl-results.csv.gz  |  HOST=$1  /usr/share/logstash/bin/logstash -f nrl-results.conf -b 10 -w 2
echo '################ all done  #################'
