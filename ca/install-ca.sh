#!/bin/bash

function help {
  echo "install-ca <cert-name>"
  echo "  install a root certificate for <cert-name>.crt"
  exit
}

if [ -z "$1" ]; then
  help
fi

CERT_DIR="certs"

if [ ! -d $CERT_DIR ]; then
  echo "ERR: \"$CERT_DIR\" not found"
  exit
fi

if [ ! -f $CERT_DIR/$1.crt ]; then
  echo "ERR: \"$CERT_DIR/$1.crt\" file not found"
  exit
fi

# copy the certificate to the local repo
cp $CERT_DIR/$1.crt /usr/local/share/ca-certificates/

# update the cert with the os
update-ca-certificates
