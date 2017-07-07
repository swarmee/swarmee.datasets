
################delete index
curl -XDELETE ''"$1"':9200/top-sellings-books?pretty' 
################ run load
zcat top-sellings-books.csv.gz | tail -n +2| HOST=$1 /usr/share/logstash/bin/logstash -f top-sellings-books.conf -b 1 -w 1
################create alias
curl -XPOST ''"$1"':9200/_aliases?pretty' -H 'Content-Type: application/json' -d'
{

    "actions" : [

        { "add" : { "index" : "top-sellings-books-2-4-2017", "alias" : "top-sellings-books" } }

    ]

}
'
