
################delete index
curl -XDELETE ''"$1"':9200/openaddresses-australia?pretty' 
################get data
wget --output-document=openaddresses-australia.csv.gz   "https://www.dropbox.com/s/z0g92f1oyb4znza/openaddresses-australia.csv.gz?dl=0"
echo '################ run load ###################'
zcat openaddresses-australia.csv.gz | HOST=$1 /usr/share/logstash/bin/logstash -f openaddresses-australia.conf -b 250 -w 4
####tail -n +2| 
################create alias
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "openaddresses-australia-2-4-2017", "alias" : "openaddresses-australia" } }

    ]

}
'
