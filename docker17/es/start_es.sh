docker run -d -p 92:9200 --name=es-clctest  -v  /home/chenlc/docker/es/data:/root/elasticsearch-2.3.3/data  -v /etc/localtime:/etc/localtime:ro  clc/elasticsearch
