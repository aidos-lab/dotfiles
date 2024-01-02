#!/bin/bash
#
# es-jupyter-nb.sh: easy submit jupyter-notebook --- submit a jupyter-notebook job to the cluster
#
# This script tries to provide a 'fire and forget' solution for
# starting a jupyter-notebook session in the cluster. The parameters may not be
# perfect, but it's probably sufficient for most cases. You can choose between
# submitting a GPU or CPU job by specifying the mode as the first argument.

# Check for minimum command arguments
if [ -z "$1" ]; then
  echo "Usage: $0 [gpu|cpu] [NAME]"
  echo "  Specify at least the mode (gpu|cpu) to run on the cluster."
  exit -1
fi

# Define the mode (CPU or GPU)
MODE=$1

# Define the command to run Jupyter notebook
CMD="jupyter-notebook --port 8888 --no-browser --ip=0.0.0.0"

# Define the job name from second argument
NAME=$2

# Set default job name if not specified
if [ -z "$NAME" ]; then
  NAME="easy-submit"
fi

if [ "$MODE" == "gpu" ]; then
  srun -p interactive_gpu_p   \
       -J ${NAME}             \
       --gres=gpu:1           \
       --qos=interactive_gpu  \
       --cpus-per-task=4      \
       --mem=8G               \
       --nice=10000           \
       --pty bash -c "${CMD}"
elif [ "$MODE" == "cpu" ]; then
  srun -p cpu_p               \
       -J ${NAME}             \
       --qos=cpu_normal       \
       --cpus-per-task=8      \
       --mem=8G               \
       --nice=1               \
       --pty bash -c "${CMD}"
else
  echo "Invalid mode specified. Please use 'gpu' or 'cpu'."
  exit -1
fi
