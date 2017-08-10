################delete index
curl -XDELETE ''"$1"':9200/openaddresses-portugal?pretty' 
################get data
wget --output-document=openaddresses-portugal.csv.gz   "https://www.dropbox.com/s/ss53fjumxgzr0bm/openaddresses-portugal.csv.gz?dl=0"
echo '################ run load ###################'
zcat openaddresses-portugal.csv.gz | HOST=$1 /usr/share/logstash/bin/logstash -f openaddresses-portugal.conf -b 200 -w 3
####tail -n +2| 
################create alias
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "openaddresses-portugal-2-4-2017", "alias" : "openaddresses-portugal" } }

    ]

}
'
