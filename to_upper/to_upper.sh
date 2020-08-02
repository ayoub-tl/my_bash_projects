#!/usr/bin/env bash

to_upper_case(){

  local i
  for  i in $(ls $1) ;do

    if [[ -d $1/$i ]];then
      to_upper_case  $1/$i
    fi;

    file=$(echo $i | awk -F. '{print $1}')
    ext=$(echo $i | awk -F. '{print $2}')

    if [[ "${file^^}" == $file  ]];then  continue ;fi   

    if [[ -z $ext ]] ;then 
      mv "$1/$file" "$1/${file^^}"
    else 
      mv "$1/$file.$ext" "$1/${file^^}.$ext";
    fi

  done


}

to_upper_case  $1
