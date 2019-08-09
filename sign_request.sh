CSR="$1"
DAYS="$2"
CACERT="$3"
CAKEY="$4"
CASRL="$5"

if test $# -lt 5
then
    echo "Usage: bash $0 csr validity_days ca_cert ca_key ca_srl"
    exit
fi

openssl x509 -req -in "$CSR" -days "$DAYS" -CA "$CACERT" -CAkey "$CAKEY" -CAserial "$CASRL"
