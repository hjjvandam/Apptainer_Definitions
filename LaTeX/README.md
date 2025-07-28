# Container setup for writing LaTeX documents

This definition file builds a container op top of an Apptainer image with
AlmaLinux-10 that was created as described in [AlmaLinux9_Apptainer](../AlmaLinux9_Apptainer).
In this image we have a added everything you need to write documents in LaTeX.

To generate an image for this container run
```bash
limactl shell apptainer-al10 apptainer build latex.sif ./Apptainer
```

Next we run the image as
```bash
limactl shell apptainer-al10 apptainer exec --bind $HOME latex.sif bash
```
The `--bind` argument binds the current user´s home directory to
a mount point with the same name in the container.
