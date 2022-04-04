#!/bin/bash

rm -rf out; mkdir out
rm -rf slurm_out; mkdir slurm_out

jobId1=$(sbatch --array=0-21 \
		--output="slurm_out/slurm-%A_%a.out" \
                --error="slurm_out/slurm-%A_%a.err" \
                getData.sh)

jobId1=$(echo $jobId1 | sed 's/Submitted batch job //')

