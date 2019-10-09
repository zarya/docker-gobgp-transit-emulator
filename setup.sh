#!/bin/bash
HOST_IP=$(ip a s dev eth0|sed -ne '/127.0.0.1/!{s/^[ \t]*inet[ \t]*\([0-9.]\+\)\/.*$/\1/p}')
sed -e 's/ROUTERID/'"$HOST_IP"'/g' /root/gobgp/gobgpd.conf.template > /root/gobgp/gobgpd.conf.tmp
sed -e 's/ASN/'"$ASN"'/g' /root/gobgp/gobgpd.conf.tmp > /root/gobgp/gobgpd.conf
echo "Running with AS $ASN"
/root/gobgp/gobgpd -f /root/gobgp/gobgpd.conf
