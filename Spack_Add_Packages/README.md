#Container setup for adding packages to the Spack package manager

This definition file builds a container op top of an Apptainer image with
AlmaLinux-9 created as:
```bash
limactl create --name=apptainer-al9 template://apptainer-al9
```
where the `apptainer-al9.yaml` file contains
```yaml
# A template to use Apptainer with AlmaLinux-9

images:
# Try to use release-yyyyMMdd image if available. Note that release-yyyyMMdd will be removed after several months.
- location: "https://repo.almalinux.org/almalinux/9.4/cloud/x86_64/images/AlmaLinux-9-GenericCloud-9.4-20240805.x86_64.qcow2"
  arch: "x86_64"
  digest: "sha256:4f2984589020c0d82b9a410cf9e29715a607c948dfdca652025cdc79ddb5e816"
- location: "https://repo.almalinux.org/almalinux/9.4/cloud/aarch64/images/AlmaLinux-9-GenericCloud-9.4-20240805.aarch64.qcow2"
  arch: "aarch64"
  digest: "sha256:433e7a79b7c49007723851b7721c69a8f0a08be48969c04c1c9252cc16adc893"
# Fallback to the latest release image.
# Hint: run `limactl prune` to invalidate the cache
- location: "https://repo.almalinux.org/almalinux/9/cloud/x86_64/images/AlmaLinux-9-GenericCloud-latest.x86_64.qcow2"
  arch: "x86_64"
- location: "https://repo.almalinux.org/almalinux/9/cloud/aarch64/images/AlmaLinux-9-GenericCloud-latest.aarch64.qcow2"
  arch: "aarch64"

mounts:
- location: "~"
- location: "/tmp/lima"
  writable: true
containerd:
  system: false
  user: false
provision:
- mode: system
  script: |
    #!/bin/bash
    set -eux -o pipefail
    command -v apptainer >/dev/null 2>&1 && exit 0
    # Workaround for https://github.com/apptainer/apptainer/issues/2027
    echo "kernel.apparmor_restrict_unprivileged_userns = 0" >/etc/sysctl.d/99-userns.conf
    sysctl --system
    # add the "Official PPA for Apptainer"
    add-apt-repository -y ppa:apptainer/ppa
    apt-get update
    apt-get install -y apptainer
probes:
- script: |
    #!/bin/bash
    set -eux -o pipefail
    if ! timeout 30s bash -c "until command -v apptainer >/dev/null 2>&1; do sleep 3; done"; then
      echo >&2 "apptainer is not installed yet"
      exit 1
    fi
  hint: See "/var/log/cloud-init-output.log" in the guest
```
The tools we need in the environment to do the work include:
- git
- spack from my fork
- gcc compilers for package testing
