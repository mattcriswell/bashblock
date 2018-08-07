#!/bin/bash 
echo $'hello \n\a' 

declare -A butts

butts[salt]=123
butts[old_hash]="abcd123basdf"
butts[something]="wut m8?"

echo -n ${butts[salt]} ${butts[something]} ${butts[old_hash]}

echo ""
echo ""
upper_range=100000
block=2
nounce=salty
data="the payload"
hash_flag=000
echo ""
echo -n $(openssl rand -hex 8)$block$nounce$data
echo ""
for i in {1..10000}; do echo -n $(openssl rand -hex 8)${block}${nounce}${data}| sha256sum; done | egrep ^${hash_flag}
