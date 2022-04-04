#!/bin/bash

module load R/R-3.6.1

Rscript -e "write.csv(x=mtcars[ 1:10, ], file='out/mtcars1.csv'); \
write.csv(x=mtcars[11:20, ], file='out/mtcars2.csv'); \
write.csv(x=mtcars[21:32, ], file='out/mtcars3.csv');"
