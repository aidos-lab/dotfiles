# Scripts and technical documentation for the AIDOS Lab

This repository aims to collect some additional 'technical goodies' for
the AIDOS Lab. In contrast to the Welcome Guide, which primarily
provides a basis for our working culture, this repository is about more
about practical questions: how to set up a good environment on our
compute cluster? How to transfer files?

## Recipes

Here are some recipes that might be helpful.

### Starting an interactive GPU session on the cluster

This can be very helpful for debugging. Essentially, this command will
reserve a GPU for you, then start a login shell. This permits you to run
all kinds of commands and have them executed on the GPU itself:

```
srun -p interactive_gpu_p --qos interactive_gpu --gres=gpu:1 --nice=1000 --pty /bin/bash -i
```

### Transferring files from shares to Linux

File transfer from the NAS to Linux can be achieved by employing the
`smbget` command, which should be part of every installation. For
instance, to get the file `example.txt` that someone put into the
`Transfer` folder, use the following command:

```
smbget --user=$USER --workgroup=scidom.de smb://nas10.scidom.de/Transfer/example.txt
```
