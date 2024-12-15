# Container setup for developing NOFT in NWChem

This definition file builds a container op top of an Apptainer image with
AlmaLinux-9 that was created as described in [AlmaLinux9_Apptainer](../AlmaLinux9_Apptainer).
In this image we have added the Linux packages needed to develop the NOFT
functionality in NWChem. 

To generate an image for this container run
```bash
limactl shell apptainer-al9 apptainer build nwchem-develop.sif ./Apptainer
```
to run it
```bash
limactl shell apptainer-al9 apptainer exec --bind $HOME nwchem-develop.sif bash
```
