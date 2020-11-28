#!/bin/bash

IP_BOOTSTRAP=192.168.0.89
IP_MASTER0=192.168.0.90
IP_MASTER1=192.168.0.91
IP_MASTER2=192.168.0.92

cp extras/haproxy.cfg.ORIG extras/haproxy.cfg

sed -Ezi "s/IP_BOOTSTRAP/$IP_BOOTSTRAP/g" extras/haproxy.cfg
sed -Ezi "s/IP_MASTER0/$IP_MASTER0/g" extras/haproxy.cfg
sed -Ezi "s/IP_MASTER1/$IP_MASTER1/g" extras/haproxy.cfg
sed -Ezi "s/IP_MASTER2/$IP_MASTER2/g" extras/haproxy.cfg

./scripts/create-haproxy.sh