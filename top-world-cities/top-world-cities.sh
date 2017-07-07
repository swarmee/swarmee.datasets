echo '################ delete index ###############'
curl -XDELETE ''"$1"':9200/top-world-cities?pretty' 
echo '################ run load ###################'
wget --output-document=top-world-cities.csv.gz  "https://www.dropbox.com/s/g0r26aak25m5e7c/top-world-cities.csv.gz?dl=0"
echo '################ run load ###################'
zcat top-world-cities.csv.gz | HOST=$1 /usr/share/logstash/bin/logstash -f  top-world-cities.conf -b 210 -w 6 
echo '################ create alias ###############'
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "top-world-cities-2-4-2017", "alias" : "top-world-cities" } }

    ]

}
'
echo '################ all done  #################'
