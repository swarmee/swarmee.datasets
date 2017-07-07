echo '################ delete index ###############'
curl -XDELETE ''"$1"':9200/asx-stock-prices?pretty' 
echo '################ run load 1 ###################'
wget --output-document=asx-stock-prices.csv.gz "https://www.dropbox.com/s/c767gltkq20eo6l/asx-stock-prices.csv.gz?dl=0"
zcat asx-stock-prices.csv.gz  |  HOST=$1  /usr/share/logstash/bin/logstash -f asx-stock-prices.conf -b 100 -w 2
echo '################ create alias ###############'
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "asx-stock-prices-2-4-2017", "alias" : "asx-stock-prices" } }

    ]

}
'
echo '################ all done  #################'
