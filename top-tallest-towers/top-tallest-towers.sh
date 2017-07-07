
echo '################ delete index ###############'
curl -XDELETE ''"$1"':9200/top-tallest-towers?pretty' 
echo '################ run load ###################'
zcat top-tallest-towers.csv.gz  | HOST=$1 /usr/share/logstash/bin/logstash -f top-tallest-towers.conf -b 1 -w 1
echo '################ create alias ###############'
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "top-tallest-towers-2-4-2017", "alias" : "top-tallest-towers" } }

    ]

}
'
echo '################ all done  #################'
