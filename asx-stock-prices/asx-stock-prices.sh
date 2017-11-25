#!/bin/bash

# input parameter is required it is the hostname of the elastic cluster you are using 

echo '################ delete existing index ###############'
curl -XDELETE ''"$1"':9200/asx-stock-prices?pretty' 
echo '################ download data data  ###################'
wget --output-document=asx-stock-prices.csv.gz "https://www.dropbox.com/s/c767gltkq20eo6l/asx-stock-prices.csv.gz?dl=0"
echo '################ load data  ###################'
zcat asx-stock-prices.csv.gz  |  HOST=$1  /usr/share/logstash/bin/logstash -f asx-stock-prices.conf -b 100 -w 1
echo '################ all done  #################'
