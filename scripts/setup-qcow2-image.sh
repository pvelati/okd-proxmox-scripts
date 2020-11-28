#!/bin/bash
#Go to https://getfedora.org/en/coreos/download?tab=metal_virtualized&stream=stable, replace version

VERSION=32.20201104.3.0

if [[ -f "fedora-coreos.qcow2" ]]; then
    rm fedora-coreos.qcow2
fi

wget https://builds.coreos.fedoraproject.org/prod/streams/stable/builds/$VERSION/x86_64/fedora-coreos-$VERSION-qemu.x86_64.qcow2.xz
unxz fedora-coreos-$VERSION-qemu.x86_64.qcow2.xz
mv fedora-coreos-$VERSION-qemu.x86_64.qcow2 fedora-coreos.qcow2
