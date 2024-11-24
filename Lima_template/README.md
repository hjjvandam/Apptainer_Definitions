# Lima template

On MacOS we cannot run Apptainer directly. We need a Virtual Machine (VM) to run 
containers in. [Lima](https://lima-vm.io/) is the VM that comes with
[HomeBrew](https://brew.sh) and therefore we'll use that. 

With Lima we can start a VM and run the AlmaLinux-9 OS. In this OS
we can install [Apptainer](https://apptainer.org/) as a containerization tool.
Ultimately the goal is to use Apptainer to generate container images for various
projects.

The `apptainer-al9.yaml` file is the Lima template file to create a container
instance with AlmaLinux-9 and Apptainer installed. The VM needs access to the
templates and to the location where you want to create the container images.
In particular the latter needs to be writable. Hence the latter is mounted as
such.

If we assume that we copy the Lima template to the templates directory
then we can instantiate the VM with
```bash
limactl start --memory=8 template://apptainer-al9
```
otherwise we can instantiate the VM from this directory with
```bash
limactl start --memory=8 ./apptainer-al9.yaml
```
Next you can run something in the VM with
```bash
limactl shell apptainer-al9
```
In this case the VM runs `bash`.
