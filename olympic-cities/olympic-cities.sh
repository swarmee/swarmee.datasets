echo '################ delete index ###############'
curl -XDELETE ''"$1"':9200/olympic-cities?pretty' 
echo '################ run load ###################'
zcat olympic-cities.csv.gz  |  HOST=$1  /usr/share/logstash/bin/logstash -f olympic-cities.conf -b 10 -w 2
echo '################ create alias ###############'
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "olympic-cities-2-4-2017", "alias" : "olympic-cities" } }

    ]

}
'
echo '################ all done  #################'
