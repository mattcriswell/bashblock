#!/bin/bash 
echo $'hello\n' 

upper_range=100000
block=2
nounce=salty
data="the payload"
hash_flag=00
echo "mining for hashes starting with $hash_flag"
while true; do
	echo -n $(openssl rand -hex 8)${block}${nounce}${data}|sha256sum |egrep ^${hash_flag}
done
