#! /usr/bin/bash
#a function that check if folder exist if not it creats it and display a message 
create_a_folder() {
  green=`tput setaf 2`
  normal=`tput sgr 0`
  if [[ ! -d $1 ]];then
    echo "${green}$2 ${normal}folder has been created"
    mkdir $1;
    fi
}

project_dst="/home/$(whoami)/Documents/Projects"
if [[ -z $1 ]];then 
 echo "script name is not defined "
 exit 1;fi

#check if it a python or bash script 
if [[ "$1" =~ [\w_-]*\.(py|sh) ]];then 
    extension=$(echo "$1" | awk -F. '{print $2}')
else 
    echo "Invalid name , The name of the script must be a shell script(.sh) or pytohn(.py)"
    exit 2 ;fi

create_a_folder  /home/$(whoami)/Documents  Documents
create_a_folder  $project_dst Projects
create_a_folder  $project_dst/$extension $extension

cd  $project_dst/$extension

if [[ -e $1 ]];then
    echo "Cannot create a file with the name: $1(already exist)"
    exit 3 ; fi
touch $1
echo "Your script is now in $project_dst/$extension/$1"
if [[ $extension == "py" ]]; then
 echo "#!/usr/bin/env python3" >> $1
elif [[ $extension == "sh" ]] ;then
 echo "#!/usr/bin/env bash">> $1
 fi
 
chmod +x $1 
code $1