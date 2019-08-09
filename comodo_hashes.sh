cat $1 | grep -v -- ----- | base64 -D | md5
cat $1 | grep -v -- ----- | base64 -D | shasum -a 256 | sed 's,.\{32\},&.,'
