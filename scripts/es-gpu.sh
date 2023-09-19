#!/bin/bash
#
# es-gpu.sh: easy submit --- submit a job quickly to the cluster
#
# This script tries to provide a 'fire and forget' solution for
# submitting GPU jobs to the cluster. The parameters may not be
# perfect, but it's probably sufficient for most cases.

NAME="$1"
CMD="$2"

if [ -z "$2" ]; then
  NAME="easy-submit"
  CMD=$1
fi

if [ -z "$CMD" ]; then
  echo "Usage: $0 [NAME] COMMAND"
  echo "  Specify at least the command to run."
  exit -1
fi

sbatch -p gpu_p               \
       -J ${NAME}             \
       -o "${NAME}_%j.out"    \
       --gres=gpu:1           \
       --qos=gpu_normal       \
       --cpus-per-task=4      \
       --mem=8G               \
       --nice=10000           \
       --wrap "${CMD}"
