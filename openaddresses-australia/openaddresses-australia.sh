
################delete index
curl -XDELETE ''"$1"':9200/openaddresses-australia?pretty' 
echo '################ get data ###################'
wget --output-document=openaddresses-australia.csv.gz   "https://www.dropbox.com/s/z0g92f1oyb4znza/openaddresses-australia.csv.gz?dl=0"
echo '################ run load ###################'
zcat openaddresses-australia.csv.gz | HOST=$1 /usr/share/logstash/bin/logstash -f openaddresses-australia.conf -b 250 -w 4
echo '################ All Done ###################'
