#!/bin/bash

cat pkglist.txt |sort -u| grep -v '#' | while read x; 
do 
  if [ "x$x" != "x" ]; 
  then 
    if ! pacman -Q | grep "^$x" > /dev/null; 
    then 
      echo "$x"; 
    fi;
  fi; 
done

