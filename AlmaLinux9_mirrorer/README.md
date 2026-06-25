# AlmaLinux 9 mirrorer

For amplitUDE we need to mirror AlmaLinux 9.x x86_64 packages.
As I download these package on a MacBook with an ARM64 processor
I need to "massage" the system a bit, so it will not go looking for
Aarch64 packages. This requires root privileged changes so we have
to roll our own container that is set up for this.

While we are at it we might just as well, store the scripts we
need to do the mirroring and the package `whitelist.txt`
with packages to mirror here also.

To generate an image for this container run
```bash
limactl shell apptainer-al9 apptainer build almalinux9-mirrorer.sif ./Apptainer
```
to run it
```bash
limactl shell apptainer-al9 apptainer exec --bind $HOME almalinux9-mirrorer.sif bash
```
