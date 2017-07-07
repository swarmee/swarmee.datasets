changes to service to get it to work on VM
# Specifies the maximum number of bytes of memory that may be locked into RAM
# Set to "infinity" if you use the 'bootstrap.memory_lock: true' option
# in elasticsearch.yml and 'MAX_LOCKED_MEMORY=unlimited' in /etc/default/elasticsearch
#LimitMEMLOCK=infinity
LimitNPROC=2048

