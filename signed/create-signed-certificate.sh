#!/bin/bash

function help {
  echo "create-signed-certificate <cert-name> <ca-name>"
  echo "  make a signed certificate for <cert-name>.conf"
  echo "  signed by <ca-name>.crt"
  echo "  requires env variable SIGNED_CERT_DIR for output"
  echo "  requires env variable CA_CERT_DIR for input"
  exit
}

if [ -z "$1" ]; then
  help
fi

#SIGNED_CERT_DIR="certs"
CONF_DIR="conf"
ROOT_NAME=$2

if [ ! -d $SIGNED_CERT_DIR ]; then
  mkdir -p $SIGNED_CERT_DIR
fi

# create a key
openssl req \
  -nodes \
  -new \
  -keyout $SIGNED_CERT_DIR/$1.key \
  -out $SIGNED_CERT_DIR/$1.csr \
  -config $CONF_DIR/$1.conf

# sign with root ca
# NB increment set_serial with each invocation
openssl x509 \
  -req \
  -in $SIGNED_CERT_DIR/$1.csr \
  -CA $CA_CERT_DIR/$ROOT_NAME.crt \
  -CAkey $CA_CERT_DIR/$ROOT_NAME.key \
  -set_serial 127 \
  -out $SIGNED_CERT_DIR/$1.crt \
  -extfile $CONF_DIR/$1.conf \
  -extensions x509_ext
