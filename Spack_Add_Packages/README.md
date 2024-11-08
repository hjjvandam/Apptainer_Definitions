# Container setup for adding packages to the Spack package manager

This definition file builds a container op top of an Apptainer image with
AlmaLinux-9 that was created as described in [AlmaLinux9_Apptainer](../AlmaLinux9_Apptainer).
In this image we have added the Spack package manager and the Environment Modules 
module manager. We also configure Spack to automatically generate Module files
for packages it installs.

To generate an image for this container run
```bash
limactl shell apptainer-al9 apptainer build --build-arg home=$HOME spack_add_packages.sif ./Apptainer
```
