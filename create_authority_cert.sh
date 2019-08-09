CONFIG="$1"
KEYFILE="$2"
DAYS="$3"

if test $# -lt 3
then
    echo "Usage: $0 config_file key_file validity_days"
    exit
fi

openssl req -x509 -new -nodes -key "$KEYFILE" -config "$CONFIG" -days "$DAYS"
