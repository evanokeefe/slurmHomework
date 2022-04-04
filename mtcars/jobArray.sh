#!/bin/bash

cat out/mtcars${SLURM_ARRAY_TASK_ID}.csv |
tail -n +2 |
cut -d, -f7,11 |
awk -F, '{if ($2 == "3") {print $1}}' |
sort -n |
head -1 > out/out${SLURM_ARRAY_TASK_ID}.csv
