#!/usr/bin/env bash
project_dst='~/Documents/Projects'
echo 'enter the name of the repo:'
read repo
if [[ -d project_dst/$repo || -e project_dst/$repo  ]];then echo " The name is already taken in $(readlink -f $project_dst)";exit 1
fi
echo 'enter github username:'
read username
echo 'Would you like to enter description[y/n]:'
read description_answer 
while  [[ "$description_answer" != 'y' ]] && [[ "$description_answer" != 'n' ]] ; do 
echo 'Would you like to enter description[y/n]:'
read description_answer 
done
if [[ $description_answer == 'y' ]];then echo 'enter description'; 
 read description
 fi
echo 'is it private [y/n]:'
read is_it_private 
while  [[ "$is_it_private" != 'y' ]] && [[ "$is_it_private" != 'n' ]] ; do 
echo 'is it private [y/n]:'
read is_it_private 
done
if [[ $is_it_private == 'y' ]];then  is_it_private=true 
else is_it_private=false
 fi
 if [[ -z "$description" ]]; then description='' ;fi
curl -u  $username https://api.github.com/user/repos -d   "{\"name\":\"$repo\",\"description\":\"$description\",\"private\":$is_it_private }"
git clone https://github.com/$username/$repo.git

