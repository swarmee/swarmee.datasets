echo '################ delete index ###############'
curl -XDELETE ''"$1"':9200/nrl-results?pretty' 
echo '################ run load ###################'
zcat nrl-results.csv.gz  |  HOST=$1  /usr/share/logstash/bin/logstash -f nrl-results.conf -b 10 -w 2
echo '################ create alias ###############'
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "nrl-results-2-4-2017", "alias" : "nrl-results" } }

    ]

}
'
echo '################ all done  #################'
