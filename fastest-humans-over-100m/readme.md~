## Using Logstash to Load up a CSV with the World's fastest Runners into Elasticsearch & then Visualise the data in Kibana

Firstly this dataset is small - however the techiques used here can be applied to your own large datasets.
In this example, we will be loading up some stats in relation to the fastest humans over 100 meters with data pulled from [wikipedia.org](http://en.wikipedia.org/wiki/100_metres). 

##### Version
Example has been tested in following versions:
- Logstash 5.5.1  (with the [logstash-filter-rest](https://github.com/lucashenning/logstash-filter-rest) plugin installed )
- Elasticsearch 5.5.1
- Kibana 5.5.1

### Installation & Setup
* Follow the [Installation & Setup Guide](https://github.com/elastic/examples/blob/master/Installation%20and%20Setup.md) to install and test the Elastic Stack (*you can skip this step if you already have a working installation of the Elastic Stack*)

* Install the Required Logstash Plugin then Run Elasticsearch & Kibana
  ```shell
  <path_to_logstash_root_dir>bin/logstash-plugin install logstash-filter-rest
  <path_to_elasticsearch_root_dir>/bin/elasticsearch
  <path_to_kibana_root_dir>/bin/kibana
  ```

* Check that Elasticsearch and Kibana are up and running.
  - Open `localhost:9200` in web browser -- should return status code 200
  - Open `localhost:5601` in web browser -- should display Kibana UI.

### Load Up the Data (run the shell script) 

The dataset is very small so is included in the git repo, all that is needed to load the data into elastic is 
  ```shell
  <path_where_you_cloned_the_repo>sudo ./fastest-humans-over-100m.sh localhost 01-08-2017
  ```

The first parameter is the elasticsearch instance can be ip or hostname

The second parameter is the underlying index name suffix - can be whatever you like. The script creates an alias for the index with this suffix. 

(note: sudo may or may not be required depending on your groups)

The configuation has an in built delay after each record to limit the load on the free and awesome http://nominatim.openstreetmap.org/ (this is where the geo location details come from). So it will take a minute to have all the records loaded. 


#### Visualize Data in Kibana

* Access Kibana by going to `http://localhost:5601` in a web browser
* Connect Kibana to the `fastest-humans-over-100m` alias in Elasticsearch
    * Click the **Settings** tab >> **Indices** tab >> **Create New**. Specify `fastest-humans-over-100m` as the index pattern name, select `date` as the **Time-field name**, and click **Create** to define the index pattern. (Leave the **Use event times to create index names** box unchecked)
* Load sample dashboard into Kibana
    * Click the **Settings** tab >> **Objects** tab >> **Import**, and select `donorschoose_kibana.json`
* Open dashboard
    * Click on **Dashboard** tab and open `Donors Choose` dashboard. Voila! You should see the following dashboard. Happy Data Exploration!

![Dashboard Screenshot](http://www.swarmee.net/images/slide03.png)

