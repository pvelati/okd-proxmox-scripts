#!/bin/bash

ID=29998
TEMPLATE_STORAGE=nas-archive
TEMPLATE_NAME=debian-10-standard_10.5-1_amd64.tar.gz
BRIDGE=vmbr0
VLAN=20
STORAGE=nvme
PATH=$(pwd)

/usr/bin/pveam download $TEMPLATE_STORAGE $TEMPLATE_NAME

/usr/sbin/pct create $ID $TEMPLATE_STORAGE:vztmpl/$TEMPLATE_NAME --cores 1 --hostname okd-haproxy --net0 name=eth0,bridge=$BRIDGE,ip=dhcp,tag=$VLAN,type=veth --ostype debian --storage $STORAGE
/usr/sbin/pct start $ID

/usr/sbin/pct exec $ID -- bash -c 'apt-get update | apt-get -y install curl gnupg2'
/usr/sbin/pct exec $ID -- bash -c 'curl https://haproxy.debian.net/bernat.debian.org.gpg | apt-key add -'
/usr/sbin/pct exec $ID -- bash -c 'echo deb http://haproxy.debian.net buster-backports-2.3 main | tee /etc/apt/sources.list.d/haproxy.list'
/usr/sbin/pct exec $ID -- bash -c 'apt-get update | apt-get -y install haproxy=2.3.\*'
/usr/sbin/pct push $ID $PATH/extras/haproxy.cfg /etc/haproxy/haproxy.cfg
/usr/sbin/pct exec $ID -- bash -c 'systemctl restart haproxy'
