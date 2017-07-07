
################delete index
curl -XDELETE ''"$1"':9200/world-countries?pretty' 
################ run load
zcat world-countries.csv.gz | HOST=$1 /usr/share/logstash/bin/logstash -f world-countries.conf -b 1 -w 1 
################create alias
#curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
#{
#
#    "actions" : [
#
#        { "add" : { "index" : "world-countries", "alias" : "world-countries" } }
#
#    ]
#
#}
#'
