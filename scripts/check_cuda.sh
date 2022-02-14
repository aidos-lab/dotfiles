#!/bin/bash
#
# Submits debug jobs to most cluster nodes in order to ensure that the
# CUDA installation has been configured correctly.

for node in 09 10 11 12 13 14 15 16; do
  sbatch --mem=100M --cpus-per-task=1 --gres=gpu:1 -p gpu_p --qos=gpu -w gpusrv$node --wrap "hostname; nvidia-smi" 
done

for node in 05 07 08; do
  sbatch --mem=100M --cpus-per-task=1 --gres=gpu:1 -p gpu_p --qos=gpu -w supergpu$node --wrap "hostname; nvidia-smi" 
done

for node in 02 03; do
  sbatch --mem=100M --cpus-per-task=1 --gres=gpu:1 -p gpu_p --qos=gpu -w supergpu${node}pxe --wrap "hostname; nvidia-smi" 
done
