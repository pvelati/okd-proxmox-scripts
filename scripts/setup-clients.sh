#!/bin/bash
#Go to https://github.com/openshift/okd/releases/, replace version

VERSION=4.5.0-0.okd-2020-10-15-235428

wget https://github.com/openshift/okd/releases/download/$VERSION/openshift-client-linux-$VERSION.tar.gz
wget https://github.com/openshift/okd/releases/download/$VERSION/openshift-install-linux-$VERSION.tar.gz

tar xvf openshift-client-linux-$VERSION.tar.gz
tar xvf openshift-install-linux-$VERSION.tar.gz

rm openshift-client-linux-$VERSION.tar.gz
rm openshift-install-linux-$VERSION.tar.gz
