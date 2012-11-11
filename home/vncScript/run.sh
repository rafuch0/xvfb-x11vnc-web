#!/bin/bash

source run.conf

displayNumPadded=$(printf %02d $displayNum)
export displayNumPadded

IFS=x read -r width height bpp <<< "$displayMode"
halfWidth=$(($width/2))
halfHeight=$(($height/2))

HTTPData=$(cat << END_HERE

<HTML><TITLE>$progTitle</TITLE>
<body bgcolor="black">
<APPLET CODE=VncViewer.class ARCHIVE=VncViewer.jar style="position: absolute; top: 50%; left: 50%; width: ${width}px; height: ${height}px; margin-top: -${halfHeight}px; margin-left: -${halfWidth}px;\">
<param name=PORT value=59$displayNumPadded>
<param name="Open New Window" value=no>
<param name="DisableSSL" value=yes>
<param name="Show Controls" value=no>
<param name="Show offline desktop" value=no>
<param name="Defer screen updates" value=0>
<param name="Defer update requests" value=0>
<param name="Defer cursor updates" value=0>
<param name="Scaling factor" value=100>
<param name="JPEG image quality" value="4">
<!--
<param name="Cursor shape updates" value="Disable">
<param name="Scale remote cursor" value="50%">
<param name="Encoding" value="Hextile">
<param name="JPEG image quality" value="JPEG off">
-->
</APPLET></body></HTML>

END_HERE
)

echo $HTTPData > HTTP/index.vnc

killall Xvfb
killall x11vnc
killall cpulimit
killall $progExe

sleep 2s
./restartapp.sh

killall Xvfb
killall x11vnc
