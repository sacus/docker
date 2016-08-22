FROM  e8e2526429c0  
EXPOSE 9200

ENTRYPOINT /root/elasticsearch-2.3.3/bin/elasticsearch -d --cluster.name  xingou --network.host `ifconfig |awk -F  '[ :]+' '{if (NR == 2) print $4}'`  --discovery.zen.ping.unicast.hosts  "`ifconfig |awk -F  '[ :]+' '{if (NR == 2) print $4}'`"  && /root/elasticsearch-2.3.3/bin/elasticsearch --cluster.name  xingou --network.host  `ifconfig |awk -F  '[ :]+' '{if (NR == 2) print $4}'`  --discovery.zen.ping.unicast.hosts  "`ifconfig |awk -F  '[ :]+' '{if (NR == 2) print $4}'`" 
