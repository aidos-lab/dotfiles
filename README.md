# Scripts and technical documentation for the AIDOS Lab

This repository aims to collect some additional 'technical goodies' for
the AIDOS Lab. In contrast to the Welcome Guide, which primarily
provides a basis for our working culture, this repository is about more
about practical questions: how to set up a good environment on our
compute cluster? How to transfer files?

## Recipes

Here are some recipes that might be helpful.

### Transferring files from shares to Linux

File transfer from the NAS to Linux can be achieved by employing the
`smbget` command, which should be part of every installation. For
instance, to get the file `example.txt` that someone put into the
`Transfer` folder, use the following command:

    ```console
    smbget --user=$USER --workgroup=scidom.de smb://nas10.scidom.de/Transfer/example.txt
    ```
