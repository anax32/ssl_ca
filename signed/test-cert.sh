#!/bin/bash

# run this and go to https://localhost
PORT_NUMBER=443

(sudo timeout 30 sudo openssl s_server -key certs/$1.key -cert certs/$1.crt -accept $PORT_NUMBER -www) &

sleep 2

curl --silent https://localhost

RES=$?

case "$RES" in
  0) echo "curl access granted via ssl";;
  7) echo "command not found";;
  35) echo "ssl hand-shake failed";;
  60) echo "ssl ca certificate not found";;
  *) echo "unknown error response: " $RES;;
esac

