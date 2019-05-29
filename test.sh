#!/bin/bash

ARRAY=($(adb shell wm size));
for i in ${ARRAY[*]}
do
  echo -e $i  '\t' `adb shell pm path $i`
done

length=${ARRAY[2]#*x}
height=$[${ARRAY[2]%x*}/2]

echo length $length
echo height $height
