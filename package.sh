#!/bin/bash

if [ ! -n "$1" ] ;then
    adb shell pm list packages
else
    adb shell pm list packages | grep  $1  > a.txt
    ARRAY=($(awk -F '[:]' '{print $2}' a.txt));
    for i in ${ARRAY[*]}
    do
      echo -e $i  '\t' `adb shell pm path $i`
    done
    rm a.txt
fi
