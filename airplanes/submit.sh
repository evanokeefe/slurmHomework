#!/bin/bash

rm -rf out; mkdir out
rm -rf slurm_out; mkdir slurm_out

jobId1=$(sbatch --array=0-21 \
		--output="slurm_out/slurm-%A_%a.out" \
                --error="slurm_out/slurm-%A_%a.err" \
                getData.sh)

jobId1=$(echo $jobId1 | sed 's/Submitted batch job //')

jobId2=$(sbatch --output="slurm_out/slurm-%A_%a.out" \
                --error="slurm_out/slurm-%A_%a.err" \
                --dependency=afterok:$jobId1 \
                combineYears.sh)

jobId2=$(echo $jobId2 | sed 's/Submitted batch job //')

jobId3=$(sbatch --output="slurm_out/slurm-%A_%a.out" \
                --error="slurm_out/slurm-%A_%a.err" \
                --dependency=afterok:$jobId2 \
                findFarthest.sh)

jobId3=$(echo $jobId3 | sed 's/Submitted batch job //')

jobId4=$(sbatch --array=1-7 \
                --output="slurm_out/slurm-%A_%a.out" \
                --error="slurm_out/slurm-%A_%a.err" \
                --dependency=afterok:$jobId2 \
		findDelays.sh)

jobId4=$(echo $jobId4 | sed 's/Submitted batch job //')

jobId5=$(sbatch --output="slurm_out/slurm-%A_%a.out" \
                --error="slurm_out/slurm-%A_%a.err" \
                --dependency=afterok:$jobId4 \
                createDelays.sh)

jobId5=$(echo $jobId5 | sed 's/Submitted batch job //')
