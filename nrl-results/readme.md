# Load Historical NRL results (Australian Rugby League) Into Elasticsearch From CSV (using logstash)

Usage: 
Basically just called the script nrl-results.sh and pass your elastic search hostname. E.g.

./nrl-results.sh localhost

Logstash config file demonsrates a number of ways to select and filter events passing through the pipeline - even includes a simple ruby script. 


  #### Visualize Data in Kibana

  * Access Kibana by going to `http://localhost:5601` in a web browser
  * Connect Kibana to the `nrl-results` index in Elasticsearch
      * Click the **Settings** tab >> **Indices** tab >> **Create New**. Specify `nrl-results` as the index pattern name, select `matchDay` as the **Time-field name**, and click **Create** to define the index pattern. (Leave the **Use event times to create index names** box unchecked)
  * Load sample dashboard into Kibana
      * Click the **Settings** tab >> **Objects** tab >> **Import**, and select <path_where_you_cloned_the_repo>`nrl-results.kibana.json`
  * Open dashboard
      * Click on **Dashboard** tab and open `nrl-results` dashboard. Voila! You should see the following dashboard. Happy Data Exploration!

  ![Dashboard Screenshot](https://github.com/swarmee/swarmee.datasets/raw/master/nrl-results/nrl-results.png)

