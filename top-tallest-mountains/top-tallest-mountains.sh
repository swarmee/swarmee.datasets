
echo '################ delete index ###############'
curl -XDELETE ''"$1"':9200/top-tallest-mountains?pretty' 
echo '################ run load ###################'
zcat top-tallest-mountains.csv.gz  | HOST=$1 /usr/share/logstash/bin/logstash -f top-tallest-mountains.conf -b 1 -w 1
echo '################ create alias ###############'
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "top-tallest-mountains-2-4-2017", "alias" : "top-tallest-mountains" } }

    ]

}
'
echo '################ all done  #################'
