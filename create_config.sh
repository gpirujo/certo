cat <<END
[req]
distinguished_name = req_distinguished_name
req_extensions = v3_req
prompt = no

[req_distinguished_name]
C = NL
ST = North-Holland
L = Hoofddorp
O = OLD B.V.
OU = Technical Department
CN = $1

[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
END

if test $# -gt 1
then

    cat <<END
subjectAltName = @alt_names

[alt_names]
END

    i=0
    for name in $@
    do
        i=$[ $i + 1 ]
        echo DNS.$i = $name
    done
fi
