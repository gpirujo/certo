CONFIG="$1"
KEYFILE="$2"

if test $# -lt 2
then
    echo "Usage: $0 config_file key_file"
    exit
fi

openssl req -new -config "$CONFIG" -key "$KEYFILE"
