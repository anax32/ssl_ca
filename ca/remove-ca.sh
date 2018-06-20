#!/bin/bash

function help {
  echo "remove-ca <cert-name>"
  echo "  remove a root certificate for <cert-name>"
  exit
}

if [ -z "$1" ]; then
  help
fi

# copy the certificate to the local repo
rm /usr/local/share/ca-certificates/$1.crt

# update the cert with the os
update-ca-certificates --fresh
