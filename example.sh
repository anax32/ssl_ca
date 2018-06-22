export CA_CERT_DIR="certs/ca"
export SIGNED_CERT_DIR="certs/signed"

# create a certificate authority and add to
# local machines authorities
ca/create-ca.sh CA_ORG
ca/install-ca.sh CA_ORG

# create a certificate signed by the ca and test
signed/create-signed-certificate.sh LOCALHOST CA_ORG
signed/test-cert.sh LOCALHOST

# remove the root authority from the machine
ca/remove-ca.sh CA_ORG

# cleanup
rm -drf $CA_CERT_DIR
rm -drf $SIGNED_CERT_DIR

# bit of a hack here because rm doesn't remve the certs dir
rm -drf "certs"
