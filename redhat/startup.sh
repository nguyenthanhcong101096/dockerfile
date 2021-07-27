#!/bin/bash

echo 'start'

exec /usr/sbin/sshd -D

exec /usr/sbin/init

echo 'end'