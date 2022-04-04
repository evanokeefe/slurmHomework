#!/bin/bash

n=$SLURM_ARRAY_TASK_ID

cat out/allMSN.csv |
cut -d, -f1-2 |
awk -v n="$n" -F, '{if ($1 == n) {print $0}}' |
awk -F, '{s+=$2} END {print s/NR}' > out/${n}.txt
