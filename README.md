# logstash-examples
Simple Scripts to illustrate Getting Data into the Elastic Stack

There are two types of examples ones that only request curl to post the data into elastic search, and those that use logstash.
The logstash examples include a bash script that initiates the process.

Usage

./top-selling-books.sh {your elasticsearch host}
Data comes from here (as at April 2017) --> https://en.wikipedia.org/wiki/List_of_best-selling_books --> just formatted to be easily loaded.

./top-tallest-towers.sh {your elasticsearch host}
Data comes from here (as at April 2017)  --> https://en.wikipedia.org/wiki/List_of_tallest_towers --> just formatted to be easily loaded. 
Kibana json provides sample dashboard for data.

./top-urban-populations.sh {your elasticsearch host}
Data comes from here (as at April 2017)  --> https://en.wikipedia.org/wiki/List_of_urban_areas_by_population --> just formatted to be easily loaded.
Kibana json provides sample dashboard for data.

./top-world-cities.sh {your elasticsearch host}
Data comes from here (as at April 2017)  --> https://www.maxmind.com/en/free-world-cities-database --> just formatted to be easily loaded. 

./openaddresses-australia.sh {your elasticsearch host}
Data to big to store on github so you need to download from Openaddresses.io (https://s3.amazonaws.com/data.openaddresses.io/openaddr-collected-asia.zip) - these scripts have been tested with the "AU" ountrywide dataset. 


./asx-stock-prices.conf {your elasticsearch host}
Data sourced from http://www.asxhistoricaldata.com/ data on github for just one stock - (NAB). 
