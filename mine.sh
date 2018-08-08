#!/bin/bash 
num_pow=3
solutions=()
block=2
nounce=salty
data="the payload"
hash_flag=00
found_count=0
echo "mining for ${num_pow} hashes starting with $hash_flag"
while true; do
	#Put all our items together, hash them, and see if it meets the criteria
	found_hash=$(echo -n $(openssl rand -hex 8)${block}${nounce}${data}|sha256sum |egrep ^${hash_flag})
	#If our grep was a success, add the hash to the solutions array (after we clean it up some)
	if [[ $? == 0 ]]
	then solutions+=($(echo ${found_hash}|tr -d '   -')) && let "found_count++"; 
			if [[ ${found_count} -ge ${num_pow} ]]
				then break; 
			fi
	fi
done
echo "First found solutions:"
for i in "${solutions[@]}"
do
	echo $i
done
