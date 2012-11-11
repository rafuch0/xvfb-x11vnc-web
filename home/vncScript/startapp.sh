#!/bin/bash

source run.conf

killall "$progExe"
killall cpulimit

cpulimit -e "$progExe" -l "$cpuLimit" &

DISPLAY=:"$displayNum" "$progDir"/"$progExe" $progOpts
