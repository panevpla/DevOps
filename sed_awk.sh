#! /bin/bash

ids=$(yq '.ID[]' < ids.yml | awk '/^-/{print $2}')
echo "$ids" | wc -l

to_stay=""
to_be_deleted=""


for i in ${ids}; do
    if [[ $i == *delete* ]]; then
        echo -e "ID ${i} will be deleted"
        to_be_deleted+="\n$i"
        sed -i'' -e "/$i/d" ids.yml
    else
        to_stay+="$i\n"
    fi
done

echo 'Not deleted:'
echo -e "\n$to_stay"

echo 'deleted:'
echo -e "\n$to_be_deleted"
