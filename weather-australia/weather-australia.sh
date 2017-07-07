echo '################ delete index ###############'
curl -XDELETE ''"$1"':9200/weather-australia?pretty' 
echo '################ run load  ###################'
zcat *_1800_Data.csv.gz  |  HOST=$1  /usr/share/logstash/bin/logstash -f weather-australia.conf -b 200 -w 4
##--path.data .
echo '################ create alias ###############'
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "weather-australia-2-4-2017", "alias" : "weather-australia" } }

    ]

}
'
echo '################ all done  #################'
