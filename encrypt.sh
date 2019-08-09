PASS="$1"

if test $# -lt 1
then
    echo "Usage: $0 password" >/dev/stderr
    exit
fi

openssl enc -aes-256-cbc -salt -k "$PASS"
