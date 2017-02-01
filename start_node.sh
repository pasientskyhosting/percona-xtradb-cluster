CLUSTER_NAME=${CLUSTER_NAME:-clustertest}
ETCD_HOST=${ETCD_HOST:-10.50.41.11:2379}
NETWORK_NAME=${CLUSTER_NAME}_net

# docker network create -d overlay $NETWORK_NAME

  echo "Starting new node..."
# docker run -d -p 3306 --net=$NETWORK_NAME \
docker run --rm -t --name pxc \
	 -p 3306 \
	 -e MYSQL_ROOT_PASSWORD="str0nkpassword!" \
	 -e DISCOVERY_SERVICE=$ETCD_HOST \
	 -e CLUSTER_NAME=${CLUSTER_NAME} \
	 -e XTRABACKUP_PASSWORD="str0nkbackup!" \
	 percona-xtradb-cluster
#--general-log=1 --general_log_file=/var/lib/mysql/general.log
echo "Started $(docker ps -l -q)"

# --wsrep_cluster_address="gcomm://$QCOMM"
