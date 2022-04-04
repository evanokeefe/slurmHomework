#!/bin/bash

cat out/allMSN.csv |
cut -d, -f3-5 |
sort -t, -nk3 |
tail -1 > farthest.txt
