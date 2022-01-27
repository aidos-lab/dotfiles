#!/bin/bash
#
# Debug script for checking existence of home directory and
# overall configuration of user. There should not be a need
# to run this script unless `slurm` starts misbehaving.

echo `hostname`

ls $HOME
getent passwd $USER
