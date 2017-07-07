echo '################ delete index ###############'
curl -XDELETE ''"$1"':9200/highest-grossing-animated-films?pretty' 
echo '################ run load ###################'
zcat highest-grossing-animated-films.csv.gz  |  HOST=$1  /usr/share/logstash/bin/logstash -f highest-grossing-animated-films.conf -b 50 -w 2
echo '################ create alias ###############'
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "highest-grossing-animated-films-2-4-2017", "alias" : "highest-grossing-animated-films" } }

    ]

}
'
echo '################ all done  #################'
