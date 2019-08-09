# Certo

## Create a client certificate

Create the configuration file, passing the Common Name and any additional SAN as arguments.

```
bash create_config.sh '*.old.com' old.com | tee old.com.conf
```

Create the private key.

```
bash create_key.sh | tee old.com.key
```

Create the CSR.

```
bash create_csr.sh | tee old.com.csr
```

Guess Comodo's hashes for CNAME validation.

```
bash comodo_hashes.sh old.com.csr
```

## Set up a certificate authority

Create a random seed.

```
bash create_rand.sh | tee authority.rnd
```

Create a serial counter.

```
bash create_serial.sh | tee authority.srl
```

Create the authority key.

```
RANDFILE=authority.rnd bash create_key.sh | tee authority.key
```

Edit the authority configuration.

```
cat > authority.conf
[req]
distinguished_name = req_distinguished_name
req_extensions = v3_req
prompt = no

[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth

[req_distinguished_name]
C = NL
ST = North-Holland
L = Hoofddorp
O = OLD B.V.
OU = Technical Department
CN = Certificate Authority
```

Create the authority certificate.

```
RANDFILE=authority.rnd bash create_authority_certificate.sh authority.key authority.conf 3650 | tee authority.pem
```

## Use a certificate authority

Sign a CSR.

```
RANDFILE=authority.rnd bash sign_request.sh website.csr 365 authority.pem authority.key authority.srl | tee old.com.crt
```

Verify the signature against the authority's public key.

```
bash verify_certificate.sh authority.pem old.com.crt
```
