echo '################ delete index ###############'
curl -XDELETE ''"$1"':9200/pokemon?pretty' 
echo '################ run load ###################'
zcat pokemon.csv.gz  |  HOST=$1  /usr/share/logstash/bin/logstash -f pokemon.conf -b 180 -w 2
echo '################ create alias ###############'
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "pokemon-2-4-2017", "alias" : "pokemon" } }

    ]

}
'
echo '################ all done  #################'
