LOG8430 Benchmark NoSQL and Blockchain
====================================

# Cassandra + Yahoo! Cloud Serving Benchmark (NoSQL Database Benchmark)
## Build
```shell
docker build -t cassandra-with-yscb .
```

## Run 
### LINUX / MACOS / WINDOWS POWERSHELL

```shell
docker run -it -e ITERATIONS=5 -v ${PWD}/out:/mnt cassandra-with-yscb
```

### WINDOWS CMD
```cmd
docker run -it -e ITERATIONS=5 -v %cd%/out:/mnt cassandra-with-yscb
```


# Hyperledger Fabric + Calliper (Blockchain Database Benchmark)
## Build
## Run