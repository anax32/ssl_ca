Self signed CA and certificates
-------------------------------

Bunch of scripts to create a local certificate authority (CA)
and sign certificates using that CA.

Allows applications on localhost to be tested with ssl.

example.sh
----------

Contains an example run through the scripts.

+ conf\ORG_NAME.conf

    config file for the root CA, this creates the crt
file that needs to be installed on the machine

+ conf\LOCALHOST.conf

    config file for the certificate signed by the CA,
this creates the file that is used to prove identity
(according to the CA)

certificates are written to:

+ certs\ca
+ certs\signed
