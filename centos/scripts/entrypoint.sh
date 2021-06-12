#!/bin/bash
echo "START"

exec /usr/sbin/init && /usr/sbin/sshd -D

systemctl start docker
systemctl start libvirtd

echo "END"