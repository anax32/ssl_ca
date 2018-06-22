#!/bin/bash

function help {
  echo "create-ca <cert-name>"
  echo "  make a root certificate for <cert-name>.conf"
  echo "  requires the env variable CA_CERT_DIR for output"
  exit
}

if [ -z "$1" ]; then
  help
fi

CONF_DIR="conf"

if [ ! -d $CA_CERT_DIR ]; then
  mkdir -p $CA_CERT_DIR
fi

# make the cert
# NB: cert extension must be .crt for update-ca-certificates
# to discover it in /usr/local/share/ca-certificates
openssl req \
  -x509 \
  -new \
  -keyout $CA_CERT_DIR/$1.key \
  -out $CA_CERT_DIR/$1.crt \
  -config $CONF_DIR/$1.conf
