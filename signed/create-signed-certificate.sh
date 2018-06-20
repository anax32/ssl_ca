#!/bin/bash

function help {
  echo "create-signed-certificate <cert-name> <ca-name>"
  echo "  make a signed certificate for <cert-name>.conf"
  echo "  signed by <ca-name>.crt"
  exit
}

if [ -z "$1" ]; then
  help
fi

CERT_DIR="certs"
ROOT_NAME=$2

if [ ! -d $CERT_DIR ]; then
  mkdir $CERT_DIR
fi

# create a key
openssl req \
  -nodes \
  -new \
  -keyout $CERT_DIR/$1.key \
  -out $CERT_DIR/$1.csr \
  -config $1.conf

# sign with root ca
# NB increment set_serial with each invocation
openssl x509 \
  -req \
  -in $CERT_DIR/$1.csr \
  -CA $ROOT_NAME.crt \
  -CAkey $ROOT_NAME.key \
  -set_serial 127 \
  -out $CERT_DIR/$1.crt \
  -extfile $1.conf \
  -extensions x509_ext
