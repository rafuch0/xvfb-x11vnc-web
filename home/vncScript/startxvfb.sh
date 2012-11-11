#!/bin/bash
/usr/bin/Xvfb $1 -screen 0 $2 -nolisten tcp -shmem &
