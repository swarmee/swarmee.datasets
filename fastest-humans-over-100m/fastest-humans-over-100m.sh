echo '################ delete index '"$2"' on '"$1"'###############'
curl -XDELETE ''"$1"':9200/fastest-humans-over-100m-'"$2"'?pretty'
echo '################ run load ###################'
zcat fastest-humans-over-100m.csv.gz  |  HOST=$1 INDEX=$2 /usr/share/logstash/bin/logstash -f fastest-humans-over-100m.conf -b 1 -w 1
echo '################ Remove Any Old Aliases for fastest-humanes-over-100ms And Creates a New One for '"$2"' ###############'
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [
        { "remove" : { "index" : "*", "alias" : "fastest-humans-over-100m" } },
        { "add" : { "index" : "fastest-humans-over-100m-'"$2"'", "alias" : "fastest-humans-over-100m" } }

    ]

}
'
echo '################ all done  #################'


