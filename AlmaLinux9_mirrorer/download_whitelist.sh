#!/bin/bash
dnf reposync --releasever=9.5 --repoid=baseos    --download-path=./mirror --download-metadata --arch=x86_64
dnf reposync --releasever=9.5 --repoid=appstream --download-path=./mirror --download-metadata --arch=x86_64
dnf reposync --releasever=9.5 --repoid=crb       --download-path=./mirror --download-metadata --arch=x86_64
while read -r package || [ -n "$package" ]; do \
    echo "Downloading: $package"; \
    dnf download --releasever=9.5 --setopt=arch=x86_64 --setopt=ignorearch=True \
                 --repo=baseos    --repo=appstream     --repo=crb \
                 --resolve --alldeps --destdir=./mirror $package; \
done < ./whitelist.txt
#
# To install use:
#
#   dnf localinstall /path/to/transferred/packages/*.rpm
