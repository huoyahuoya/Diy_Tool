#!/bin/bash

islock=true
flag=1

function mCurrentFocus() {
  adb shell dumpsys window | grep mCurrentFocus > a.txt
  awk  '{print $3}' ./a.txt > b.txt
  awk -F '[}]' '{print $1}' ./b.txt > c.txt
  PACKAGES=`awk -F '[/]' '{print $1}' ./c.txt`
}

function unlock() {
  if [[ $flag =~ '1' ]];then
    ARRAY=($(adb shell wm size));
    height=$[${ARRAY[2]#*x}-50]
    length=$[${ARRAY[2]%x*}/2]
    adb shell input keyevent 26
    adb shell input swipe $length $height $length 0
    adb shell input swipe 360 1440 360 0
    adb shell settings put system screen_off_timeout 1800000
    flag=2
  fi
}

function islocked() {
  ARRAY=($(adb shell dumpsys window policy| grep mDreamingLockscreen))
  islock=${ARRAY[1]#*=}
}

adb logcat -b all -c

while true
do
  islocked
  if [[ ! $islock =~ 'true' ]];then
      echo "解锁桌面"
      break
    else
      unlock
  fi
  unlock
done

mCurrentFocus
echo $PACKAGES
adb shell pm path $PACKAGES
adb shell ps | grep $PACKAGES | tee d.txt
PID_ID=($(awk  '{print $2}' ./d.txt))
rm a.txt b.txt c.txt d.txt
echo "选择进程，查看log"
read num
num=$[${num}-1]
echo adb logcat --pid=${PID_ID[$num]}
adb logcat --pid=${PID_ID[$num]}
