#!/bin/bash

source run.conf

./startxvfb.sh :"$displayNum" "$displayMode" &
./startx11vnc.sh :"$displayNum" 59"$displayNumPadded" "$x11vncOpts" &

while true
do
./startapp.sh
sleep 1s
done
