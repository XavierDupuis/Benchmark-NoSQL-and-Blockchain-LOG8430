#!/bin/sh
file=/mnt/workloads_$(date +%F-%T-%N).txt
> ${file}
for i in {a..f}
do
    echo WORKLOAD,$i,f >> ${file}
    for j in $(seq 1 $ITERATIONS)
    do
        echo ITERATION,$j,$ITERATIONS >> ${file}
        bin/ycsb.sh load basic -P workloads/workload$i | grep ^"\[" >> ${file}
    done
done