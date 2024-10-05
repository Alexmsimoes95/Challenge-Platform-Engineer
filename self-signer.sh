#!/bin/bash

rm -f ca-key.pem ca-cert.pem

# Generate CA private key
openssl genpkey -algorithm RSA -out ca-key.pem

# Generate CA certificate
openssl req -x509 -new -nodes -key ca-key.pem -sha256 -days 1024 -out ca-cert.pem -subj "/C=US/ST=Texas/L=Austin/O=TomcatCompany/OU=IT/CN=tomcat-company.challenge"
