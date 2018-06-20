# create a certificate authority and add to
# local machines authorities
cd ca
./create-ca.sh big-org
./install-ca.sh big-org

cd ..

# create a certificate signed by the ca and test
cd signed
./create-signed-certificate.sh localhost ../ca/certs/big-org
./test-cert.sh localhost

cd ..

# remove the root authority from the machine
cd ca
./remove-ca.sh big-org
