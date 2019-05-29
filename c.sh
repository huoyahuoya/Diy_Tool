#!/bin/bash

function mCurrentFocus() {
  adb shell dumpsys window | grep mCurrentFocus > a.txt

  awk  '{print $3}' ./a.txt > b.txt

  awk -F '[}]' '{print $1}' ./b.txt > c.txt

  PACKAGES=`awk -F '[/]' '{print $1}' ./c.txt`

  echo $PACKAGES
}

mCurrentFocus

if [ $PACKAGES == 'StatusBar' ];then
    echo "当前未解锁桌面"
    adb shell input keyevent 26
    adb shell input swipe 365 1281 365 50
    sleep 2
    mCurrentFocus
fi

adb shell pm path $PACKAGES

adb shell ps | grep $PACKAGES | tee d.txt

PID_ID=`awk  '{print $2}' ./d.txt`

rm a.txt b.txt c.txt d.txt

echo "回车查看log"
read ENTER
adb logcat -c
adb logcat --pid=$PID_ID
