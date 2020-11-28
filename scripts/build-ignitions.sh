#!/bin/bash
cp ignitions/install-config.yaml.ORIG ignitions/install-config.yaml
./openshift-install create manifests --dir=ignitions/
./openshift-install create ignition-configs --dir=ignitions/
