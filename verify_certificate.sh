CAFILE="$1"
CERT="$2"

if test $# -lt 2
then
    echo "Usage: $0 ca_file cert"
    exit
fi

openssl verify -CAfile "$CAFILE" "$CERT"
