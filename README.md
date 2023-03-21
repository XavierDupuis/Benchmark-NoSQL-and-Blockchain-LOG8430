LOG8430 Benchmark NoSQL and Blockchain
====================================

# Cassandra + Yahoo! Cloud Serving Benchmark (NoSQL Database Benchmark)
## Build
```shell
docker build -t cassandra-with-ycsb ./cassandra/
```

## Run 
### LINUX / MACOS / WINDOWS POWERSHELL

```shell
docker run -it -e ITERATIONS=5 -v ${PWD}/out:/mnt cassandra-with-ycsb
```

### WINDOWS CMD
```cmd
docker run -it -e ITERATIONS=5 -v %cd%/out:/mnt cassandra-with-ycsb
```


# Hyperledger Fabric + Calliper (Blockchain Database Benchmark)
## Build
## Run
