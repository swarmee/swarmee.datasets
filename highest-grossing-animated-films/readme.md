## Load up a sample JSON File of the Highest Grossing Animated Films into Elasticsearch & then Visualise the data in Kibana

Firstly this dataset is small - however the techiques used here can be applied to your own large datasets.
In this example, we will be loading up some stats in relation to animated films pulled from [wikipedia.org](https://en.wikipedia.org/wiki/List_of_highest-grossing_animated_films). 

##### Version
Example has been tested in following versions:
- Elasticsearch 5.5.1
- Kibana 5.5.1

### Installation & Setup

* Follow the [Installation & Setup Guide](https://github.com/elastic/examples/blob/master/Installation%20and%20Setup.md) to install and test the Elastic Stack (*you can skip this step if you already have a working installation of the Elastic Stack*)

* Start Elasticsearch & Kibana
  ```shell
  <path_to_elasticsearch_root_dir>/bin/elasticsearch
  <path_to_kibana_root_dir>/bin/kibana
  ```

* Check that Elasticsearch and Kibana are up and running.
  - Open `localhost:9200` in web browser -- should return status code 200
  - Open `localhost:5601` in web browser -- should display Kibana UI.

### Post in the Config and the Data 

The dataset is very small so is included in the git repo, all that is needed to load the data into elastic is 
* Post in a mapping
  ```shell
  <path_where_you_cloned_the_repo>curl -H 'Content-Type: application/json' -XPUT 'http://localhost:9200/highest-grossing-animated-films?pretty' -d @highest-grossing-animated-films.mapping.json
  ```
* Post in the Data
```shell
  <path_where_you_cloned_the_repo>curl -H 'Content-Type: application/x-ndjson' -XPOST 'http://localhost:9200/highest-grossing-animated-films/film/_bulk?pretty' --data-binary @highest-grossing-animated-films.data.json
  ```

#### Visualize Data in Kibana

* Access Kibana by going to `http://localhost:5601` in a web browser
* Connect Kibana to the `highest-grossing-animated-films` index in Elasticsearch
    * Click the **Settings** tab >> **Indices** tab >> **Create New**. Specify `highest-grossing-animated-films` as the index pattern name, select `released` as the **Time-field name**, and click **Create** to define the index pattern. (Leave the **Use event times to create index names** box unchecked)
* Load sample dashboard into Kibana
    * Click the **Settings** tab >> **Objects** tab >> **Import**, and select `highest-grossing-animated-films.kibana.json`
* Open dashboard
    * Click on **Dashboard** tab and open `highest-grossing-animated-films` dashboard. Voila! You should see the following dashboard. Happy Data Exploration!

![Dashboard Screenshot](https://github.com/swarmee/swarmee.datasets/raw/master/highest-grossing-animated-films/highest-grossing-animated-films.png)
