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

Note that there is a workflow to adding a package to Spack.
Spack has been installed in `/root/spack` which is a read-only
file system. Therefore we cannot add anything in that location.
We need to copy this installation to our home directory (which has
a different absolute pathname based on the user who is running the
container). Then we need to activate the copy installation. Run:
```bash
cp -a /root/spack $HOME/.
. $HOME/spack/share/spack/setup-env.sh
```
Then to add a new package create a new directory in the `packages`
directory, and then create a `package.py` in that directory.
See for documentation on the `package.py` file can be found in the
[packaging guide](https://spack.readthedocs.io/en/latest/packaging_guide.html).
