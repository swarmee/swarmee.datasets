echo '################ delete index ###############'
curl -XDELETE ''"$1"':9200/fastest-humans-over-100m?pretty' 
echo '################ run load ###################'
zcat fastest-humans-over-100m.csv.gz  |  HOST=$1  /usr/share/logstash/bin/logstash -f fastest-humans-over-100m.conf -b 1 -w 1
echo '################ create alias ###############'
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "fastest-humans-over-100m-2-4-2017", "alias" : "fastest-humans-over-100m" } }

    ]

}
'
echo '################ all done  #################'
