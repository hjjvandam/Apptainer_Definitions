# AlmaLinux9 Apptainer

In this project we assume that we have Apptainer. Next we need to create an image
that includes AlmaLinux9 and Apptainer. This image can then be used as a base image
for other projects. 

The file `Apptainer` contains an Apptainer definition file that builds the container
the image of which we will store. To build the image run
```bash
 limactl shell apptainer-al9 apptainer build almalinux9_apptainer.sif ./Apptainer
``` 
Breaking this command down we can describe what this does as:
- `<B>limactl shell apptainer-al9</B> apptainer build almalinux9_apptainer.sif ./Apptainer`
  starts the Lima VM instance `apptainer-al9`
  (see ../Lima_template for details on how this instance was created) and 
  runs a shell (`/bin/bash`).
- `limactl *shell* apptainer-al9 *apptainer build* almalinux9_apptainer.sif ./Apptainer`
  the shell runs `apptainer build` to build an image
- `limactl shell apptainer-al9 apptainer *build almalinux9_apptainer.sif ./Apptainer*`
  build will generate the `almalinux9_apptainer.sif` image file using the `./Apptainer`
  apptainer definition file.
All that the definition file does is to take the AlmaLinux-9 OS and install Apptainer in
it. Then the build command will save the image.
