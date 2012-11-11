#!/bin/bash
/usr/bin/x11vnc -noipv6 -shared -forever $3 -display $1 -ncache_cr -noxdamage -rfbport $2
