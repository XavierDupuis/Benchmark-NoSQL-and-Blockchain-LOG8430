#!/bin/sh
file=/mnt/workloads_$(date +%F-%T-%N).txt
> ${file}
for i in {a..f}
do
    echo - - BEGIN WORLOAD $i - - >> ${file}
    for j in $(seq 1 $ITERATIONS)
    do
        echo - ITERATION $j of $ITERATIONS - >> ${file}
        bin/ycsb.sh load basic -P workloads/workload$i | grep ^"\[" >> ${file}
    done
    echo - END WORLOAD $i - >> ${file}
    echo $'\n' >> ${file}
done