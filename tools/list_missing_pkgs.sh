#!/bin/bash

# shellcheck disable=SC2162
sort -u pkglist.txt | grep -v '#' | while read x; 
do 
  if [ "x$x" != "x" ]; 
  then 
    if ! pacman -Q | grep "^$x" > /dev/null; 
    then 
      echo "$x"; 
    fi;
  fi; 
done

