# https://github.com/brianfrankcooper/YCSB/blob/master/README.md
# https://github.com/brianfrankcooper/YCSB/blob/master/cassandra/README.md
# https://github.com/brianfrankcooper/YCSB/wiki/Core-Workloads
# https://github.com/brianfrankcooper/YCSB/wiki/Getting-Started
# https://github.com/brianfrankcooper/YCSB/wiki/Running-a-Workload

FROM cassandra:4
ENV ITERATIONS 5
RUN apt-get update && apt-get install python -y
RUN curl -O --location https://github.com/brianfrankcooper/YCSB/releases/download/0.17.0/ycsb-0.17.0.tar.gz
RUN tar xfvz ycsb-0.17.0.tar.gz
WORKDIR /ycsb-0.17.0
COPY run.sh ./run.sh
CMD [ "bash", "run.sh" ]