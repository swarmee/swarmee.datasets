echo '################ delete index top-tallest-mountains-'"$2"' on '"$1"'###############'
curl -XDELETE ''"$1"':9200/top-tallest-mountains-'"$2"'?pretty'
echo '################ run load ###################'
zcat top-tallest-mountains.csv.gz  | HOST=$1 INDEX=$2 /usr/share/logstash/bin/logstash -f top-tallest-mountains.conf -b 1 -w 1
echo '################ Remove Any Old Aliases for top-tallest-mountains And Creates a New One for top-tallest-mountains-'"$2"' ###############'
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [
        { "remove" : { "index" : "*", "alias" : "top-tallest-mountains" } },
        { "add" : { "index" : "top-tallest-mountains-'"$2"'", "alias" : "top-tallest-mountains" } }

    ]

}
'
echo '################ all done  #################'


