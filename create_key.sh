size=$1
if test -z "$size"
then
    echo Missing size
    exit
fi
openssl genrsa $size
