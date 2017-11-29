## Load up a sample JSON File of the World's fastest Runners into Elasticsearch (using curl) & then Visualise the data in Kibana

Firstly this dataset is small - however the techiques used here can be applied to your own large datasets.
In this example, we will be loading up some stats in relation to the fastest humans over 100 meters with data pulled from [wikipedia.org](http://en.wikipedia.org/wiki/100_metres). The data has been enhanced with reverse geo-locations from OpenStreetMap contributors. See http://www.openstreetmap.org/copyright for further details

##### Version
Example has been tested in following versions:
- Elasticsearch 5.5.1 (and now elasticsearch 6)
- Kibana 5.5.1 (and not elasticsearch 6)

### Installation & Setup

* Follow the [Installation & Setup Guide](https://github.com/elastic/examples/blob/master/Installation%20and%20Setup.md) to install and test the Elastic Stack (*you can skip this step if you already have a working installation of the Elastic Stack*)

* Check that Elasticsearch and Kibana are up and running.
  - Open `localhost:9200` in web browser -- should return status code 200
  - Open `localhost:5601` in web browser -- should display Kibana UI.

### Post in the Data 

The dataset is very small so is included in the git repo, all that is needed to load the data into elastic is 
* PUT in a mapping
  ```shell
  <path_where_you_cloned_the_repo>curl -H 'Content-Type: application/json' -XPUT 'http://localhost:9200/fastest-humans-over-100m?pretty' -d @fastest-humans-over-100m.mapping.json
  ```
* Post in the Data
```shell
  <path_where_you_cloned_the_repo>curl -H 'Content-Type: application/x-ndjson' -XPOST 'http://localhost:9200/fastest-humans-over-100m/run/_bulk?pretty' --data-binary @fastest-humans-over-100m.data.json
  ```
You can use curl's -u option to supply a username and password if you have set that up. 

#### Visualize Data in Kibana

* Access Kibana by going to `http://localhost:5601` in a web browser
* Connect Kibana to the `fastest-humans-over-100m` index in Elasticsearch
    * Click the **Settings** tab >> **Indices** tab >> **Create New**. Specify `fastest-humans-over-100m` as the index pattern name, select `date` as the **Time-field name**, and click **Create** to define the index pattern. (Leave the **Use event times to create index names** box unchecked)
* Load sample dashboard into Kibana
    * Click the **Settings** tab >> **Objects** tab >> **Import**, and select <path_where_you_cloned_the_repo>`fastest-humans-over-100m.kibana.json`
* Open dashboard
    * Click on **Dashboard** tab and open `fastest-humans-over-100m` dashboard. Voila! You should see the following dashboard. Happy Data Exploration!

![Dashboard Screenshot](https://github.com/swarmee/swarmee.datasets/raw/master/fastest-humans-over-100m/fastest-humans-over-100m.png)



