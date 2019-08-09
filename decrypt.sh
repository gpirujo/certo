PASS="$1"

if test $# -lt 1
then
    echo "Usage: $0 password"
    exit
fi

openssl enc -aes-256-cbc -d -k "$PASS"
