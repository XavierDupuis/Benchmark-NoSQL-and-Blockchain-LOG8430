#!/bin/bash
git clone http://github.com/brianfrankcooper/YCSB.git
cd YCSB
mkdir out
touch out/LoadCassandra.csv
touch out/RunCassandra.csv

docker exec -it cassandra1 cqlsh 192.168.5.2 -u cassandra -p cassandra -e "create keyspace ycsb WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor':3}"

docker exec -it cassandra1 cqlsh 192.168.5.2 -u cassandra -p cassandra -e "create table ycsb.usertable (
    y_id varchar primary key,
    field0 varchar,
    field1 varchar,
    field2 varchar,
    field3 varchar,
    field4 varchar,
    field5 varchar,
    field6 varchar,
    field7 varchar,
    field8 varchar,
    field9 varchar);"

for i in {c a f}
do
	echo WORKLOAD,$i,3 >> out/LoadCassandra.txt
	echo WORKLOAD,$i,3 >> out/RunCassandra.txt
	for j in {1..3}
	do
		echo ITERATION,$j,3 >> out/LoadCassandra.txt
		./bin/ycsb load cassandra-cql -s -P workload$i \
		-p "hosts=192.168.5.2,192.168.5.3,192.168.5.4,192.168.5.5" \
		-p "cassandra.password=cassandra" \
		-p "cassandra.username=cassandra" >> out/LoadCassandra.txt

		echo ITERATION,$j,3 >> out/RunCassandra.txt
		./bin/ycsb run cassandra-cql -s -P workload$i \
		-p "hosts=192.168.5.2,192.168.5.3,192.168.5.4,192.168.5.5" \
		-p "cassandra.password=cassandra" \
		-p "cassandra.username=cassandra" >> out/RunCassandra.txt
	done
done