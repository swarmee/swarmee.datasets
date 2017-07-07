echo '################ delete index ###############'
curl -XDELETE ''"$1"':9200/top-urban-populations?pretty' 
echo '################ run load ###################'
zcat top-urban-populations.csv.gz  |  HOST=$1  /usr/share/logstash/bin/logstash -f top-urban-populations.conf -b 1 -w 1
echo '################ create alias ###############'
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "top-urban-populations-2-4-2017", "alias" : "top-urban-populations" } }

    ]

}
'
echo '################ all done  #################'
