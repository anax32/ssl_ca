#!/bin/bash

function help {
  echo "create-ca <cert-name>"
  echo "  make a root certificate for <cert-name>.conf"
  exit
}

if [ -z "$1" ]; then
  help
fi

CERT_DIR="certs"

if [ ! -d $CERT_DIR ]; then
  mkdir $CERT_DIR
fi

# make the cert
# NB: cert extension must be .crt for update-ca-certificates
# to discover it in /usr/local/share/ca-certificates
openssl req \
  -x509 \
  -new \
  -keyout $CERT_DIR/$1.key \
  -out $CERT_DIR/$1.crt \
  -config $1.conf
