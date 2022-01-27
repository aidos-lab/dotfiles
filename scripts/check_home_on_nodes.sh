#!/bin/bash
#
# Submits debug jobs to most cluster nodes in order to ensure that the
# home has been configured correctly.

for node in 01 02 04 05 06 07; do
  echo icb-gpusrv$node 
  sbatch --mem=100M --cpus-per-task=1 -p interactive_gpu_p --qos=interactive_gpu -w icb-gpusrv$node --wrap "bash check_home.sh" 
done

for node in 01 02 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 35 36 37 38; do
  echo cpusrv$node 
  sbatch --mem=100M --cpus-per-task=1 -p cpu_p -w cpusrv$node --wrap "bash check_home.sh" 
done
