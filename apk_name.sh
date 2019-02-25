#!/bin/bash

adb shell pm list packages > p.txt 

awk -F: '{text="adb shell pm path  "$2;system(text)}'  ./p.txt > apk.txt

awk -F '[/]' '{print $NF}'  ./apk.txt  > remove_patch.txt

awk -F '[.]' '{print "app-"$1}'  ./remove_patch.txt  > apk_name.txt

rm p.txt
rm apk.txt
rm remove_patch.txt